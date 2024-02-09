unit frameNewDevices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridCustomPopupMenu, cxGridPopupMenu, Menus, ImgList;

type
  TfrmNewDevices = class(TFrame)
    gDBTV: TcxGridDBTableView;
    gL: TcxGridLevel;
    g: TcxGrid;
    gDBTVRecID: TcxGridDBColumn;
    gDBTVDeviceID: TcxGridDBColumn;
    gDBTVDeviceName: TcxGridDBColumn;
    pm: TPopupMenu;
    cxGridPopupMenu1: TcxGridPopupMenu;
    AddToSitio1: TMenuItem;
    il: TImageList;
    procedure pmPopup(Sender: TObject);
    procedure MenuItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  fClientDataModule;

procedure TfrmNewDevices.pmPopup(Sender: TObject);
var
  mi : TMenuItem;
begin
  // Crear el submenú de sitios
  AddToSitio1.Clear;
  with ClientDataModule, tbl_dboSitio do
    begin
      Close;
      Open;
      try
        while not Eof do
          begin
            mi := TMenuItem.Create(nil);
            mi.Caption := FieldByName('Nombre').AsString;
            mi.ImageIndex := 1;
            mi.Tag        := FieldByName('ID').AsInteger;
            mi.OnClick    := MenuItemClick;
            
            AddToSitio1.Add(mi);
            Next;
          end;
      finally
        Close;
      end;
    end;
end;

procedure TfrmNewDevices.MenuItemClick(Sender: TObject);
var
  Nombre   : string;
  SitioID  : integer;
  DeviceID : integer;
begin
  with ClientDataModule do
    begin
      SitioID  := TMenuItem(Sender).Tag;
      DeviceID := tbl_NewDevices.FieldByName('DeviceID').AsInteger;
      if tbl_NewDevices.FieldByName('DeviceName').IsNull
        then Nombre := Format('Lectora %d', [DeviceID])
        else Nombre := tbl_NewDevices.FieldByName('DeviceName').AsString;

      if CreateNewLectora(Nombre, SitioID, DeviceID)
        then
          begin
            tbl_NewDevices.Close;
            tbl_NewDevices.Open;
          end;
    end;
end;

end.
