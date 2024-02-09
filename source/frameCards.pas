unit frameCards;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TfrmCards = class(TFrame)
    gCard: TcxGrid;
    gCardDBTV: TcxGridDBTableView;
    gCardDBTVRecID: TcxGridDBColumn;
    gCardDBTVCARDID: TcxGridDBColumn;
    gCardDBTVCARDNUMBER: TcxGridDBColumn;
    gCardDBTVCREATIONTIME: TcxGridDBColumn;
    gCardDBTVDESTRUCTIONTIME: TcxGridDBColumn;
    gCardDBTVSTATUS: TcxGridDBColumn;
    gCardL: TcxGridLevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
