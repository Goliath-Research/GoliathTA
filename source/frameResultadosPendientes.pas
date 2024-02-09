unit frameResultadosPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridCustomPopupMenu, cxGridPopupMenu, Menus, ImgList, cxDBLookupComboBox,
  cxCalc;

type
  TfrmResultadosPendientes = class(TFrame)
    gDBTV: TcxGridDBTableView;
    gL: TcxGridLevel;
    g: TcxGrid;
    gDBTVRecID: TcxGridDBColumn;
    gDBTVNominaID: TcxGridDBColumn;
    gDBTVDepartamentoID: TcxGridDBColumn;
    gDBTVPendientes: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  fClientDataModule;

end.
