unit fClientDataModule;

interface

uses 
  {vcl:} SysUtils, Classes, DB, DBClient, 
  {RemObjects:} uROClient, uROClientIntf, uRORemoteService, uROBinMessage, uROSuperTcpChannel, 
  {Data Abstract:} uDADataTable, uDABin2DataStreamer, uDAInterfaces, uDARemoteDataAdapter,
  uDAScriptingProvider, uDAMemDataTable, uDADataStreamer, uDAPSScriptingProvider,
  uROSynapseSuperTCPChannel, uDARemoteCommand,
  GoliathTALibrary_Intf, uPSComponent_Default, uPSComponent_DB, uPSComponent;

type
  TClientDataModule = class(TDataModule)
    Message: TROBinMessage;
    RemoteService: TRORemoteService;
    DataStreamer: TDABin2DataStreamer;
    RemoteDataAdapter: TDARemoteDataAdapter;
    tbl_dboAcceso: TDAMemDataTable;
    ds_dboAcceso: TDADataSource;
    tbl_dboAsignacion: TDAMemDataTable;
    ds_dboAsignacion: TDADataSource;
    tbl_dboClasses: TDAMemDataTable;
    ds_dboClasses: TDADataSource;
    tbl_dboDepartamento: TDAMemDataTable;
    ds_dboDepartamento: TDADataSource;
    tbl_dboDia: TDAMemDataTable;
    ds_dboDia: TDADataSource;
    tbl_dboExcepcion: TDAMemDataTable;
    ds_dboExcepcion: TDADataSource;
    tbl_dboFichadas: TDAMemDataTable;
    ds_dboFichadas: TDADataSource;
    tbl_dboJornada: TDAMemDataTable;
    ds_dboJornada: TDADataSource;
    tbl_dboJornadaTipo: TDAMemDataTable;
    ds_dboJornadaTipo: TDADataSource;
    tbl_dboLectora: TDAMemDataTable;
    ds_dboLectora: TDADataSource;
    tbl_dboNomina: TDAMemDataTable;
    ds_dboNomina: TDADataSource;
    tbl_dboNominas: TDAMemDataTable;
    ds_dboNominas: TDADataSource;
    tbl_dboObjects: TDAMemDataTable;
    ds_dboObjects: TDADataSource;
    tbl_dboPeriodo: TDAMemDataTable;
    ds_dboPeriodo: TDADataSource;
    tbl_dboPeriodoJornada: TDAMemDataTable;
    ds_dboPeriodoJornada: TDADataSource;
    tbl_dboSitio: TDAMemDataTable;
    ds_dboSitio: TDADataSource;
    tbl_Trabajador: TDAMemDataTable;
    ds_Trabajador: TDADataSource;
    tbl_Operador: TDAMemDataTable;
    ds_Operador: TDADataSource;
    tbl_ConfigTree: TDAMemDataTable;
    ds_ConfigTree: TDADataSource;
    Channel: TROSynapseSuperTcpChannel;
    tbl_NewDevices: TDAMemDataTable;
    ds_NewDevices: TDADataSource;
    tbl_NewUsers: TDAMemDataTable;
    ds_NewUsers: TDADataSource;
    tbl_dboFeriados: TDAMemDataTable;
    ds_dboFeriados: TDADataSource;
    spCmd: TDARemoteCommand;
    tbl_viewJefesDeDeptoSinOperador: TDAMemDataTable;
    ds_viewJefesDeDeptoSinOperador: TDADataSource;
    tbl_CalculosDiariosNoAprobados: TDAMemDataTable;
    ds_CalculosDiariosNoAprobados: TDADataSource;
    sp_FichadasNoAprobadas: TDAPSScriptingProvider;
    PluginClasses: TPSImport_Classes;
    PluginDB: TPSImport_DB;
    PluginDateUtils: TPSImport_DateUtils;
    tbl_Municipio: TDAMemDataTable;
    ds_Municipio: TDADataSource;
    tbl_CalculosSemanalesNoAprobados: TDAMemDataTable;
    ds_CalculosSemanalesNoAprobados: TDADataSource;
    tbl_CalculosTrabajadorNoAprobados: TDAMemDataTable;
    ds_CalculosTrabajadorNoAprobados: TDADataSource;
    tbl_viewResultadosPendientes: TDAMemDataTable;
    ds_viewResultadosPendientes: TDADataSource;
    tbl_viewNominaFacts: TDAMemDataTable;
    ds_viewNominaFacts: TDADataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FService       : IGoliathTAService;
  public
    { Public declarations }
    OperadorID     : integer;
    Autoridad      : integer;
    JefeID         : integer;
