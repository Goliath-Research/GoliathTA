unit fExcepcion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus, cxCalendar, cxCheckBox, cxTimeEdit;

type
  TfrmExcepcion = class(TForm)
    pnlBody: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblTurno: TcxLabel;
    lblFecha: TcxLabel;
    datFecha: TcxDateEdit;
    boxLaborable: TcxCheckBox;
    lcbTurno: TcxLookupComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure boxLaborablePropertiesChange(Sender: TObject);
  private
    { Private declarations }

    Error   : boolean;
    TrabID  : integer;
    Fecha   : TDateTime;

    procedure Load;
    procedure Save;
  public
    { Public declarations }

    function Edit(aTrabajadorID : integer; aFecha : TDateTime) : boolean;
  end;

var
  frmExcepcion: TfrmExcepcion;

implementation

uses fClientDataModule, DateUtils;

{$R *.dfm}

  procedure TfrmExcepcion.Load;
  begin
    with ClientDataModule, tbl_dboExcepcion do
      begin
        Close;
        Filter   := Format('TrabajadorID = %d', [TrabID]);
        Filtered := true;
        Open;

        if Fecha <> 0
          then
            begin
              if not Locate('Fecha', VarArrayOf([Fecha]), [])
                then Abort;

              datFecha.Date := Fecha;
              boxLaborable.Checked := FieldByName('Laborable').AsBoolean;
              if boxLaborable.Checked
                then lcbTurno.EditValue := FieldByName('JornadaID').AsInteger;
            end
          else
            begin
              datFecha.Clear;
              boxLaborable.Checked := false;
            end;
      end;
  end;

  procedure TfrmExcepcion.Save;
  begin
    with ClientDataModule, tbl_dboExcepcion do
      begin
        if Fecha <> 0
          then Edit
          else Append;

          FieldByName('TrabajadorID').AsInteger  := TrabID;
          FieldByName('Fecha'       ).AsDateTime := datFecha.Date;
          FieldByName('Laborable'   ).AsBoolean  := boxLaborable.Checked;
          if boxLaborable.Checked
            then FieldByName('JornadaID').AsInteger  := lcbTurno.EditValue;

        Post;

        ApplyUpdates(false);
        Close;
      end;
  end;

  function TfrmExcepcion.Edit(aTrabajadorID : integer; aFecha : TDateTime) : boolean;
  begin
    Result := false;
    TrabID := aTrabajadorID;
    Fecha  := aFecha;

    Load;

    with ClientDataModule do
      begin
        LocateNominaActiva;
        if NominaID = -1
          then Exit;
      end;

    ClientDataModule.tbl_dboJornada.Open;
    try
      Result := ShowModal = mrOk;
      if Result
        then Save;
    finally
      ClientDataModule.tbl_dboJornada.Close;
    end;
  end;

  procedure TfrmExcepcion.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmExcepcion.boxLaborablePropertiesChange(Sender: TObject);
  begin
    lcbTurno.Enabled := boxLaborable.Checked;
  end;

  procedure TfrmExcepcion.btnAceptarClick(Sender: TObject);
  begin
    Error := true;

    if VarIsNull(datFecha.EditValue)
      then
        begin
          MessageDlg('No ha entrado la fecha', mtError, [mbOk], 0);
          datFecha.SetFocus;
          Exit;
        end;

    // La fecha tiene que estar dentro de la nómina activa

    if (datFecha.Date < ClientDataModule.Fecha1) or (datFecha.Date > ClientDataModule.Fecha2)
     then
        begin
          MessageDlg('La fecha tiene que pertenecer a la nómina activa', mtError, [mbOk], 0);
          datFecha.SetFocus;
          Exit;
        end;

    if boxLaborable.Checked and VarIsNull(lcbTurno.EditValue)
      then
        begin
          MessageDlg('No ha entrado el turno del día laborable', mtError, [mbOk], 0);
          lcbTurno.SetFocus;
          Exit;
        end;

    Error := false;
  end;

end.
