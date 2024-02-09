unit frameDptoByDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, fClientDataModule, cxCalc,
  cxMaskEdit, cxCalendar, cxMemo, cxTextEdit, Grids, DBGrids, cxDBLookupComboBox,
  cxCheckBox;

type
  TfrmDptoByDay = class(TFrame)
    g: TcxGrid;
    gL: TcxGridLevel;
    gDBBTV: TcxGridDBBandedTableView;
    gDBBTVRecID: TcxGridDBBandedColumn;
    gDBBTVDepartamentoID: TcxGridDBBandedColumn;
    gDBBTVDia: TcxGridDBBandedColumn;
    gDBBTVTrabajadorID: TcxGridDBBandedColumn;
    gDBBTVNombre: TcxGridDBBandedColumn;
    gDBBTVEp: TcxGridDBBandedColumn;
    gDBBTVSp: TcxGridDBBandedColumn;
    gDBBTVEr: TcxGridDBBandedColumn;
    gDBBTVSr: TcxGridDBBandedColumn;
    gDBBTVHl: TcxGridDBBandedColumn;
    gDBBTVHa: TcxGridDBBandedColumn;
    gDBBTVHp: TcxGridDBBandedColumn;
    gDBBTVHe: TcxGridDBBandedColumn;
    gDBBTVPrima: TcxGridDBBandedColumn;
    gDBBTVHpA: TcxGridDBBandedColumn;
    gDBBTVHeA: TcxGridDBBandedColumn;
    gDBBTVPrimaA: TcxGridDBBandedColumn;
    gDBBTVNota: TcxGridDBBandedColumn;
    gDBBTVNominaID: TcxGridDBBandedColumn;
    gDBBTVAprobar: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