//    DepartamentoID : integer;
    NominaID       : integer;
    Fecha1, Fecha2 : TDateTime;

    function  TryLogin(oper, pass : string) : boolean;
    procedure LocateDepartamento;
    procedure LocateNominaActiva;
    procedure UpdateFirstNomina;

    function  CreateNewLectora   (Nombre : string; SitioID, DeviceID : integer) : boolean;
    function  CreateNewTrabajador(Nombre : string; DeptoID, BioAdminID : integer) : boolean;

    procedure CreateNewMunicipio (Nombre : string; var ID : integer);
    procedure CreateNewSitio     (Nombre : string; MunicipioID : integer; var ID : integer);
    procedure CreateNewDepto     (Nombre : string; SitioID : integer; var ID : integer);
    procedure CreateNewPeriodo   (Nombre : string; var ID : integer);
    procedure CreateFirstNomina  (Fecha : TDateTime; var ID : integer);
    procedure CreateNewNomina    (var ID : integer);
    procedure CreateNewFeriado   (Nombre : string; Fecha : TDateTime; var ID : integer);
    procedure CreateNewJornada   (Nombre : string; Hora1, Hora2 : integer; var ID : integer);
    procedure CreateNewOperador  (Operador, Password : string; Autoridad, TrabajadorID : integer; var ID : integer);
    procedure CreateNewExcepcion (TrabajadorID : integer; Fecha : TDateTime; JornadaID : integer; Laborable : boolean);

    procedure AsignarJefe        (TrabajadorID : integer; var OperadorID : integer);
    function  MoveToDepartamento (TrabajadorID, DepartamentoID : integer) : boolean;
    function  SetHorarioFavorito (ID : integer) : boolean;
    function  SetTurnoFavorito   (ID : integer) : boolean;

    function  UpdateCalculosDiarios    : boolean;
    function  UpdateCalculosSemanales  : boolean;
    function  UpdateCalculosTrabajador : boolean;
    function  CerrarNomina       : integer;

    function  DeleteMunicipio    (ID : integer) : boolean;
    function  DeleteSitio        (ID : integer) : boolean;
    function  DeleteDepto        (ID : integer) : boolean;
    function  DeleteLectora      (ID : integer) : boolean;
    function  DeleteTrabajador   (ID : integer) : boolean;
    function  DeletePeriodo      (ID : integer) : boolean;
    function  DeleteNomina       (ID : integer) : boolean;
    function  DeleteFeriado      (ID : integer) : boolean;
    function  DeleteJornada      (ID : integer) : boolean;
    function  DeleteOperador     (ID : integer) : boolean;
    function  DeleteExcepcion    (TrabajadorID : integer; Fecha : TDateTime) : boolean;
  end;

var
  ClientDataModule: TClientDataModule;

implementation

{$R *.dfm}

uses Variants, Dialogs, DataAbstract4_Intf;

procedure TClientDataModule.DataModuleCreate(Sender: TObject);
begin
  FService := RemoteService as IGoliathTAService;
end;

