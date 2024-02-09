unit fJornada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxCurrencyEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, dxmdaset, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, Menus, cxCalendar, cxCheckBox, cxTimeEdit;

type
  TfrmJornada = class(TForm)
    pnlBody: TPanel;
    pnlButtons: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblFecha1: TcxLabel;
    lblHasta: TcxLabel;
    timHora1: TcxTimeEdit;
    timHora2: TcxTimeEdit;
    cxLabel1: TcxLabel;
    timDesc1: TcxTimeEdit;
    cxLabel2: TcxLabel;
    timDesc2: TcxTimeEdit;
    boxDescanso: TcxCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAceptarClick(Sender: TObject);
    procedure boxDescansoPropertiesChange(Sender: TObject);
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
  frmJornada: TfrmJornada;

implementation

uses fClientDataModule, DateUtils;

{$R *.dfm}

  function MyTime2DateTime(t : integer) : TDateTime;
  begin
    Result := OneHour * (t div 100) + OneMinute * (t mod 100);
  end;

  function DateTime2MyTime(t : TDateTime) : integer;
  var
    hour, min, sec, msec : word;
  begin
    DecodeTime(t, hour, min, sec, msec);
    Result := 100 * hour + min;
  end;

  function TimeDiff(tim1, tim2 : TDateTime) : integer;
  begin
    if tim1 > tim2
      then tim2 := 1 + tim2;
    result := DateTime2MyTime(tim2 - tim1);
  end;

  procedure TfrmJornada.Load;
  begin
    with ClientDataModule, tbl_dboJornada do
      begin
        Close;
        Open;

        if not Locate('ID', VarArrayOf([ObjID]), [])
          then Abort;

        txtNombre.Text := FieldByName('Nombre').AsString;
        timHora1.Time  := MyTime2DateTime(FieldByName('Hora1' ).AsInteger);
        timHora2.Time  := MyTime2DateTime(FieldByName('Hora2' ).AsInteger);

        boxDescanso.Tag := FieldByName('Descanso').AsInteger;
        boxDescanso.Checked := boxDescanso.Tag <> 0;

        if boxDescanso.Checked
          then
            begin
              timDesc1.Time  := MyTime2DateTime(FieldByName('Desc1' ).AsInteger);
              timDesc2.Time  := MyTime2DateTime(FieldByName('Desc2' ).AsInteger);
            end
          else
            begin
              timDesc1.Clear;
              timDesc2.Clear;
            end;
      end;
  end;

  procedure TfrmJornada.Save;
  begin
    with ClientDataModule, tbl_dboJornada do
      begin
        Edit;
          FieldByName('Nombre').AsString   := txtNombre.Text;
          FieldByName('Hora1' ).AsInteger  := DateTime2MyTime(timHora1.Time);
          FieldByName('Hora2' ).AsInteger  := DateTime2MyTime(timHora2.Time);

          if boxDescanso.Checked
            then
              begin
                FieldByName('Descanso').AsInteger := TimeDiff(timDesc1.Time, timDesc2.Time);
                FieldByName('Desc1' ).AsInteger   := DateTime2MyTime(timDesc1.Time);
                FieldByName('Desc2' ).AsInteger   := DateTime2MyTime(timDesc2.Time);
              end
            else
              begin
                FieldByName('Descanso').AsInteger := 0;
                FieldByName('Desc1' ).AsVariant   := null;
                FieldByName('Desc2' ).AsVariant   := null;
              end;
        Post;

        ApplyUpdates(false);
      end;
  end;

  procedure TfrmJornada.boxDescansoPropertiesChange(Sender: TObject);
  begin
    timDesc1.Properties.ReadOnly := not boxDescanso.Checked;
    timDesc2.Properties.ReadOnly := not boxDescanso.Checked;
  end;

  function TfrmJornada.Edit(aObjID : integer) : boolean;
  begin
    ObjID := aObjID;
    Load;
    Result := ShowModal = mrOk;
    if Result
      then Save;
  end;

  procedure TfrmJornada.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := (ModalResult = mrCancel) or not Error;
  end;

  procedure TfrmJornada.btnAceptarClick(Sender: TObject);
  var
    t1, t2, t3, t4 : TDateTime;
  begin
    Error := true;

    if VarIsNull(txtNombre.EditValue) or (txtNombre.Text = '')
      then
        begin
          MessageDlg('No ha entrado el nombre', mtError, [mbOk], 0);
          txtNombre.SetFocus;
          Exit;
        end;

    if VarIsNull(timHora1.EditValue)
      then
        begin
          MessageDlg('No ha entrado el inicio del turno', mtError, [mbOk], 0);
          timHora1.SetFocus;
          Exit;
        end;

    if VarIsNull(timHora2.EditValue)
      then
        begin
          MessageDlg('No ha entrado el final del turno', mtError, [mbOk], 0);
          timHora2.SetFocus;
          Exit;
        end;

    if boxDescanso.Checked and VarIsNull(timDesc1.EditValue)
      then
        begin
          MessageDlg('No ha entrado el inicio del descanso', mtError, [mbOk], 0);
          timDesc1.SetFocus;
          Exit;
        end;

    if boxDescanso.Checked and VarIsNull(timDesc2.EditValue)
      then
        begin
          MessageDlg('No ha entrado el final del descanso', mtError, [mbOk], 0);
          timDesc2.SetFocus;
          Exit;
        end;

    if boxDescanso.Checked
      then
        begin
          t1 := timHora1.Time;
          t4 := timHora2.Time;
          if t1 > t4
            then t4 := 1 + t4;
          t2 := timDesc1.Time;
          t3 := timDesc2.Time;
          if t2 > t3
            then t3 := 1 + t3;

          if not ((t1 < t2) and (t2 < t3) and (t3 < t4))
            then
              begin
                MessageDlg('Revise los horarios, por favor', mtError, [mbOk], 0);
                timHora1.SetFocus;
                Exit;
              end;
        end;

    Error := false;
  end;

end.
