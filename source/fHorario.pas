unit fHorario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus, cxCalendar, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmHorario = class(TForm)
    pnlBody: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    pnlHorario: TPanel;
    pnlButtons: TGridPanel;
    gDBTV: TcxGridDBTableView;
    gL: TcxGridLevel;
    g: TcxGrid;
    gDBTVRecID: TcxGridDBColumn;
    gDBTVPeriodoID: TcxGridDBColumn;
    gDBTVDia: TcxGridDBColumn;
    gDBTVJornadaID: TcxGridDBColumn;
    gDBTVNombre: TcxGridDBColumn;
    gDBTVLaborable: TcxGridDBColumn;
    gDBTVTurno: TcxGridDBColumn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
    
    Error : boolean;
    ObjID : integer;

    procedure Load;
    procedure Save;
  public
    { Public declarations }

    function Edit(aObjID : integer) : boolean;
  end;

var
  frmHorario: TfrmHorario;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmHorario.Load;
  begin
    with ClientDataModule, tbl_dboPeriodo do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text  := FieldByName('Nombre').AsString;
      end;

    with ClientDataModule, tbl_dboJornada do
      begin
        Close;
        Open;
      end;

    with ClientDataModule, tbl_dboPeriodoJornada do
      begin
        Close;
        Filter   := Format('PeriodoID = %d', [ObjID]);
        Filtered := true;
        Open;
      end;
  end;

  procedure TfrmHorario.Save;
  begin
    with ClientDataModule, tbl_dboPeriodo do
      begin
        Edit;
          FieldByName('Nombre').AsString   := txtNombre.Text;
        Post;

        ApplyUpdates(false);
      end;

    ClientDataModule.tbl_dboPeriodoJornada.ApplyUpdates(false);
  end;

  function TfrmHorario.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;

    Result := ShowModal = mrOk;
    if Result
      then Save;
  end;

  procedure TfrmHorario.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmHorario.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue) or (txtNombre.Text = '')
      then
        begin
          MessageDlg('No ha entrado el nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;

    with ClientDataModule, tbl_dboPeriodoJornada do
      begin
        First;
        while not Eof do
          begin
            if not FieldByName('JornadaID').IsNull and not FieldByName('Laborable').AsBoolean
              then
                begin
                  MessageDlg('Si asigna un turno al día, debe ser laborable', mtError, [mbOk], 0);
                  g.SetFocus;
                  Exit;
                end;
            
            Next;
          end;
      end;

    Error := false;
  end;

end.
