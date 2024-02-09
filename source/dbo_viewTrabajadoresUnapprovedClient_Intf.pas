unit dbo_viewTrabajadoresUnapprovedClient_Intf;

interface

uses
  Classes, DB, SysUtils, uROClasses, uDADataTable, FmtBCD, uROXMLIntf;

const
  { Data table rules ids
       Feel free to change them to something more human readable
       but make sure they are unique in the context of your application }
  RID_dbo_viewTrabajadoresUnapproved = '{B8D4F41B-E269-46B8-9BF0-B0670D6DA856}';

  { Data table names }
  nme_dbo_viewTrabajadoresUnapproved = 'dbo_viewTrabajadoresUnapproved';

  { dbo_viewTrabajadoresUnapproved fields }
  fld_dbo_viewTrabajadoresUnapprovedDepartamentoID = 'DepartamentoID';
  fld_dbo_viewTrabajadoresUnapprovedDia = 'Dia';
  fld_dbo_viewTrabajadoresUnapprovedTrabajadorID = 'TrabajadorID';
  fld_dbo_viewTrabajadoresUnapprovedNombre = 'Nombre';
  fld_dbo_viewTrabajadoresUnapprovedEp = 'Ep';
  fld_dbo_viewTrabajadoresUnapprovedSp = 'Sp';
  fld_dbo_viewTrabajadoresUnapprovedEr = 'Er';
  fld_dbo_viewTrabajadoresUnapprovedSr = 'Sr';
  fld_dbo_viewTrabajadoresUnapprovedHn = 'Hn';
  fld_dbo_viewTrabajadoresUnapprovedHr = 'Hr';
  fld_dbo_viewTrabajadoresUnapprovedHd = 'Hd';
  fld_dbo_viewTrabajadoresUnapprovedHe = 'He';
  fld_dbo_viewTrabajadoresUnapprovedPrima = 'Prima';
  fld_dbo_viewTrabajadoresUnapprovedHdA = 'HdA';
  fld_dbo_viewTrabajadoresUnapprovedHeA = 'HeA';
  fld_dbo_viewTrabajadoresUnapprovedPrimaA = 'PrimaA';
  fld_dbo_viewTrabajadoresUnapprovedApproved = 'Approved';
  fld_dbo_viewTrabajadoresUnapprovedNota = 'Nota';

  { dbo_viewTrabajadoresUnapproved field indexes }
  idx_dbo_viewTrabajadoresUnapprovedDepartamentoID = 0;
  idx_dbo_viewTrabajadoresUnapprovedDia = 1;
  idx_dbo_viewTrabajadoresUnapprovedTrabajadorID = 2;
  idx_dbo_viewTrabajadoresUnapprovedNombre = 3;
  idx_dbo_viewTrabajadoresUnapprovedEp = 4;
  idx_dbo_viewTrabajadoresUnapprovedSp = 5;
  idx_dbo_viewTrabajadoresUnapprovedEr = 6;
  idx_dbo_viewTrabajadoresUnapprovedSr = 7;
  idx_dbo_viewTrabajadoresUnapprovedHn = 8;
  idx_dbo_viewTrabajadoresUnapprovedHr = 9;
  idx_dbo_viewTrabajadoresUnapprovedHd = 10;
  idx_dbo_viewTrabajadoresUnapprovedHe = 11;
  idx_dbo_viewTrabajadoresUnapprovedPrima = 12;
  idx_dbo_viewTrabajadoresUnapprovedHdA = 13;
  idx_dbo_viewTrabajadoresUnapprovedHeA = 14;
  idx_dbo_viewTrabajadoresUnapprovedPrimaA = 15;
  idx_dbo_viewTrabajadoresUnapprovedApproved = 16;
  idx_dbo_viewTrabajadoresUnapprovedNota = 17;

