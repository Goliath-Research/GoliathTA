unit fClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uROClient, uROClientIntf, uRORemoteService, uROBinMessage, Grids, DBGrids,
  cxStyles, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxPC,
  cxSplitter, ExtCtrls, dxNavBar, dxNavBarCollns, dxNavBarBase, ImgList, dxBar,
  dxBarExtItems, dxPrnDev, dxPSGlbl, dxPSUtl, dxPrnPg, dxBkgnd, dxWrap,
  dxPgsDlg, dxPSCore, dxPrnDlg, dxPSEngn, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPScxCommon, dxPScxGrid6Lnk,
  uDADataTable, Menus, cxLookAndFeelPainters, cxButtons, cxLabel, cxContainer,
  cxTextEdit,
  frameLogon, frameCards,
  dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxNavBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter, frameConfig,
  frameNewDevices, frameNewUsers, cxExportTL4Link, dxPScxTLLnk, frameDptoByDay,
  frameDptoByPayroll, frameDptoByWeek, frameResultadosPendientes,
  frameNominaFacts, framePivotNomina, cxExportPivotGridLink, dxPScxPivotGridLnk;

type
  TClientForm = class(TForm)
    NavBar: TdxNavBar;
    cxSplitter1: TcxSplitter;
    pc: TcxPageControl;
    nbGConfig: TdxNavBarGroup;
    LargeImagesNB: TImageList;
    nbGLogOn: TdxNavBarGroup;
    nvILogOn: TdxNavBarItem;
    tsLogOn: TcxTabSheet;
    bm: TdxBarManager;
    tbGrid: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    LargeImagesBM: TImageList;
    btnRequery: TdxBarLargeButton;
    dxBarSeparator1: TdxBarSeparator;
    btnExportToHTML: TdxBarLargeButton;
    btnExportToExcel: TdxBarLargeButton;
    btnExportToText: TdxBarLargeButton;
    btnExportToXML: TdxBarLargeButton;
    SaveDialog1: TSaveDialog;
    btnPrint: TdxBarLargeButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    nvIConfig: TdxNavBarItem;
    tsConfig: TcxTabSheet;
    pnlBody: TPanel;
    frmConfig1: TfrmConfig;
    nbGTasks: TdxNavBarGroup;
    nvINewDevices: TdxNavBarItem;
    nvINewUsers: TdxNavBarItem;
    tsNewDevices: TcxTabSheet;
    tsNewUsers: TcxTabSheet;
    frmNewUsers1: TfrmNewUsers;
    dxComponentPrinter1Link2: TcxDBTreeListReportLink;
    nvIDptoByDay: TdxNavBarItem;
    tsDptoByDay: TcxTabSheet;
    frmDptoByDay1: TfrmDptoByDay;
    gp: TGridPanel;
    frmLogon1: TfrmLogon;
    nbGReports: TdxNavBarGroup;
    tsDptoByWeek: TcxTabSheet;
    tsDptoByPayroll: TcxTabSheet;
    frmDptoByWeek1: TfrmDptoByWeek;
    frmDptoByPayroll1: TfrmDptoByPayroll;
    nvIDptoByWeek: TdxNavBarItem;
    nvIDptoByPayroll: TdxNavBarItem;
    tsResultadosPendientes: TcxTabSheet;
    nvIResultadosPendientes: TdxNavBarItem;
    frmResultadosPendientes1: TfrmResultadosPendientes;
    frmNewDevices1: TfrmNewDevices;
    nvICerrarNomina: TdxNavBarItem;
    tsCerrarNomina: TcxTabSheet;
    nvINominaGrid: TdxNavBarItem;
    tsNominaGrid: TcxTabSheet;
    frmNominaFacts1: TfrmNominaFacts;
    nvINominaPivot: TdxNavBarItem;
    tsNominaPivot: TcxTabSheet;
    frmPivotNomina1: TfrmPivotNomina;
    dxComponentPrinter1Link3: TcxPivotGridReportLink;
    procedure btnRequeryClick(Sender: TObject);
    procedure btnExportToHTMLClick(Sender: TObject);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure btnExportToTextClick(Sender: TObject);
    procedure btnExportToXMLClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NavBarGroupClick(Sender: TObject; AGroup : TdxNavBarGroup);
    procedure NavBarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
  private
    { Private declarations }
    fOperator : string;

  public
    { Public declarations }
    g : TcxGrid;

    procedure SetOperator(anOperator : string);
  end;

