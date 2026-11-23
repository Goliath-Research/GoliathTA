"""Security spec for the biometric punch import.

The import must keep copying granted-access punches after a caller of the
attendance data service writes a punch id. These tests fail while that
watermark is the highest id stored in Acceso.

Run them against SQL Server 2019 (the engine used to confirm this behavior):

    sudo docker run -d --name goliath-sql \
        -e ACCEPT_EULA=Y \
        -e MSSQL_SA_PASSWORD=Placeholder1! \
        -e MSSQL_MEMORY_LIMIT_MB=2048 \
        -p 1433:1433 \
        mcr.microsoft.com/mssql/server:2019-latest
    python3 -m unittest tests.test_attendance_import_halt -v

MSSQL_SA_PASSWORD, if set, overrides the throwaway placeholder above.
SQL_DOCKER_CONTAINER overrides the container name (default: goliath-sql).
"""

import os
import re
import subprocess
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PASSWORD = os.environ.get("MSSQL_SA_PASSWORD", "Placeholder1!")
CONTAINER = os.environ.get("SQL_DOCKER_CONTAINER", "goliath-sql")
SQLCMD = "/opt/mssql-tools18/bin/sqlcmd"
MAX_INT = 2147483647

RELEASE_PROCEDURE = ROOT / "release" / "spImportEvents.sql"
SCHEMA = ROOT / "source" / "GoliathTA.daSchema"
BACKUP = ROOT / "database" / "GoliathTA.bak"


class SqlError(AssertionError):
    pass