type
  { Idbo_viewTrabajadoresUnapproved }
  Idbo_viewTrabajadoresUnapproved = interface(IDAStronglyTypedDataTable)
  ['{DD89DBDA-56FF-414E-8BCF-4B97608B49AB}']
    { Property getters and setters }
    function GetDepartamentoIDValue: Integer;
    procedure SetDepartamentoIDValue(const aValue: Integer);
    function GetDepartamentoIDIsNull: Boolean;
    procedure SetDepartamentoIDIsNull(const aValue: Boolean);
    function GetDiaValue: Word;
    procedure SetDiaValue(const aValue: Word);
    function GetDiaIsNull: Boolean;
    procedure SetDiaIsNull(const aValue: Boolean);
    function GetTrabajadorIDValue: Integer;
    procedure SetTrabajadorIDValue(const aValue: Integer);
    function GetTrabajadorIDIsNull: Boolean;
    procedure SetTrabajadorIDIsNull(const aValue: Boolean);
    function GetNombreValue: String;
    procedure SetNombreValue(const aValue: String);
    function GetNombreIsNull: Boolean;
    procedure SetNombreIsNull(const aValue: Boolean);
    function GetEpValue: SmallInt;
    procedure SetEpValue(const aValue: SmallInt);
    function GetEpIsNull: Boolean;
    procedure SetEpIsNull(const aValue: Boolean);
    function GetSpValue: SmallInt;
    procedure SetSpValue(const aValue: SmallInt);
    function GetSpIsNull: Boolean;
    procedure SetSpIsNull(const aValue: Boolean);
    function GetErValue: SmallInt;
    procedure SetErValue(const aValue: SmallInt);
    function GetErIsNull: Boolean;
    procedure SetErIsNull(const aValue: Boolean);
    function GetSrValue: SmallInt;
    procedure SetSrValue(const aValue: SmallInt);
    function GetSrIsNull: Boolean;
    procedure SetSrIsNull(const aValue: Boolean);
    function GetHnValue: SmallInt;
    procedure SetHnValue(const aValue: SmallInt);
    function GetHnIsNull: Boolean;
    procedure SetHnIsNull(const aValue: Boolean);
    function GetHrValue: SmallInt;
    procedure SetHrValue(const aValue: SmallInt);
    function GetHrIsNull: Boolean;
    procedure SetHrIsNull(const aValue: Boolean);
    function GetHdValue: SmallInt;
    procedure SetHdValue(const aValue: SmallInt);
    function GetHdIsNull: Boolean;
    procedure SetHdIsNull(const aValue: Boolean);
    function GetHeValue: SmallInt;
    procedure SetHeValue(const aValue: SmallInt);
    function GetHeIsNull: Boolean;
    procedure SetHeIsNull(const aValue: Boolean);
    function GetPrimaValue: SmallInt;
    procedure SetPrimaValue(const aValue: SmallInt);
    function GetPrimaIsNull: Boolean;
    procedure SetPrimaIsNull(const aValue: Boolean);
    function GetHdAValue: SmallInt;
    procedure SetHdAValue(const aValue: SmallInt);
    function GetHdAIsNull: Boolean;
    procedure SetHdAIsNull(const aValue: Boolean);
    function GetHeAValue: SmallInt;
    procedure SetHeAValue(const aValue: SmallInt);
    function GetHeAIsNull: Boolean;
    procedure SetHeAIsNull(const aValue: Boolean);
    function GetPrimaAValue: SmallInt;
    procedure SetPrimaAValue(const aValue: SmallInt);
    function GetPrimaAIsNull: Boolean;
    procedure SetPrimaAIsNull(const aValue: Boolean);
    function GetApprovedValue: DateTime;
    procedure SetApprovedValue(const aValue: DateTime);
    function GetApprovedIsNull: Boolean;
    procedure SetApprovedIsNull(const aValue: Boolean);
    function GetNotaValue: String;
    procedure SetNotaValue(const aValue: String);
    function GetNotaIsNull: Boolean;
    procedure SetNotaIsNull(const aValue: Boolean);


    { Properties }
    property DepartamentoID: Integer read GetDepartamentoIDValue write SetDepartamentoIDValue;
    property DepartamentoIDIsNull: Boolean read GetDepartamentoIDIsNull write SetDepartamentoIDIsNull;
    property Dia: Word read GetDiaValue write SetDiaValue;
    property DiaIsNull: Boolean read GetDiaIsNull write SetDiaIsNull;
    property TrabajadorID: Integer read GetTrabajadorIDValue write SetTrabajadorIDValue;
    property TrabajadorIDIsNull: Boolean read GetTrabajadorIDIsNull write SetTrabajadorIDIsNull;
    property Nombre: String read GetNombreValue write SetNombreValue;
    property NombreIsNull: Boolean read GetNombreIsNull write SetNombreIsNull;
    property Ep: SmallInt read GetEpValue write SetEpValue;
    property EpIsNull: Boolean read GetEpIsNull write SetEpIsNull;
    property Sp: SmallInt read GetSpValue write SetSpValue;
    property SpIsNull: Boolean read GetSpIsNull write SetSpIsNull;
    property Er: SmallInt read GetErValue write SetErValue;
    property ErIsNull: Boolean read GetErIsNull write SetErIsNull;
    property Sr: SmallInt read GetSrValue write SetSrValue;
    property SrIsNull: Boolean read GetSrIsNull write SetSrIsNull;
    property Hn: SmallInt read GetHnValue write SetHnValue;
    property HnIsNull: Boolean read GetHnIsNull write SetHnIsNull;
    property Hr: SmallInt read GetHrValue write SetHrValue;
    property HrIsNull: Boolean read GetHrIsNull write SetHrIsNull;
    property Hd: SmallInt read GetHdValue write SetHdValue;
    property HdIsNull: Boolean read GetHdIsNull write SetHdIsNull;
    property He: SmallInt read GetHeValue write SetHeValue;
    property HeIsNull: Boolean read GetHeIsNull write SetHeIsNull;
    property Prima: SmallInt read GetPrimaValue write SetPrimaValue;
    property PrimaIsNull: Boolean read GetPrimaIsNull write SetPrimaIsNull;
    property HdA: SmallInt read GetHdAValue write SetHdAValue;
    property HdAIsNull: Boolean read GetHdAIsNull write SetHdAIsNull;
    property HeA: SmallInt read GetHeAValue write SetHeAValue;
    property HeAIsNull: Boolean read GetHeAIsNull write SetHeAIsNull;
    property PrimaA: SmallInt read GetPrimaAValue write SetPrimaAValue;
    property PrimaAIsNull: Boolean read GetPrimaAIsNull write SetPrimaAIsNull;
    property Approved: DateTime read GetApprovedValue write SetApprovedValue;
    property ApprovedIsNull: Boolean read GetApprovedIsNull write SetApprovedIsNull;
    property Nota: String read GetNotaValue write SetNotaValue;
    property NotaIsNull: Boolean read GetNotaIsNull write SetNotaIsNull;
  end;

  { Tdbo_viewTrabajadoresUnapprovedDataTableRules }
  Tdbo_viewTrabajadoresUnapprovedDataTableRules = class(TDADataTableRules, Idbo_viewTrabajadoresUnapproved)
  private
  protected
    { Property getters and setters }
    function GetDepartamentoIDValue: Integer; virtual;
    procedure SetDepartamentoIDValue(const aValue: Integer); virtual;
    function GetDepartamentoIDIsNull: Boolean; virtual;
    procedure SetDepartamentoIDIsNull(const aValue: Boolean); virtual;
    function GetDiaValue: Word; virtual;
    procedure SetDiaValue(const aValue: Word); virtual;
    function GetDiaIsNull: Boolean; virtual;
    procedure SetDiaIsNull(const aValue: Boolean); virtual;
    function GetTrabajadorIDValue: Integer; virtual;
    procedure SetTrabajadorIDValue(const aValue: Integer); virtual;
    function GetTrabajadorIDIsNull: Boolean; virtual;
    procedure SetTrabajadorIDIsNull(const aValue: Boolean); virtual;
    function GetNombreValue: String; virtual;
    procedure SetNombreValue(const aValue: String); virtual;
    function GetNombreIsNull: Boolean; virtual;
    procedure SetNombreIsNull(const aValue: Boolean); virtual;
    function GetEpValue: SmallInt; virtual;
    procedure SetEpValue(const aValue: SmallInt); virtual;
    function GetEpIsNull: Boolean; virtual;
    procedure SetEpIsNull(const aValue: Boolean); virtual;
    function GetSpValue: SmallInt; virtual;
    procedure SetSpValue(const aValue: SmallInt); virtual;
    function GetSpIsNull: Boolean; virtual;
    procedure SetSpIsNull(const aValue: Boolean); virtual;
    function GetErValue: SmallInt; virtual;
    procedure SetErValue(const aValue: SmallInt); virtual;
    function GetErIsNull: Boolean; virtual;
    procedure SetErIsNull(const aValue: Boolean); virtual;
    function GetSrValue: SmallInt; virtual;
    procedure SetSrValue(const aValue: SmallInt); virtual;
    function GetSrIsNull: Boolean; virtual;
    procedure SetSrIsNull(const aValue: Boolean); virtual;
    function GetHnValue: SmallInt; virtual;
    procedure SetHnValue(const aValue: SmallInt); virtual;
    function GetHnIsNull: Boolean; virtual;
    procedure SetHnIsNull(const aValue: Boolean); virtual;
    function GetHrValue: SmallInt; virtual;
    procedure SetHrValue(const aValue: SmallInt); virtual;
    function GetHrIsNull: Boolean; virtual;
    procedure SetHrIsNull(const aValue: Boolean); virtual;
    function GetHdValue: SmallInt; virtual;
    procedure SetHdValue(const aValue: SmallInt); virtual;
    function GetHdIsNull: Boolean; virtual;
    procedure SetHdIsNull(const aValue: Boolean); virtual;
    function GetHeValue: SmallInt; virtual;
    procedure SetHeValue(const aValue: SmallInt); virtual;
    function GetHeIsNull: Boolean; virtual;
    procedure SetHeIsNull(const aValue: Boolean); virtual;
    function GetPrimaValue: SmallInt; virtual;
    procedure SetPrimaValue(const aValue: SmallInt); virtual;
    function GetPrimaIsNull: Boolean; virtual;
    procedure SetPrimaIsNull(const aValue: Boolean); virtual;
    function GetHdAValue: SmallInt; virtual;
    procedure SetHdAValue(const aValue: SmallInt); virtual;
    function GetHdAIsNull: Boolean; virtual;
    procedure SetHdAIsNull(const aValue: Boolean); virtual;
    function GetHeAValue: SmallInt; virtual;
    procedure SetHeAValue(const aValue: SmallInt); virtual;
    function GetHeAIsNull: Boolean; virtual;
    procedure SetHeAIsNull(const aValue: Boolean); virtual;
    function GetPrimaAValue: SmallInt; virtual;
    procedure SetPrimaAValue(const aValue: SmallInt); virtual;
    function GetPrimaAIsNull: Boolean; virtual;
    procedure SetPrimaAIsNull(const aValue: Boolean); virtual;
    function GetApprovedValue: DateTime; virtual;
    procedure SetApprovedValue(const aValue: DateTime); virtual;
    function GetApprovedIsNull: Boolean; virtual;
    procedure SetApprovedIsNull(const aValue: Boolean); virtual;
    function GetNotaValue: String; virtual;
    procedure SetNotaValue(const aValue: String); virtual;
    function GetNotaIsNull: Boolean; virtual;
    procedure SetNotaIsNull(const aValue: Boolean); virtual;

    { Properties }
    property DepartamentoID: Integer read GetDepartamentoIDValue write SetDepartamentoIDValue;
    property DepartamentoIDIsNull: Boolean read GetDepartamentoIDIsNull write SetDepartamentoIDIsNull;
    property Dia: Word read GetDiaValue write SetDiaValue;
    property DiaIsNull: Boolean read GetDiaIsNull write SetDiaIsNull;
    property TrabajadorID: Integer read GetTrabajadorIDValue write SetTrabajadorIDValue;
    property TrabajadorIDIsNull: Boolean read GetTrabajadorIDIsNull write SetTrabajadorIDIsNull;
    property Nombre: String read GetNombreValue write SetNombreValue;
    property NombreIsNull: Boolean read GetNombreIsNull write SetNombreIsNull;
    property Ep: SmallInt read GetEpValue write SetEpValue;
    property EpIsNull: Boolean read GetEpIsNull write SetEpIsNull;
    property Sp: SmallInt read GetSpValue write SetSpValue;
    property SpIsNull: Boolean read GetSpIsNull write SetSpIsNull;
    property Er: SmallInt read GetErValue write SetErValue;
    property ErIsNull: Boolean read GetErIsNull write SetErIsNull;
    property Sr: SmallInt read GetSrValue write SetSrValue;
    property SrIsNull: Boolean read GetSrIsNull write SetSrIsNull;
    property Hn: SmallInt read GetHnValue write SetHnValue;
    property HnIsNull: Boolean read GetHnIsNull write SetHnIsNull;
    property Hr: SmallInt read GetHrValue write SetHrValue;
    property HrIsNull: Boolean read GetHrIsNull write SetHrIsNull;
    property Hd: SmallInt read GetHdValue write SetHdValue;
    property HdIsNull: Boolean read GetHdIsNull write SetHdIsNull;
    property He: SmallInt read GetHeValue write SetHeValue;
    property HeIsNull: Boolean read GetHeIsNull write SetHeIsNull;
    property Prima: SmallInt read GetPrimaValue write SetPrimaValue;
    property PrimaIsNull: Boolean read GetPrimaIsNull write SetPrimaIsNull;
    property HdA: SmallInt read GetHdAValue write SetHdAValue;
    property HdAIsNull: Boolean read GetHdAIsNull write SetHdAIsNull;
    property HeA: SmallInt read GetHeAValue write SetHeAValue;
    property HeAIsNull: Boolean read GetHeAIsNull write SetHeAIsNull;
    property PrimaA: SmallInt read GetPrimaAValue write SetPrimaAValue;
    property PrimaAIsNull: Boolean read GetPrimaAIsNull write SetPrimaAIsNull;
    property Approved: DateTime read GetApprovedValue write SetApprovedValue;
    property ApprovedIsNull: Boolean read GetApprovedIsNull write SetApprovedIsNull;
    property Nota: String read GetNotaValue write SetNotaValue;
    property NotaIsNull: Boolean read GetNotaIsNull write SetNotaIsNull;

  public
    constructor Create(aDataTable: TDADataTable); override;
    destructor Destroy; override;

  end;