var
  ClientForm: TClientForm;

implementation

uses
  IniFiles, fClientDataModule, cxGridExportLink,
  uROPleaseWaitForm;

{$R *.dfm}

procedure TClientForm.FormShow(Sender: TObject);
var
  IniFile : TIniFile;
  Host    : string;
  Port    : integer;
begin
  // Formulario común a todas las demoras

  PleaseWaitForm := TPleaseWaitForm.Create(ClientForm, '', 'Wait', nil, false);

  // Cargar la configuración

  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.INI'));

  with ClientDataModule do
    try
      Channel.Active := false;

      Host := IniFile.ReadString ('Server', 'Host', 'localhost');
      Port := IniFile.ReadInteger('Server', 'Port', 8095       );

      Channel.Host := Host;
      Channel.Port := Port;

      Channel.Active := true;
 (*
      tbl_Man.              MaxRecords := IniFile.ReadInteger('Client', 'MaxMan'              , -1);
      tbl_Card.             MaxRecords := IniFile.ReadInteger('Client', 'MaxCard'             , -1);
      tbl_CardIssue.        MaxRecords := IniFile.ReadInteger('Client', 'MaxCardIssue'        , -1);
      tbl_CardIssueGAL.     MaxRecords := IniFile.ReadInteger('Client', 'MaxCardIssueGAL'     , -1);
      tbl_viewMsgsAccess1.  MaxRecords := IniFile.ReadInteger('Client', 'MaxviewMsgsAccess1'  , -1);
      tbl_viewMsgsAccess2.  MaxRecords := IniFile.ReadInteger('Client', 'MaxviewMsgsAccess2'  , -1);
      tbl_viewMsgsAccess3.  MaxRecords := IniFile.ReadInteger('Client', 'MaxviewMsgsAccess3'  , -1);
      tbl_viewMsgsAccess4.  MaxRecords := IniFile.ReadInteger('Client', 'MaxviewMsgsAccess4'  , -1);
      tbl_viewMsgsAlarm5.   MaxRecords := IniFile.ReadInteger('Client', 'MaxviewMsgsAlarm5'   , -1);
      tbl_viewMsgsOperator6.MaxRecords := IniFile.ReadInteger('Client', 'MaxviewMsgsOperator6', -1);
 *)
      pc.ActivePage := tsLogOn;
    finally
      IniFile.Free;
    end;

  UseLatestCommonDialogs := false;
  fOperator := '';
end;

procedure TClientForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDataModule.Channel.Active := false;
end;

procedure TClientForm.SetOperator(anOperator: string);
begin
  fOperator := anOperator;
  Self.Caption := 'Goliath T&A Client - Usuario (' + fOperator + ')';
  MessageBox(Self.Handle, '¡Bienvenido a Goliath T&A!', 'Usuario identificado', MB_ICONEXCLAMATION + MB_OK);
  case ClientDataModule.Autoridad of
    1 : // Admin
      begin
        // Todo debe estar habilitado...
        nvIConfig.Visible     := true;
        nvINewUsers.Visible   := true;
        nvINewDevices.Visible := true;
        nvIDptoByDay.Visible     := false;
        nvIDptoByWeek.Visible    := false;
        nvIDptoByPayroll.Visible := false;
        nvIResultadosPendientes.Visible := true;
        nvICerrarNomina.Visible         := false;
      end;
    2 : // Jefe de Recursos Humanos
      begin
        // Inhabilitar tareas de Administrador
        nvIConfig.Visible     := true;
        nvINewUsers.Visible   := true;
        nvINewDevices.Visible := false;
        nvIDptoByDay.Visible     := false;
        nvIDptoByWeek.Visible    := false;
        nvIDptoByPayroll.Visible := false;
        nvIResultadosPendientes.Visible := true;
        nvICerrarNomina.Visible         := false;
      end;
    3 : // Jefe de Departamento
      begin
        // Inhabilitar tareas de Administrador y Jefe de Recursos Humanos
        nvIConfig.Visible     := true;
        nvINewUsers.Visible   := false;
        nvINewDevices.Visible := false;
        nvIDptoByDay.Visible     := true;
        nvIDptoByWeek.Visible    := true;
        nvIDptoByPayroll.Visible := true;
        nvIResultadosPendientes.Visible := false;
        nvICerrarNomina.Visible         := false;
      end;
  end;
