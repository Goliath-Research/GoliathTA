unit fFeriado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus, cxCalendar;

type
  TfrmFeriado = class(TForm)
    pnlBody: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblFecha: TcxLabel;
    datFecha: TcxDateEdit;
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
  frmFeriado: TfrmFeriado;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmFeriado.Load;
  begin
    with ClientDataModule, tbl_dboFeriados do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text := FieldByName('Nombre').AsString;
        datFecha.Date  := FieldByName('Fecha' ).AsDateTime;
      end;
  end;

  procedure TfrmFeriado.Save;
  begin
    with ClientDataModule, tbl_dboFeriados do
      begin
        Edit;
          FieldByName('Nombre').AsString   := txtNombre.Text;
          FieldByName('Fecha' ).AsDateTime := datFecha.Date;
        Post;

        ApplyUpdates(false);
      end;
  end;

  function TfrmFeriado.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;
    Result := ShowModal = mrOk;
    if Result 
      then Save;
  end;

  procedure TfrmFeriado.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmFeriado.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue) or (txtNombre.Text = '')
      then
        begin
          MessageDlg('No ha entrado el nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;

    if VarIsNull(datFecha.EditValue)
      then
        begin
          MessageDlg('No ha entrado la fecha', mtError, [mbOk], 0);
          datFecha.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
