unit fLectora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus;

type
  TfrmLectora = class(TForm)
    pnlBody: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblDeviceID: TcxLabel;
    txtDeviceID: TcxTextEdit;
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
  frmLectora: TfrmLectora;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmLectora.Load;
  begin
    with ClientDataModule, tbl_dboLectora do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text   := FieldByName('Nombre'  ).AsString;
        txtDeviceID.Text := FieldByName('DeviceID').AsString;
      end;
  end;

  procedure TfrmLectora.Save;
  begin
    with ClientDataModule, tbl_dboLectora do
      begin
        Edit;
          FieldByName('Nombre'    ).AsString := txtNombre.Text;
        Post;

        ApplyUpdates(false);
      end;
  end;

  function TfrmLectora.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;
    Result := ShowModal = mrOk;
    if Result 
      then Save;
  end;

  procedure TfrmLectora.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmLectora.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue) or (txtNombre.Text = '')
      then
        begin
          MessageDlg('No ha entrado el nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