end;

procedure TClientForm.NavBarGroupClick(Sender: TObject; AGroup : TdxNavBarGroup);
begin
  if (AGroup <> nbGLogOn) and (fOperator = '')
    then
      begin
        ShowMessage('Por favor, ¡Identifíquese!');
        Abort;
      end;
end;

procedure TClientForm.NavBarLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  if (ALink.Item.Tag <> 0) and (fOperator = '')
    then
      begin
        ShowMessage('Por favor, ¡Identifíquese!');
        Exit;
      end;

  // Se solicita activar el link del reporte o ts

  case ALink.Item.Tag of
    0  : pc.ActivePage  := tsLogOn;
    1  : pc.ActivePage  := tsConfig;
    2  : pc.ActivePage  := tsNewDevices;
    3  : pc.ActivePage  := tsNewUsers;
    4  : pc.ActivePage  := tsDptoByDay;
    5  : pc.ActivePage  := tsDptoByWeek;
    6  : pc.ActivePage  := tsDptoByPayroll;
    7  : pc.ActivePage  := tsResultadosPendientes;
    8  : pc.ActivePage  := tsCerrarNomina;
    9  : pc.ActivePage  := tsNominaGrid;
    10 : pc.ActivePage  := tsNominaPivot;
    else
      ShowMessage('Opción no implementada');
  end;
end;

