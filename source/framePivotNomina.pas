unit framePivotNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, fClientDataModule, cxClasses, cxGraphics, cxCustomData, cxStyles,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxCustomPivotGrid,
  cxPivotGrid, cxDBPivotGrid;

type
  TfrmPivotNomina = class(TFrame)
    p: TcxDBPivotGrid;
    pRecID: TcxDBPivotGridField;
    pNomina: TcxDBPivotGridField;
    pFecha1: TcxDBPivotGridField;
    pSitio: TcxDBPivotGridField;
    pDepartamento: TcxDBPivotGridField;
    pTrabajador: TcxDBPivotGridField;
    pLaborables: TcxDBPivotGridField;
    pAsistidas: TcxDBPivotGridField;
    pExtrasBrutas: TcxDBPivotGridField;
    pPagar: TcxDBPivotGridField;
    pExtras: TcxDBPivotGridField;
    pPrimas: TcxDBPivotGridField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
