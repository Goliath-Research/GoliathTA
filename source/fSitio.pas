unit fSitio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus;

type
  TfrmSitio = class(TForm)
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
  frmSitio: TfrmSitio;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmSitio.Load;
  begin
    with ClientDataModule, tbl_dboSitio do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text     := FieldByName('Nombre'    ).AsString;
      end;
  end;

  procedure TfrmSitio.Save;
  begin
    with ClientDataModule, tbl_dboSitio do
      begin
        Edit;
          FieldByName('Nombre'    ).AsString := txtNombre.Text;
        Post;

        ApplyUpdates(false);
      end;
  end;

  function TfrmSitio.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;
    Result := ShowModal = mrOk;
    if Result
      then Save;
  end;

  procedure TfrmSitio.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmSitio.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue)
      then
        begin
          MessageDlg('El sitio necesita un nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
