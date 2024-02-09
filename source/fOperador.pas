unit fOperador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus, cxDBEdit;

type
  TfrmOperador = class(TForm)
    pnlBody: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblPassword: TcxLabel;
    lblOperador: TcxLabel;
    txtOperador: TcxTextEdit;
    txtPassword: TcxTextEdit;
    lblAutoridad: TcxLabel;
    boxAutoridad: TcxComboBox;
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
  frmOperador: TfrmOperador;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmOperador.Load;
  begin
    with ClientDataModule, tbl_Operador do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtOperador.Text       := FieldByName('Operator' ).AsString;
        txtPassword.Text       := FieldByName('Password' ).AsString;
        boxAutoridad.Tag       := FieldByName('Autoridad').AsInteger;
        boxAutoridad.ItemIndex := boxAutoridad.Tag - 1;
        boxAutoridad.Properties.ReadOnly := Autoridad <> 1;
      end;
  end;

  procedure TfrmOperador.Save;
  begin
    with ClientDataModule, tbl_Operador do
      begin
        Edit;
          FieldByName('Operator' ).AsString := txtOperador.Text;
          FieldByName('Password' ).AsString := txtPassword.Text;
          FieldByName('Autoridad').AsInteger := boxAutoridad.ItemIndex + 1;
        Post;

        ApplyUpdates(false);
      end;
  end;

  function TfrmOperador.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;
    Result := ShowModal = mrOk;
    if Result 
      then Save;
  end;

  procedure TfrmOperador.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmOperador.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtOperador.EditValue) or (txtOperador.Text = '')
      then
        begin
          MessageDlg('No ha entrado el operador', mtError, [mbOk], 0);
          txtOperador.SetFocus;
          Exit;
        end;

    if VarIsNull(txtPassword.EditValue)
      then
        begin
          MessageDlg('No ha entrado la contraseña', mtError, [mbOk], 0);
          txtPassword.SetFocus;
          Exit;
        end;

    if (boxAutoridad.ItemIndex <> boxAutoridad.Tag - 1) and (boxAutoridad.ItemIndex = 2)
      then
        begin
          MessageDlg('Los Jefes de Departamento se asignan entre los trabajadores de su departamento', mtError, [mbOk], 0);
          boxAutoridad.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
