unit frameNewUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGridCustomPopupMenu, cxGridPopupMenu, ImgList, Menus;

type
  TfrmNewUsers = class(TFrame)
    g: TcxGrid;
    gDBTV: TcxGridDBTableView;
    gL: TcxGridLevel;
    gDBTVRecID: TcxGridDBColumn;
    gDBTVUserID: TcxGridDBColumn;
    gDBTVUserName: TcxGridDBColumn;
    pm: TPopupMenu;
    AddToDepto: TMenuItem;
    il: TImageList;
    cxGridPopupMenu1: TcxGridPopupMenu;
    AddAllToDepto: TMenuItem;
    N1: TMenuItem;
    procedure pmPopup(Sender: TObject);
    procedure MenuItemClick(Sender: TObject);
    procedure AddAllToDeptoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses fClientDataModule, uROPleaseWaitForm;

procedure TfrmNewUsers.pmPopup(Sender: TObject);
var
  mi : TMenuItem;
begin
  // Crear el submenú de departamentos para uno y para todos...

  AddToDepto.Clear;
  with ClientDataModule, tbl_dboDepartamento do
    begin
      Close;
      Open;
      try
        while not Eof do
          begin
            mi := TMenuItem.Create(nil);
            mi.Caption := FieldByName('Nombre').AsString;
            mi.ImageIndex := 2;
            mi.Tag        := FieldByName('ID').AsInteger;
            mi.OnClick    := MenuItemClick;

            AddToDepto.Add(mi);
            Next;
          end;
        First;
        while not Eof do
          begin
            mi := TMenuItem.Create(nil);
            mi.Caption := FieldByName('Nombre').AsString;
            mi.ImageIndex := 2;
            mi.Tag        := FieldByName('ID').AsInteger;
            mi.OnClick    := AddAllToDeptoClick;

            AddAllToDepto.Add(mi);
            Next;
          end;

      finally
        Close;
      end;
    end;
end;

procedure TfrmNewUsers.MenuItemClick(Sender: TObject);
var
  Nombre     : string;
  DeptoID    : integer;
  BioAdminID : integer;
begin
  with ClientDataModule do
    begin
      DeptoID  := TMenuItem(Sender).Tag;
      BioAdminID := tbl_NewUsers.FieldByName('UserID').AsInteger;
      if tbl_NewUsers.FieldByName('UserName').IsNull
        then Nombre := Format('Trabajador %d', [BioAdminID])
        else Nombre := tbl_NewUsers.FieldByName('UserName').AsString;

      if CreateNewTrabajador(Nombre, DeptoID, BioAdminID)
        then
          begin
            tbl_NewUsers.Close;
            tbl_NewUsers.Open;
          end;
    end;
end;

procedure TfrmNewUsers.AddAllToDeptoClick(Sender: TObject);
var
  Nombre     : string;
  DeptoID    : integer;
  BioAdminID : integer;
begin
  with ClientDataModule, tbl_NewUsers do
    begin
      DeptoID  := TMenuItem(Sender).Tag;

      PleaseWaitForm.Show(Format('Añadiendo usuarios al Departamento <%s>', [TMenuItem(Sender).Caption]));
      try
        First;
        while not Eof do
          begin
            BioAdminID := FieldByName('UserID').AsInteger;
            if FieldByName('UserName').IsNull
              then Nombre := Format('Trabajador %d', [BioAdminID])
              else Nombre := FieldByName('UserName').AsString;

            CreateNewTrabajador(Nombre, DeptoID, BioAdminID);

            Next;
          end;

        Close;
        Open;
      finally
        PleaseWaitForm.Hide;
      end;
    end;
end;

end.
