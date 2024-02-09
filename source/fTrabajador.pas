unit fTrabajador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmTrabajador = class(TForm)
    lblRFC: TcxLabel;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    txtRFC: TcxTextEdit;
    lblBioAdminID: TcxLabel;
    txtBioAdminID: TcxTextEdit;
    pnlBody: TGridPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    pnlTrabajador: TPanel;
    lblHorario: TcxLabel;
    boxHorario: TcxLookupComboBox;
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
  frmTrabajador: TfrmTrabajador;

implementation

uses fClientDataModule;

{$R *.dfm}

  procedure TfrmTrabajador.Load;
  begin
    with ClientDataModule, tbl_dboPeriodo do
      begin
        Close;
        Open;
      end;
    with ClientDataModule, tbl_Trabajador do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text       := FieldByName('Nombre'    ).AsString;
        txtRFC.Text          := FieldByName('RFC'       ).AsString;
        txtBioAdminID.Text   := FieldByName('BioAdminID').AsString;
      end;

    with ClientDataModule do
      begin
        // Si es un Jefe de Departamento en una Nómina Activa, permitir editar la asignación Horario

        LocateNominaActiva;
        if (Autoridad = 3) and (NominaID <> -1)
          then
            with tbl_dboAsignacion do
              begin
                Close;
                Filter   := Format('(NominaID = %d) and (TrabajadorID = %d)', [NominaID, ObjID]);
                Filtered := true;
                Open;

                if Eof
                  then
                    begin
                      MessageDlg('Error inesperado: trabajador sin horario asignado', mtError, [mbOk], 0);
                      Abort;
                    end
                  else
                    begin
                      boxHorario.EditValue := FieldByName('PeriodoID').AsInteger;
                      
                      lblHorario.Visible := true;
                      boxHorario.Visible := true;
                    end;
              end
          else
            begin
              lblHorario.Visible := false;
              boxHorario.Visible := false;
            end;

      end;
  end;

  procedure TfrmTrabajador.Save;
  begin
    with ClientDataModule, tbl_Trabajador do
      begin
        Edit;
          FieldByName('Nombre'    ).AsString  := txtNombre.Text;
          FieldByName('RFC'       ).AsString  := txtRFC.Text;
        Post;

        ApplyUpdates(false);
      end;

    if boxHorario.Visible
      then
        with ClientDataModule, tbl_dboAsignacion do
          begin
            Edit;
              FieldByName('PeriodoID' ).AsInteger := boxHorario.EditValue;
            Post;

            ApplyUpdates(false);
          end;
  end;

  function TfrmTrabajador.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;
    Result := ShowModal = mrOk;
    if Result
      then Save;
  end;

  procedure TfrmTrabajador.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmTrabajador.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue) or (txtNombre.Text = '')
      then
        begin
          MessageDlg('No ha entrado el nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;
    (*
    if VarIsNull(txtRFC.EditValue)
      then
        begin
          MessageDlg('No ha entrado el RFC', mtError, [mbOk], 0);
          txtRFC.SetFocus;
          Exit;
        end;
    *)
    if not VarIsNull(txtRFC.EditValue) and false
      then
        begin
          MessageDlg('El RFC es inválido', mtError, [mbOk], 0);
          txtRFC.SetFocus;
          Exit;
        end;

    if boxHorario.Visible and VarIsNull(boxHorario.EditValue)
      then
        begin
          MessageDlg('No ha entrado el horario', mtError, [mbOk], 0);
          boxHorario.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