implementation

uses Variants, uROBinaryHelpers;

{ Tdbo_viewTrabajadoresUnapprovedDataTableRules }
constructor Tdbo_viewTrabajadoresUnapprovedDataTableRules.Create(aDataTable: TDADataTable);
begin
  inherited;
end;

destructor Tdbo_viewTrabajadoresUnapprovedDataTableRules.Destroy;
begin
  inherited;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetDepartamentoIDValue: Integer;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDepartamentoID].AsInteger;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetDepartamentoIDValue(const aValue: Integer);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDepartamentoID].AsInteger := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetDepartamentoIDIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDepartamentoID].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetDepartamentoIDIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDepartamentoID].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetDiaValue: Word;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDia].AsWord;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetDiaValue(const aValue: Word);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDia].AsWord := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetDiaIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDia].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetDiaIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedDia].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetTrabajadorIDValue: Integer;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedTrabajadorID].AsInteger;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetTrabajadorIDValue(const aValue: Integer);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedTrabajadorID].AsInteger := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetTrabajadorIDIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedTrabajadorID].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetTrabajadorIDIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedTrabajadorID].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetNombreValue: String;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNombre].AsString;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetNombreValue(const aValue: String);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNombre].AsString := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetNombreIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNombre].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetNombreIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNombre].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetEpValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEp].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetEpValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEp].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetEpIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEp].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetEpIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEp].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetSpValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSp].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetSpValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSp].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetSpIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSp].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetSpIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSp].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetErValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEr].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetErValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEr].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetErIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEr].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetErIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedEr].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetSrValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSr].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetSrValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSr].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetSrIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSr].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetSrIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedSr].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHnValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHn].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHnValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHn].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHnIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHn].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHnIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHn].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHrValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHr].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHrValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHr].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHrIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHr].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHrIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHr].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHdValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHd].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHdValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHd].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHdIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHd].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHdIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHd].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHeValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHe].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHeValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHe].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHeIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHe].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHeIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHe].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetPrimaValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrima].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetPrimaValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrima].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetPrimaIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrima].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetPrimaIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrima].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHdAValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHdA].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHdAValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHdA].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHdAIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHdA].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHdAIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHdA].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHeAValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHeA].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHeAValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHeA].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetHeAIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHeA].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetHeAIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedHeA].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetPrimaAValue: SmallInt;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrimaA].AsSmallInt;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetPrimaAValue(const aValue: SmallInt);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrimaA].AsSmallInt := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetPrimaAIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrimaA].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetPrimaAIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedPrimaA].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetApprovedValue: DateTime;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedApproved].AsDateTime;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetApprovedValue(const aValue: DateTime);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedApproved].AsDateTime := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetApprovedIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedApproved].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetApprovedIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedApproved].AsVariant := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetNotaValue: String;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNota].AsString;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetNotaValue(const aValue: String);
begin
  DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNota].AsString := aValue;
end;

function Tdbo_viewTrabajadoresUnapprovedDataTableRules.GetNotaIsNull: boolean;
begin
  result := DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNota].IsNull;
end;

procedure Tdbo_viewTrabajadoresUnapprovedDataTableRules.SetNotaIsNull(const aValue: Boolean);
begin
  if aValue then
    DataTable.Fields[idx_dbo_viewTrabajadoresUnapprovedNota].AsVariant := Null;
end;


initialization
  RegisterDataTableRules(RID_dbo_viewTrabajadoresUnapproved, Tdbo_viewTrabajadoresUnapprovedDataTableRules);

end.
