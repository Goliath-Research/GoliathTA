unit frameLogon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters;

type
  TfrmLogon = class(TFrame)
    pnlLogOn: TPanel;
    txtOperator: TcxTextEdit;
    lblOperator: TcxLabel;
    lblPassword: TcxLabel;
    txtPassword: TcxTextEdit;
    btnLogin: TcxButton;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  fClientForm, fClientDataModule, uROPleaseWaitForm;

procedure TfrmLogon.btnLoginClick(Sender: TObject);
begin
  // Verificar que el operador sea válido y almacenarlo en fClientForm como el operador
  // activo, indicando el nombre en el Caption del programa...
  // Tener en cuenta el estado del LogOn para inhabilitar el cambio a cualquier otro
  // tab mientras no se haya identificado un operador válido

  if ClientDataModule.TryLogin(txtOperator.Text, txtPassword.Text)
    then ClientForm.SetOperator(txtOperator.Text)
    else MessageBox(ClientForm.Handle, '¡Credenciales inválidas!', 'Usuario sin acceso', MB_ICONSTOP + MB_OK);
end;

end.
