unit frameNominaFacts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  fClientDataModule, cxCalc;

type
  TfrmNominaFacts = class(TFrame)
    gDBTV: TcxGridDBTableView;
    gL: TcxGridLevel;
    g: TcxGrid;
    gDBTVRecID: TcxGridDBColumn;
    gDBTVNomina: TcxGridDBColumn;
    gDBTVFecha1: TcxGridDBColumn;
    gDBTVFecha2: TcxGridDBColumn;
    gDBTVSitio: TcxGridDBColumn;
    gDBTVDepartamento: TcxGridDBColumn;
    gDBTVTrabajador: TcxGridDBColumn;
    gDBTVLaborables: TcxGridDBColumn;
    gDBTVAsistidas: TcxGridDBColumn;
    gDBTVExtrasBrutas: TcxGridDBColumn;
    gDBTVPagar: TcxGridDBColumn;
    gDBTVExtras: TcxGridDBColumn;
    gDBTVPrimas: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