function TClientDataModule.SetHorarioFavorito(ID : integer) : boolean;
begin
  Result := spCmd.Execute('spSetHorarioFavorito', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.SetTurnoFavorito  (ID : integer) : boolean;
begin
  Result := spCmd.Execute('spSetTurnoFavorito', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteMunicipio(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteMunicipio', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteSitio(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteSitio', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteDepto(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteDepto', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteExcepcion(TrabajadorID: integer; Fecha: TDateTime): boolean;
var
  day, month, year : word;
begin
  DecodeDate(Fecha, year, month, day);

  Result := spCmd.Execute('spDeleteExcepcion', ['TrabajadorID', 'day', 'month', 'year'], [TrabajadorID, day, month, year]) <> 0;
end;

function TClientDataModule.DeleteLectora(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteLectora', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteTrabajador(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteTrabajador', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeletePeriodo(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeletePeriodo', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteNomina(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteNomina', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteFeriado(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteFeriado', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteJornada(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteJornada', ['ID'], [ID]) <> 0;
end;

function TClientDataModule.DeleteOperador(ID: integer): boolean;
begin
  Result := spCmd.Execute('spDeleteOperador', ['ID'], [ID]) <> 0;
end;

procedure TClientDataModule.CreateNewMunicipio(Nombre: string; var ID: integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'Nombre';
      Value := Nombre;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := 0;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewMunicipio', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewSitio(Nombre: string; MunicipioID : integer; var ID: integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'Nombre';
      Value := Nombre;
    end;
  with ip.Add do
    begin
      Name  := 'MunicipioID';
      Value := MunicipioID;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := 0;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewSitio', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewDepto(Nombre: string; SitioID: integer; var ID: integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'Nombre';
      Value := Nombre;
    end;
  with ip.Add do
    begin
      Name  := 'SitioID';
      Value := SitioID;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := 0;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewDepartamento', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewPeriodo(Nombre: string; var ID: integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'Nombre';
      Value := Nombre;
    end;
  with ip.Add do
    begin
      Name  := 'JornadaID';
      Value := 0;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := 0;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewPeriodo', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

function TClientDataModule.CerrarNomina: integer;
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  op := DataParameterArray.Create;
  try
    FService.ExecuteCommandEx('spCerrarNomina', ip, op);
    Result := op.Items[0].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateFirstNomina(Fecha : TDateTime; var ID : integer);
var
  ip, op : DataParameterArray;
  day, month, year : word;
begin
  DecodeDate(Fecha, year, month, day);

  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'day';
      Value := day;
    end;
  with ip.Add do
    begin
      Name  := 'month';
      Value := month;
    end;
  with ip.Add do
    begin
      Name  := 'year';
      Value := year;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := null;
    end;
  try
    FService.ExecuteCommandEx('spCreateFirstNomina', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewNomina  (var ID : integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := null;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewNomina', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewFeriado(Nombre : string; Fecha : TDateTime; var ID : integer);
var
  ip, op : DataParameterArray;
  day, month, year : word;
begin
  DecodeDate(Fecha, year, month, day);

  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'Nombre';
      Value := Nombre;
    end;
  with ip.Add do
    begin
      Name  := 'day';
      Value := day;
    end;
  with ip.Add do
    begin
      Name  := 'month';
      Value := month;
    end;
  with ip.Add do
    begin
      Name  := 'year';
      Value := year;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := null;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewFeriado', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewJornada(Nombre : string; Hora1, Hora2 : integer; var ID : integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'Nombre';
      Value := Nombre;
    end;
  with ip.Add do
    begin
      Name  := 'Hora1';
      Value := Hora1;
    end;
  with ip.Add do
    begin
      Name  := 'Hora2';
      Value := Hora2;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := null;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewJornada', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewOperador(Operador, Password : string; Autoridad, TrabajadorID : integer; var ID : integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'Operator';
      Value := Operador;
    end;
  with ip.Add do
    begin
      Name  := 'Password';
      Value := Password;
    end;
  with ip.Add do
    begin
      Name  := 'Autoridad';
      Value := Autoridad;
    end;
  with ip.Add do
    begin
      Name  := 'TrabajadorID';
      Value := TrabajadorID;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := null;
    end;
  try
    FService.ExecuteCommandEx('spCreateNewOperador', ip, op);
    ID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.CreateNewExcepcion(TrabajadorID : integer; Fecha : TDateTime; JornadaID : integer; Laborable : boolean);
var
  day, month, year : word;
  Jornada : Variant;
begin
  DecodeDate(Fecha, year, month, day);

  if Laborable
    then Jornada := year
    else Jornada := null;
  spCmd.Execute('spCreateNewException', ['TrabajadorID', 'day', 'month', 'year', 'JornadaID', 'Laborable'], [TrabajadorID, day, month, year, Jornada, Laborable]);
end;

procedure TClientDataModule.AsignarJefe(TrabajadorID: integer; var OperadorID: integer);
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'TrabajadorID';
      Value := TrabajadorID;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'OperadorID';
      Value := null;
    end;
  try
    FService.ExecuteCommandEx('spAsignarJefe', ip, op);
    OperadorID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

function TClientDataModule.CreateNewLectora   (Nombre : string; SitioID, DeviceID : integer) : boolean;
begin
  Result := spCmd.Execute('spCreateNewLectora', ['Nombre', 'SitioID', 'DeviceID'], [Nombre, SitioID, DeviceID]) <> 0;
end;

function TClientDataModule.CreateNewTrabajador(Nombre : string; DeptoID, BioAdminID : integer) : boolean;
begin
  Result := spCmd.Execute('spCreateNewTrabajador', ['Nombre', 'DepartamentoID', 'BioAdminID'], [Nombre, DeptoID, BioAdminID]) <> 0;
end;

procedure TClientDataModule.LocateDepartamento;
var
  ip, op : DataParameterArray;
begin
  ip := DataParameterArray.Create;
  with ip.Add do
    begin
      Name  := 'JefeID';
      Value := JefeID;
    end;
  op := DataParameterArray.Create;
  with op.Add do
    begin
      Name  := 'ID';
      Value := null;
    end;
  try
    FService.ExecuteCommandEx('spGetDepartamento', ip, op);
//    DepartamentoID := op.Items[1].Value;
  finally
    ip.Free;
    op.Free;
  end;
end;

procedure TClientDataModule.LocateNominaActiva;
begin
  with tbl_dboNomina do
    try
      Close;
      Filter   := 'Estado = 1';
      Filtered := true;
      Open;
      if Eof
        then NominaID := -1
        else
          begin
            NominaID := FieldByName('ID'    ).AsInteger;
            Fecha1   := FieldByName('Fecha1').AsDateTime;
            Fecha2   := FieldByName('Fecha2').AsDateTime;
          end;
    finally
      Close;
      Filtered := false;
    end;
end;

function TClientDataModule.TryLogin(oper, pass : string) : boolean;
begin
  try
    tbl_Operador.Open;
    try
      result := tbl_Operador.Locate('OPERATOR; PASSWORD', VarArrayOf([oper, pass]), [loCaseInsensitive])
    finally
      OperadorID := tbl_Operador.FieldByName('ID').AsInteger;
      Autoridad  := tbl_Operador.FieldByName('Autoridad').AsInteger;
      if Autoridad = 3
        then
        begin
          JefeID := tbl_Operador.FieldByName('TrabajadorID'  ).AsInteger;

//          LocateDepartamento;
        end;

      tbl_Operador.Close;
    end;
  except
    result := false;
  end;
end;

function TClientDataModule.MoveToDepartamento(TrabajadorID, DepartamentoID : integer) : boolean;
begin
  Result := spCmd.Execute('spMoveToDepto', ['TrabajadorID', 'DepartamentoID'], [TrabajadorID, DepartamentoID]) <> 0;
end;

function TClientDataModule.UpdateCalculosDiarios : boolean;
begin
  Result := spCmd.Execute('spUpdateFichadas', ['OperadorID'], [OperadorID]) <> 0;
end;

function TClientDataModule.UpdateCalculosSemanales : boolean;
begin
  Result := spCmd.Execute('spUpdateAprobacionSemanal', ['OperadorID'], [OperadorID]) <> 0;
end;

function TClientDataModule.UpdateCalculosTrabajador : boolean;
begin
  Result := spCmd.Execute('spUpdateAprobacionTrabajador', ['OperadorID'], [OperadorID]) <> 0;
end;

procedure TClientDataModule.UpdateFirstNomina;
begin
  spCmd.Execute('spUpdateFirstNomina', [], [])
end;

end.
