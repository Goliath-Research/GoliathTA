unit fNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus, cxCalendar;

type
  TfrmNomina = class(TForm)
    pnlBody: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblFecha1: TcxLabel;
    datFecha1: TcxDateEdit;
    cxLabel1: TcxLabel;
    datFecha2: TcxDateEdit;
    lblEstado: TcxLabel;
    txtEstado: TcxTextEdit;
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

    function Edit(aObjID : integer; ReadOnly : boolean) : boolean;
  end;

var
  frmNomina: TfrmNomina;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmNomina.Load;
  begin
    with ClientDataModule, tbl_dboNomina do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text  := FieldByName('Nombre').AsString;
        datFecha1.Date  := FieldByName('Fecha1').AsDateTime;
        datFecha2.Date  := FieldByName('Fecha2').AsDateTime;
        if FieldByName('Estado').IsNull
          then txtEstado.Text := 'Futura'
          else
            if FieldByName('Estado').AsInteger = 1
              then txtEstado.Text := 'Activa'
              else txtEstado.Text := 'Cerrada';
      end;
  end;

  procedure TfrmNomina.Save;
  begin
    with ClientDataModule, tbl_dboNomina do
      begin
        Edit;
          FieldByName('Nombre').AsString   := txtNombre.Text;
          FieldByName('Fecha1').AsDateTime := datFecha1.Date;
          FieldByName('Fecha2').AsDateTime := datFecha2.Date;
        Post;

        ApplyUpdates(false);
        if not datFecha1.Properties.ReadOnly
          then UpdateFirstNomina;
      end;
  end;

  function TfrmNomina.Edit(aObjID : integer; ReadOnly : boolean) : boolean;
  begin
    ObjID := aObjID;
    Load;

    datFecha1.Properties.ReadOnly := ReadOnly;
    datFecha2.Properties.ReadOnly := ReadOnly;

    Result := ShowModal = mrOk;
    if Result
      then Save;
  end;

  procedure TfrmNomina.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmNomina.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue) or (txtNombre.Text = '')
      then
        begin
          MessageDlg('No ha entrado el nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;

    if VarIsNull(datFecha1.EditValue)
      then
        begin
          MessageDlg('La fecha inicial es obligatoria', mtError, [mbOk], 0);
          datFecha1.SetFocus;
          Exit;
        end;

    if VarIsNull(datFecha2.EditValue)
      then
        begin
          MessageDlg('La fecha final es obligatoria', mtError, [mbOk], 0);
          datFecha2.SetFocus;
          Exit;
        end;

    if not datFecha1.Properties.ReadOnly and ((trunc(datFecha2.Date) - trunc(datFecha1.Date) + 1) mod 7 <> 0)
      then
        begin
          MessageDlg('El intervalo de fechas debe incluir semanas completas', mtError, [mbOk], 0);
          datFecha2.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
