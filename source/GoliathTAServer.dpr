program GoliathTAServer;

{#ROGEN:GoliathTALibrary.RODL} // RemObjects SDK: Careful, do not remove!

uses
  uROComInit,
  uROComboService,
  Forms,
  fServerForm in 'fServerForm.pas' {ServerForm},
  GoliathTAService_Impl in 'GoliathTAService_Impl.pas' {GoliathTAService: TDARemoteService},
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule},
  GoliathTALibrary_Intf in 'GoliathTALibrary_Intf.pas',
  GoliathTALibrary_Invk in 'GoliathTALibrary_Invk.pas',
  UdgTextLog in '..\Goliat\UdgTextLog.pas',
  UdgConsumer in '..\Goliat\UdgConsumer.pas',
  UdgObjectList in '..\Goliat\UdgObjectList.pas',
  UdgObjects in '..\Goliat\UdgObjects.pas',
  UdgQueue in '..\Goliat\UdgQueue.pas',
  UdgThread in '..\Goliat\UdgThread.pas';

{$R *.res}
{$R RODLFile.res}

begin
  if ROStartService('GoliathTAServer', 'GoliathTAServer')
    then
      begin
        ROService.CreateForm(TServerDataModule, ServerDataModule);
        ROService.Run;
        Exit;
      end;

  Application.Initialize;
  Application.Title := 'GoliathTA Server';
  Application.CreateForm(TServerDataModule, ServerDataModule);
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