def docker_cmd():
    probe = subprocess.run(
        ["docker", "info"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    if probe.returncode == 0:
        return ["docker"]
    return ["sudo", "docker"]


def run_sql(database, script, expect_ok=True):
    """Execute a T-SQL batch inside the SQL Server container."""
    command = docker_cmd() + [
        "exec",
        "-i",
        CONTAINER,
        SQLCMD,
        "-C",
        "-S",
        "localhost",
        "-U",
        "sa",
        "-P",
        PASSWORD,
        "-b",
        "-d",
        database,
        "-W",
        "-h",
        "-1",
    ]
    completed = subprocess.run(
        command,
        input=script.encode("latin1"),
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    output = (completed.stdout + completed.stderr).decode("latin1", "replace")
    if expect_ok and completed.returncode != 0:
        raise SqlError(output.strip())
    return completed.returncode, output


def select_ids(database="GoliathTA"):
    code, output = run_sql(database, "SELECT ID FROM dbo.Acceso ORDER BY ID;")
    ids = []
    for line in output.splitlines():
        line = line.strip()
        if re.fullmatch(r"-?\d+", line):
            ids.append(int(line))
    return ids


def reset_databases():
    script = r"""
IF DB_ID(N'GoliathTA') IS NOT NULL
BEGIN
  ALTER DATABASE GoliathTA SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE GoliathTA;
END
IF DB_ID(N'Tiempo y Asistencia') IS NOT NULL
BEGIN
  ALTER DATABASE [Tiempo y Asistencia] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE [Tiempo y Asistencia];
END
IF DB_ID(N'BioAdmin') IS NOT NULL
BEGIN
  ALTER DATABASE BioAdmin SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE BioAdmin;
END
CREATE DATABASE GoliathTA;
CREATE DATABASE [Tiempo y Asistencia];
CREATE DATABASE BioAdmin;
"""
    run_sql("master", script)


def create_acceso():
    # DeviceName is omitted by both shipped procedure bodies, and that INSERT
    # succeeds, so the column has to accept a missing value.
    run_sql(
        "GoliathTA",
        """
CREATE TABLE dbo.Acceso (
  ID int NOT NULL PRIMARY KEY,
  Fecha datetime NOT NULL,
  UserID int NOT NULL,
  UserName varchar(255) NOT NULL,
  DeviceID int NOT NULL,
  DeviceName varchar(255) NULL
);
""",
    )


def install_release_procedure():
    run_sql(
        "GoliathTA",
        "CREATE PROCEDURE spImportEvents AS BEGIN RETURN END",
    )
    run_sql("GoliathTA", RELEASE_PROCEDURE.read_bytes().decode("latin1"))
    run_sql(
        "Tiempo y Asistencia",
        """
CREATE TABLE dbo.tb_userinfo (
  nUserID int NOT NULL PRIMARY KEY,
  strUserName varchar(255) NOT NULL
);
CREATE TABLE dbo.tb_reportslist (
  nIndex int NOT NULL PRIMARY KEY,
  dtDateTime datetime NOT NULL,
  nUserID int NOT NULL,
  nDeviceID int NOT NULL,
  nEvent int NOT NULL
);
INSERT INTO dbo.tb_userinfo (nUserID, strUserName) VALUES (7, 'Ada');
""",
    )


def install_backup_procedure():
    text = backup_procedure_text()
    run_sql("GoliathTA", text)
    # viewEvents is not shipped in this repository. The procedure reads only
    # nIndex from it, and reads the punch columns from tb_reportslist.
    run_sql(
        "BioAdmin",
        """
CREATE TABLE dbo.tb_reportslist (
  nIndex int NOT NULL PRIMARY KEY,
  dtDateTime datetime NOT NULL,
  nUserID int NOT NULL,
  sUserName varchar(255) NOT NULL,
  nDeviceID int NOT NULL,
  nEvent int NOT NULL
);
""",
    )
    run_sql(
        "BioAdmin",
        "CREATE VIEW dbo.viewEvents AS SELECT nIndex FROM dbo.tb_reportslist;",
    )


def backup_procedure_text():
    blob = BACKUP.read_bytes()
    start = blob.find(b"CREATE   procedure spImportEvents")
    if start < 0:
        raise AssertionError("spImportEvents is not in the database backup")
    end = blob.find(b"end;", start)
    if end < 0:
        raise AssertionError("spImportEvents in the backup does not end")
    return blob[start : end + len(b"end;")].decode("latin1")


def add_release_punch(index, event, when):
    run_sql(
        "Tiempo y Asistencia",
        f"""
INSERT INTO dbo.tb_reportslist (nIndex, dtDateTime, nUserID, nDeviceID, nEvent)
VALUES ({index}, '{when}', 7, 1, {event});
""",
    )


def add_backup_punch(index, event, when):
    run_sql(
        "BioAdmin",
        f"""
INSERT INTO dbo.tb_reportslist
  (nIndex, dtDateTime, nUserID, sUserName, nDeviceID, nEvent)
VALUES ({index}, '{when}', 7, 'Ada', 1, {event});
""",
    )


def plant_punch(punch_id):
    run_sql(
        "GoliathTA",
        f"""
INSERT INTO dbo.Acceso (ID, Fecha, UserID, UserName, DeviceID)
VALUES ({punch_id}, '2024-06-01T00:00:00', 1, 'planted', 9);
""",
    )


def acceso_dataset_text():
    text = SCHEMA.read_text(encoding="latin1")
    name_at = text.find("<Name>dbo Acceso</Name>")
    if name_at < 0:
        raise AssertionError("schema does not publish dbo Acceso")
    datasets_at = text.rfind("<Datasets ", 0, name_at)
    return text[datasets_at:name_at], text[name_at : name_at + 1200]


def field_block(fields_region, field_name):
    match = re.search(
        rf"<DataType>([^<]*)</DataType>.*?<GeneratorName>([^<]*)</GeneratorName>.*?"
        rf"<InPrimaryKey>([^<]*)</InPrimaryKey>.*?<Name>{field_name}</Name>.*?"
        rf"<ReadOnly>([^<]*)</ReadOnly>",
        fields_region,
        re.DOTALL,
    )
    if not match:
        raise AssertionError(f"schema field {field_name} is missing")
    return {
        "data_type": match.group(1),
        "generator": match.group(2),
        "in_primary_key": match.group(3) == "True",
        "read_only": match.group(4) == "True",
    }


def service_source_text():
    chunks = []
    for path in (ROOT / "source").rglob("*"):
        if path.suffix.lower() in {".pas", ".dfm", ".rodl"} and path.is_file():
            chunks.append(path.read_text(encoding="latin1", errors="replace"))
    return "\n".join(chunks)


def dataset_updates_allowed():
    before, after = acceso_dataset_text()
    if "<IsPublic>True</IsPublic>" not in before[-400:]:
        return False
    if "<ReadOnly>False</ReadOnly>" not in after:
        return False
    if "<StatementType>stAutoSQL</StatementType>" not in after:
        return False
    if "<TargetTable>dbo.Acceso</TargetTable>" not in after:
        return False
    rules = re.search(
        r"<BusinessRulesServer.*?<Script>(.*?)</Script>",
        before,
        re.DOTALL,
    )
    if rules and rules.group(1).strip():
        return False
    identity = field_block(before, "ID")
    if identity["read_only"] or identity["generator"].strip():
        return False
    if identity["data_type"] != "datInteger":
        return False
    if not identity["in_primary_key"]:
        return False
    source = service_source_text()
    if re.search(r"Allowed\s*:=\s*False", source, re.IGNORECASE):
        if re.search(r"Acceso", source) or not re.search(
            r"aDatasetName|DatasetName", source
        ):
            return False
    return True


def direct_sql_allowed():
    source = service_source_text()
    if re.search(r"AllowExecuteSQL\s*(:=|=)\s*False", source, re.IGNORECASE):
        return False
    if re.search(r"Allowed\s*:=\s*False", source, re.IGNORECASE):
        return False
    # The shipped service sets AllowExecuteSQL and leaves the direct-SQL
    # validator allowing the call. Nothing in the source turns that off.
    return True


def attacker_can_plant_punch_id():
    return dataset_updates_allowed() or direct_sql_allowed()


class AttendanceImportTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        probe = subprocess.run(
            docker_cmd() + ["exec", CONTAINER, SQLCMD, "-?"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        if probe.returncode not in (0, 1):
            raise unittest.SkipTest(
                f"SQL Server container {CONTAINER} is not running"
            )

    def setUp(self):
        reset_databases()
        create_acceso()
        self.can_plant = attacker_can_plant_punch_id()

    def test_release_procedure_keeps_importing_new_granted_punches(self):
        install_release_procedure()
        add_release_punch(10, 55, "2024-01-01T08:00:00")
        add_release_punch(11, 55, "2024-01-01T12:00:00")
        add_release_punch(12, 54, "2024-01-01T13:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertEqual(select_ids(), [10, 11])

        add_release_punch(13, 55, "2024-01-02T08:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertEqual(select_ids(), [10, 11, 13])

    def test_release_client_punch_id_does_not_drop_lower_indexes(self):
        install_release_procedure()
        add_release_punch(10, 55, "2024-01-01T08:00:00")
        add_release_punch(11, 55, "2024-01-01T12:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertEqual(select_ids(), [10, 11])

        if self.can_plant:
            plant_punch(1000)
        add_release_punch(13, 55, "2024-01-02T08:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertIn(13, select_ids())

    def test_release_max_int_punch_id_does_not_stop_the_import(self):
        install_release_procedure()
        add_release_punch(10, 55, "2024-01-01T08:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")

        if self.can_plant:
            plant_punch(MAX_INT)
        add_release_punch(13, 55, "2024-01-02T08:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertIn(13, select_ids())

    def test_backup_procedure_client_punch_id_does_not_drop_lower_indexes(self):
        install_backup_procedure()
        add_backup_punch(10, 55, "2024-01-01T08:00:00")
        add_backup_punch(11, 1, "2024-01-01T12:00:00")
        add_backup_punch(21, 40, "2024-01-03T08:00:00")
        # The backup procedure leaves its start null on an empty punch table,
        # so a previously stored index has to exist before it copies anything.
        try:
            plant_punch(9)
        except SqlError:
            pass
        run_sql("GoliathTA", "EXEC spImportEvents;")
        imported = select_ids()
        self.assertIn(10, imported)
        self.assertIn(21, imported)
        self.assertNotIn(11, imported)

        if self.can_plant:
            plant_punch(9000)
        add_backup_punch(22, 71, "2024-01-04T08:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertIn(22, select_ids())
        self.assertNotIn(11, select_ids())

    def test_backup_max_int_punch_id_does_not_stop_the_import(self):
        install_backup_procedure()
        add_backup_punch(10, 119, "2024-01-01T08:00:00")
        try:
            plant_punch(9)
        except SqlError:
            pass
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertIn(10, select_ids())

        if self.can_plant:
            plant_punch(MAX_INT)
        add_backup_punch(22, 39, "2024-01-04T08:00:00")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        run_sql("GoliathTA", "EXEC spImportEvents;")
        self.assertIn(22, select_ids())


if __name__ == "__main__":
    unittest.main()
