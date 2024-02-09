unit fDepartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus;

type
  TfrmDepartamento = class(TForm)
    pnlBody: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
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
  frmDepartamento: TfrmDepartamento;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmDepartamento.Load;
  begin
    with ClientDataModule, tbl_dboDepartamento do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text     := FieldByName('Nombre'    ).AsString;
      end;
  end;

  procedure TfrmDepartamento.Save;
  begin
    with ClientDataModule, tbl_dboDepartamento do
      begin
        Edit;
          FieldByName('Nombre'    ).AsString := txtNombre.Text;
        Post;

        ApplyUpdates(false);
      end;
  end;

  function TfrmDepartamento.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;
    Result := ShowModal = mrOk;
    if Result
      then Save;
  end;

  procedure TfrmDepartamento.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmDepartamento.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue)
      then
        begin
          MessageDlg('El departamento necesita un nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
