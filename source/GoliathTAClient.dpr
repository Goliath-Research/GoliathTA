program GoliathTAClient;

uses
  uROComInit,
  Forms,
  MidasLib,
  fClientForm in 'fClientForm.pas' {ClientForm},
  fClientDataModule in 'fClientDataModule.pas' {ClientDataModule: TDAClientDataModule},
  frameLogon in 'frameLogon.pas' {frmLogon: TFrame},
  frameConfig in 'frameConfig.pas' {frmConfig: TFrame},
  frameResultadosPendientes in 'frameResultadosPendientes.pas' {frmResultadosPendientes: TFrame},
  frameNewUsers in 'frameNewUsers.pas' {frmNewUsers: TFrame},
  frameDptoByPayroll in 'frameDptoByPayroll.pas' {frmDptoByPayroll: TFrame},
  fDepartamento in 'fDepartamento.pas' {frmDepartamento},
  fExcepcion in 'fExcepcion.pas' {frmExcepcion},
  fOperador in 'fOperador.pas' {frmOperador},
  fMunicipio in 'fMunicipio.pas' {frmMunicipio},
  fFeriado in 'fFeriado.pas' {frmFeriado},
  fHorario in 'fHorario.pas' {frmHorario},
  GoliathTALibrary_Intf in 'GoliathTALibrary_Intf.pas',
  fTrabajador in 'fTrabajador.pas' {frmTrabajador},
  fNomina in 'fNomina.pas' {frmNomina},
  fSitio in 'fSitio.pas' {frmSitio},
  fJornada in 'fJornada.pas' {frmJornada},
  frameDptoByDay in 'frameDptoByDay.pas' {frmDptoByDay: TFrame},
  frameDptoByWeek in 'frameDptoByWeek.pas' {frmDptoByWeek: TFrame},
  frameNewDevices in 'frameNewDevices.pas' {frmNewDevices: TFrame},
  frameNominaFacts in 'frameNominaFacts.pas' {frmNominaFacts: TFrame},
  framePivotNomina in 'framePivotNomina.pas' {frmPivotNomina: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientDataModule, ClientDataModule);
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TfrmDepartamento, frmDepartamento);
  Application.CreateForm(TfrmExcepcion, frmExcepcion);
  Application.CreateForm(TfrmOperador, frmOperador);
  Application.CreateForm(TfrmMunicipio, frmMunicipio);
  Application.CreateForm(TfrmFeriado, frmFeriado);
  Application.CreateForm(TfrmHorario, frmHorario);
  Application.CreateForm(TfrmTrabajador, frmTrabajador);
  Application.CreateForm(TfrmNomina, frmNomina);
  Application.CreateForm(TfrmSitio, frmSitio);
  Application.CreateForm(TfrmJornada, frmJornada);
  Application.Run;
end.
