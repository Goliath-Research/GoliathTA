unit fServerDataModule;

interface

uses
  SysUtils, Classes,
  uROClient, uROPoweredByRemObjectsButton, uROClientIntf, uROServer,
  uROBinMessage, uROSuperTcpServer,
  uDAEngine, uDADriverManager, uDAClasses, uROSessions,
  uDAIBXDriver, uDAADODriver, uROSynapseSuperTCPServer;

type
  TServerDataModule = class(TDataModule)
    Message: TROBinMessage;
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    ADODriver: TDAADODriver;
    SessionManager: TROInMemorySessionManager;
    Server: TROSynapseSuperTcpServer;
    DataDictionary: TDADataDictionary;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Start : boolean;
    function Stop  : boolean;
  end;

var
  ServerDataModule: TServerDataModule;

implementation

{$R *.dfm}

uses
  IniFiles;

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
begin
  Start;
end;

procedure TServerDataModule.DataModuleDestroy(Sender: TObject);
begin
  Server.Active := false;
end;

function TServerDataModule.Start : boolean;
// El único parámetro que requiere el Server es el puerto / socket a utilizar
// Por comodidad, se usará un archivo .INI
// También podría usarse el registro...
var
  IniFile  : TIniFile;
  Port     : integer;
  Driver   : string;
  DBServer : string;
  Database : string;
  UserID   : string;
  Password : string;
begin
  // Obtener los parámetros desde el archivo GoliathTAServer.INI

  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.INI'));

  try

    Server.Active := false;

    // Leer los parámetros o asignar los defaults

    Port     := IniFile.ReadInteger('Server'  , 'Port'    , 8095        );
    Driver   := IniFile.ReadString ('Database', 'Driver'  , 'SQLOLEDB.1');
    DBServer := IniFile.ReadString ('Database', 'Server'  , 'SERVER-W2K');
    Database := IniFile.ReadString ('Database', 'Database', 'GoliathTA' );
    UserID   := IniFile.ReadString ('Database', 'UserID'  , 'sa'        );
    Password := IniFile.ReadString ('Database', 'Password', 'incognito' );

    try
      Server.Port   := Port;

      //ADO?AuxDriver=SQLOLEDB.1;Server=SERVER-W2K;Database=GoliathTA;UserID=sa;Password=incognito;Schemas=1;

      ConnectionManager.Connections[0].ConnectionString :=
        Format
          (
            'ADO?AuxDriver=%s;Server=%s;Database=%s;UserID=%s;Password=%s;Schemas=1;',
            [
              Driver,
              DBServer,
              Database,
              UserID,
              Password
            ]
          );

      Server.Active := true;
    except
    end;

  finally
    IniFile.Free;
  end;

  Result := Server.Active = true;
end;

function TServerDataModule.Stop : boolean;
begin
  try
    Server.Active := false;
  except
  end;

  Result := Server.Active = false;
end;

end.