procedure TClientForm.pcPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  // Esta es una manera de centralizar las acciones correspondientes al cambio de páginas

  // 1) Deshacer las acciones correspondientes a la página que se abandona

  case pc.ActivePageIndex of
    0  : // Identificación
      begin
      end;
    1  : // Configuración
      begin
        frmConfig1.UnLoad;
      end;
    2  : //
      begin
        ClientDataModule.tbl_NewDevices.Close;
      end;
    3  : //
      begin
        ClientDataModule.tbl_NewUsers.Close;
      end;
    4  : //
      begin
        ClientDataModule.tbl_CalculosDiariosNoAprobados.Close;
      end;
    5  : //
      begin
        ClientDataModule.tbl_CalculosSemanalesNoAprobados.Close;
      end;
    6  : //
      begin
        ClientDataModule.tbl_CalculosTrabajadorNoAprobados.Close;
      end;
    7  : //
      begin
        ClientDataModule.tbl_dboDepartamento.Close;
        ClientDataModule.tbl_viewResultadosPendientes.Close;
      end;
    8  : //
      begin
      end;
    9  : //
      begin
        ClientDataModule.tbl_viewNominaFacts.Close;
      end;
    10 : //
      begin
        ClientDataModule.tbl_viewNominaFacts.Close;
      end;
  end;

  // 2) Ejecutar las acciones correspondientes a la página que se activa

  case NewPage.TabIndex of
    0  : // Identificación
      begin
        tbGrid.Visible := false;
      end;
    1  : // Configuración
      begin
        tbGrid.Visible := true;
      end;
    2  : // Tarea - Nuevos Equipos
      begin
        tbGrid.Visible := true;
        g := frmNewDevices1.g;
      end;
    3  : // Tarea - Nuevos Usuarios
      begin
        tbGrid.Visible := true;
        g := frmNewUsers1.g;
      end;
    4  : // Tarea - Supervisión Diaria (Departamento)
      begin
        tbGrid.Visible := true;
        g := frmDptoByDay1.g;
        with ClientDataModule, tbl_CalculosDiariosNoAprobados do
          Params.ParamByName('OperadorID').Value := OperadorID;

        PleaseWaitForm.Show('Actualizando cálculos diarios');
        try
          ClientDataModule.UpdateCalculosDiarios;
        finally
          PleaseWaitForm.Hide;
        end;
      end;
    5  : // Tarea - Supervisión Semanal (Departamento)
      begin
        tbGrid.Visible := true;
        g := frmDptoByWeek1.g;
        with ClientDataModule, tbl_CalculosSemanalesNoAprobados do
          Params.ParamByName('OperadorID').Value := OperadorID;

        PleaseWaitForm.Show('Actualizando cálculos semanales');
        try
          ClientDataModule.UpdateCalculosSemanales;
        finally
          PleaseWaitForm.Hide;
        end;
      end;
    6  : // Tarea - Supervisión Trabajador/Nómina (Departamento)
      begin
        tbGrid.Visible := true;
        g := frmDptoByPayroll1.g;
        with ClientDataModule, tbl_CalculosTrabajadorNoAprobados do
          Params.ParamByName('OperadorID').Value := OperadorID;

        PleaseWaitForm.Show('Actualizando cálculos de la nómina');
        try
          ClientDataModule.UpdateCalculosTrabajador;
        finally
          PleaseWaitForm.Hide;
        end;
      end;
    7  : // Tarea - Resultados Pendientes
      begin
        tbGrid.Visible := true;
        g := frmResultadosPendientes1.g;
      end;
    8  : // Tarea - Cerrar Nómina
      begin
        tbGrid.Visible := false;
        if ClientDataModule.CerrarNomina < 0
          then MessageBox(Self.ClientHandle, 'La Nómina aún no se puede cerrar', 'Aviso', MB_OK or MB_ICONERROR)
          else
            begin
              MessageBox(Self.ClientHandle, 'La Nómina fue cerrada y sus resultados están disponibles', 'Aviso', MB_OK);
              nvICerrarNomina.Visible := false;
            end;
      end;
    9  : // Reporte - viewNominaFacts (GRID)
      begin
        tbGrid.Visible := true;
        g := frmNominaFacts1.g;
      end;
    10 : // Reporte - viewNominaFacts (PIVOT)
      begin
        tbGrid.Visible := true;
      end;
  end;

  AllowChange := true;
end;

procedure TClientForm.btnRequeryClick(Sender: TObject);
begin
  PleaseWaitForm.Show('Leyendo desde la base de datos');
  try
    case pc.ActivePageIndex of
      1 :
        begin
          frmConfig1.Load;
        end;
      2 :
        begin
          ClientDataModule.tbl_NewDevices.Close;
          ClientDataModule.tbl_NewDevices.Open;
        end;
      3 :
        begin
          ClientDataModule.tbl_NewUsers.Close;
          ClientDataModule.tbl_NewUsers.Open;
        end;
      4 :
        with ClientDataModule do
          begin
            tbl_Trabajador.Close;
            tbl_Trabajador.Open;
            tbl_CalculosDiariosNoAprobados.Close;
            tbl_CalculosDiariosNoAprobados.Open;
          end;
      5 :
        with ClientDataModule do
          begin
            tbl_Trabajador.Close;
            tbl_Trabajador.Open;
            tbl_CalculosSemanalesNoAprobados.Close;
            tbl_CalculosSemanalesNoAprobados.Open;
          end;
      6 :
        with ClientDataModule do
          begin
            tbl_Trabajador.Close;
            tbl_Trabajador.Open;
            tbl_CalculosTrabajadorNoAprobados.Close;
            tbl_CalculosTrabajadorNoAprobados.Open;
          end;
      7 :
        with ClientDataModule do
          begin
            tbl_dboDepartamento.Close;
            tbl_dboDepartamento.Open;
            tbl_viewResultadosPendientes.Close;
            tbl_viewResultadosPendientes.Open;

            if tbl_viewResultadosPendientes.EOF
              then nvICerrarNomina.Visible := true;
          end;
      9 :
        begin
          ClientDataModule.tbl_viewNominaFacts.Close;
          ClientDataModule.tbl_viewNominaFacts.Open;
        end;
      10 :
        begin
          ClientDataModule.tbl_viewNominaFacts.Close;
          ClientDataModule.tbl_viewNominaFacts.Open;
        end;
    end;
  finally
    PleaseWaitForm.Hide;
  end;
end;

procedure TClientForm.btnExportToHTMLClick(Sender: TObject);
begin
  with SaveDialog1 do
    begin
      DefaultExt := 'HTML';
      Filter     := 'Archivos HTML|*.HTML';

      if Execute
        then
          begin
            PleaseWaitForm.Show('Exporting to ' + FileName);
            try
              case pc.ActivePageIndex of
                1    : cxExportTL4ToHTML(FileName, frmConfig1.Tree);
                2..9 : ExportGridToHTML(FileName, g);
                10   : cxExportPivotGridToHTML(FileName, frmPivotNomina1.p, false);
              end;
            finally
              PleaseWaitForm.Hide;
            end;
          end;
    end;
end;

procedure TClientForm.btnExportToExcelClick(Sender: TObject);
begin
  with SaveDialog1 do
    begin
      DefaultExt := 'XLS';
      Filter     := 'Archivos Excel|*.XLS';

      if Execute
        then
          begin
            PleaseWaitForm.Show('Exporting to ' + FileName);
            try
              case pc.ActivePageIndex of
                1    : cxExportTL4ToExcel(FileName, frmConfig1.Tree);
                2..9 : ExportGridToExcel(FileName, g);
                10   : cxExportPivotGridToExcel(FileName, frmPivotNomina1.p, false);
              end;
            finally
              PleaseWaitForm.Hide;
            end;
          end;
    end;
end;

procedure TClientForm.btnExportToTextClick(Sender: TObject);
begin
  with SaveDialog1 do
    begin
      DefaultExt := 'TXT';
      Filter     := 'Archivos Texto|*.TXT';

      if Execute
        then
          begin
            PleaseWaitForm.Show('Exporting to ' + FileName);
            try
              case pc.ActivePageIndex of
                1    : cxExportTL4ToText(FileName, frmConfig1.Tree);
                2..9 : ExportGridToText(FileName, g);
                10   : cxExportPivotGridToText(FileName, frmPivotNomina1.p, false);
              end;
            finally
              PleaseWaitForm.Hide;
            end;
          end;
    end;
end;

procedure TClientForm.btnExportToXMLClick(Sender: TObject);
begin
  with SaveDialog1 do
    begin
      DefaultExt := 'XML';
      Filter     := 'Archivos XML|*.XML';

      if Execute
        then
          begin
            PleaseWaitForm.Show('Exporting to ' + FileName);
            try
              case pc.ActivePageIndex of
                1    : cxExportTL4ToXML(FileName, frmConfig1.Tree);
                2..9 : ExportGridToXML(FileName, g);
                10   : cxExportPivotGridToXML(FileName, frmPivotNomina1.p, false);
              end;
            finally
              PleaseWaitForm.Hide;
            end;
          end;
    end;
end;

procedure TClientForm.btnPrintClick(Sender: TObject);
begin
  case pc.ActivePageIndex of
    1    :
      begin
        dxComponentPrinter1.CurrentLink := dxComponentPrinter1Link2;
        dxComponentPrinter1Link2.Component := frmConfig1.Tree;
      end;
    2..9 :
      begin
        dxComponentPrinter1.CurrentLink := dxComponentPrinter1Link1;
        dxComponentPrinter1Link1.Component := g;
      end;
    10   :
      begin
        dxComponentPrinter1.CurrentLink := dxComponentPrinter1Link3;
        dxComponentPrinter1Link3.Component := frmPivotNomina1.p;
      end;
  end;

  dxComponentPrinter1.Print(true, nil, nil);
end;

end.
