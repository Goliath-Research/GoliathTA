unit dbo_viewTrabajadoresUnapprovedServer_Intf;

interface

uses
  Classes, DB, SysUtils, uROClasses, uDADataTable, uDABusinessProcessor, FmtBCD, uROXMLIntf, dbo_viewTrabajadoresUnapprovedClient_Intf;

const
  { Delta rules ids 
       Feel free to change them to something more human readable
       but make sure they are unique in the context of your application }
  RID_dbo_viewTrabajadoresUnapprovedDelta = '{E4A4F4CA-0E07-496B-A535-D97692916C59}';

type
  { Idbo_viewTrabajadoresUnapprovedDelta }
  Idbo_viewTrabajadoresUnapprovedDelta = interface(Idbo_viewTrabajadoresUnapproved)
  ['{E4A4F4CA-0E07-496B-A535-D97692916C59}']
    { Property getters and setters }
    function GetOldDepartamentoIDValue : Integer;
    function GetOldDiaValue : Word;
    function GetOldTrabajadorIDValue : Integer;
    function GetOldNombreValue : String;
    function GetOldEpValue : SmallInt;
    function GetOldSpValue : SmallInt;
    function GetOldErValue : SmallInt;
    function GetOldSrValue : SmallInt;
    function GetOldHnValue : SmallInt;
    function GetOldHrValue : SmallInt;
    function GetOldHdValue : SmallInt;
    function GetOldHeValue : SmallInt;
    function GetOldPrimaValue : SmallInt;
    function GetOldHdAValue : SmallInt;
    function GetOldHeAValue : SmallInt;
    function GetOldPrimaAValue : SmallInt;
    function GetOldApprovedValue : DateTime;
    function GetOldNotaValue : String;

    { Properties }
    property OldDepartamentoID : Integer read GetOldDepartamentoIDValue;
    property OldDia : Word read GetOldDiaValue;
    property OldTrabajadorID : Integer read GetOldTrabajadorIDValue;
    property OldNombre : String read GetOldNombreValue;
    property OldEp : SmallInt read GetOldEpValue;
    property OldSp : SmallInt read GetOldSpValue;
    property OldEr : SmallInt read GetOldErValue;
    property OldSr : SmallInt read GetOldSrValue;
    property OldHn : SmallInt read GetOldHnValue;
    property OldHr : SmallInt read GetOldHrValue;
    property OldHd : SmallInt read GetOldHdValue;
    property OldHe : SmallInt read GetOldHeValue;
    property OldPrima : SmallInt read GetOldPrimaValue;
    property OldHdA : SmallInt read GetOldHdAValue;
    property OldHeA : SmallInt read GetOldHeAValue;
    property OldPrimaA : SmallInt read GetOldPrimaAValue;
    property OldApproved : DateTime read GetOldApprovedValue;
    property OldNota : String read GetOldNotaValue;
  end;

  { Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules }
  Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules = class(TDABusinessProcessorRules, Idbo_viewTrabajadoresUnapproved, Idbo_viewTrabajadoresUnapprovedDelta)
  private
  protected
    { Property getters and setters }
    function GetDepartamentoIDValue: Integer; virtual;
    function GetDepartamentoIDIsNull: Boolean; virtual;
    function GetOldDepartamentoIDValue: Integer; virtual;
    function GetOldDepartamentoIDIsNull: Boolean; virtual;
    procedure SetDepartamentoIDValue(const aValue: Integer); virtual;
    procedure SetDepartamentoIDIsNull(const aValue: Boolean); virtual;
    function GetDiaValue: Word; virtual;
    function GetDiaIsNull: Boolean; virtual;
    function GetOldDiaValue: Word; virtual;
    function GetOldDiaIsNull: Boolean; virtual;
    procedure SetDiaValue(const aValue: Word); virtual;
    procedure SetDiaIsNull(const aValue: Boolean); virtual;
    function GetTrabajadorIDValue: Integer; virtual;
    function GetTrabajadorIDIsNull: Boolean; virtual;
    function GetOldTrabajadorIDValue: Integer; virtual;
    function GetOldTrabajadorIDIsNull: Boolean; virtual;
    procedure SetTrabajadorIDValue(const aValue: Integer); virtual;
    procedure SetTrabajadorIDIsNull(const aValue: Boolean); virtual;
    function GetNombreValue: String; virtual;
    function GetNombreIsNull: Boolean; virtual;
    function GetOldNombreValue: String; virtual;
    function GetOldNombreIsNull: Boolean; virtual;
    procedure SetNombreValue(const aValue: String); virtual;
    procedure SetNombreIsNull(const aValue: Boolean); virtual;
    function GetEpValue: SmallInt; virtual;
    function GetEpIsNull: Boolean; virtual;
    function GetOldEpValue: SmallInt; virtual;
    function GetOldEpIsNull: Boolean; virtual;
    procedure SetEpValue(const aValue: SmallInt); virtual;
    procedure SetEpIsNull(const aValue: Boolean); virtual;
    function GetSpValue: SmallInt; virtual;
    function GetSpIsNull: Boolean; virtual;
    function GetOldSpValue: SmallInt; virtual;
    function GetOldSpIsNull: Boolean; virtual;
    procedure SetSpValue(const aValue: SmallInt); virtual;
    procedure SetSpIsNull(const aValue: Boolean); virtual;
    function GetErValue: SmallInt; virtual;
    function GetErIsNull: Boolean; virtual;
    function GetOldErValue: SmallInt; virtual;
    function GetOldErIsNull: Boolean; virtual;
    procedure SetErValue(const aValue: SmallInt); virtual;
    procedure SetErIsNull(const aValue: Boolean); virtual;
    function GetSrValue: SmallInt; virtual;
    function GetSrIsNull: Boolean; virtual;
    function GetOldSrValue: SmallInt; virtual;
    function GetOldSrIsNull: Boolean; virtual;
    procedure SetSrValue(const aValue: SmallInt); virtual;
    procedure SetSrIsNull(const aValue: Boolean); virtual;
    function GetHnValue: SmallInt; virtual;
    function GetHnIsNull: Boolean; virtual;
    function GetOldHnValue: SmallInt; virtual;
    function GetOldHnIsNull: Boolean; virtual;
    procedure SetHnValue(const aValue: SmallInt); virtual;
    procedure SetHnIsNull(const aValue: Boolean); virtual;
    function GetHrValue: SmallInt; virtual;
    function GetHrIsNull: Boolean; virtual;
    function GetOldHrValue: SmallInt; virtual;
    function GetOldHrIsNull: Boolean; virtual;
    procedure SetHrValue(const aValue: SmallInt); virtual;
    procedure SetHrIsNull(const aValue: Boolean); virtual;
    function GetHdValue: SmallInt; virtual;
    function GetHdIsNull: Boolean; virtual;
    function GetOldHdValue: SmallInt; virtual;
    function GetOldHdIsNull: Boolean; virtual;
    procedure SetHdValue(const aValue: SmallInt); virtual;
    procedure SetHdIsNull(const aValue: Boolean); virtual;
    function GetHeValue: SmallInt; virtual;
    function GetHeIsNull: Boolean; virtual;
    function GetOldHeValue: SmallInt; virtual;
    function GetOldHeIsNull: Boolean; virtual;
    procedure SetHeValue(const aValue: SmallInt); virtual;
    procedure SetHeIsNull(const aValue: Boolean); virtual;
    function GetPrimaValue: SmallInt; virtual;
    function GetPrimaIsNull: Boolean; virtual;
    function GetOldPrimaValue: SmallInt; virtual;
    function GetOldPrimaIsNull: Boolean; virtual;
    procedure SetPrimaValue(const aValue: SmallInt); virtual;
    procedure SetPrimaIsNull(const aValue: Boolean); virtual;
    function GetHdAValue: SmallInt; virtual;
    function GetHdAIsNull: Boolean; virtual;
    function GetOldHdAValue: SmallInt; virtual;
    function GetOldHdAIsNull: Boolean; virtual;
    procedure SetHdAValue(const aValue: SmallInt); virtual;
    procedure SetHdAIsNull(const aValue: Boolean); virtual;
    function GetHeAValue: SmallInt; virtual;
    function GetHeAIsNull: Boolean; virtual;
    function GetOldHeAValue: SmallInt; virtual;
    function GetOldHeAIsNull: Boolean; virtual;
    procedure SetHeAValue(const aValue: SmallInt); virtual;
    procedure SetHeAIsNull(const aValue: Boolean); virtual;
    function GetPrimaAValue: SmallInt; virtual;
    function GetPrimaAIsNull: Boolean; virtual;
    function GetOldPrimaAValue: SmallInt; virtual;
    function GetOldPrimaAIsNull: Boolean; virtual;
    procedure SetPrimaAValue(const aValue: SmallInt); virtual;
    procedure SetPrimaAIsNull(const aValue: Boolean); virtual;
    function GetApprovedValue: DateTime; virtual;
    function GetApprovedIsNull: Boolean; virtual;
    function GetOldApprovedValue: DateTime; virtual;
    function GetOldApprovedIsNull: Boolean; virtual;
    procedure SetApprovedValue(const aValue: DateTime); virtual;
    procedure SetApprovedIsNull(const aValue: Boolean); virtual;
    function GetNotaValue: String; virtual;
    function GetNotaIsNull: Boolean; virtual;
    function GetOldNotaValue: String; virtual;
    function GetOldNotaIsNull: Boolean; virtual;
    procedure SetNotaValue(const aValue: String); virtual;
    procedure SetNotaIsNull(const aValue: Boolean); virtual;

    { Properties }
    property DepartamentoID : Integer read GetDepartamentoIDValue write SetDepartamentoIDValue;
    property DepartamentoIDIsNull : Boolean read GetDepartamentoIDIsNull write SetDepartamentoIDIsNull;
    property OldDepartamentoID : Integer read GetOldDepartamentoIDValue;
    property OldDepartamentoIDIsNull : Boolean read GetOldDepartamentoIDIsNull;
    property Dia : Word read GetDiaValue write SetDiaValue;
    property DiaIsNull : Boolean read GetDiaIsNull write SetDiaIsNull;
    property OldDia : Word read GetOldDiaValue;
    property OldDiaIsNull : Boolean read GetOldDiaIsNull;
    property TrabajadorID : Integer read GetTrabajadorIDValue write SetTrabajadorIDValue;
    property TrabajadorIDIsNull : Boolean read GetTrabajadorIDIsNull write SetTrabajadorIDIsNull;
    property OldTrabajadorID : Integer read GetOldTrabajadorIDValue;
    property OldTrabajadorIDIsNull : Boolean read GetOldTrabajadorIDIsNull;
    property Nombre : String read GetNombreValue write SetNombreValue;
    property NombreIsNull : Boolean read GetNombreIsNull write SetNombreIsNull;
    property OldNombre : String read GetOldNombreValue;
    property OldNombreIsNull : Boolean read GetOldNombreIsNull;
    property Ep : SmallInt read GetEpValue write SetEpValue;
    property EpIsNull : Boolean read GetEpIsNull write SetEpIsNull;
    property OldEp : SmallInt read GetOldEpValue;
    property OldEpIsNull : Boolean read GetOldEpIsNull;
    property Sp : SmallInt read GetSpValue write SetSpValue;
    property SpIsNull : Boolean read GetSpIsNull write SetSpIsNull;
    property OldSp : SmallInt read GetOldSpValue;
    property OldSpIsNull : Boolean read GetOldSpIsNull;
    property Er : SmallInt read GetErValue write SetErValue;
    property ErIsNull : Boolean read GetErIsNull write SetErIsNull;
    property OldEr : SmallInt read GetOldErValue;
    property OldErIsNull : Boolean read GetOldErIsNull;
    property Sr : SmallInt read GetSrValue write SetSrValue;
    property SrIsNull : Boolean read GetSrIsNull write SetSrIsNull;
    property OldSr : SmallInt read GetOldSrValue;
    property OldSrIsNull : Boolean read GetOldSrIsNull;
    property Hn : SmallInt read GetHnValue write SetHnValue;
    property HnIsNull : Boolean read GetHnIsNull write SetHnIsNull;
    property OldHn : SmallInt read GetOldHnValue;
    property OldHnIsNull : Boolean read GetOldHnIsNull;
    property Hr : SmallInt read GetHrValue write SetHrValue;
    property HrIsNull : Boolean read GetHrIsNull write SetHrIsNull;
    property OldHr : SmallInt read GetOldHrValue;
    property OldHrIsNull : Boolean read GetOldHrIsNull;
    property Hd : SmallInt read GetHdValue write SetHdValue;
    property HdIsNull : Boolean read GetHdIsNull write SetHdIsNull;
    property OldHd : SmallInt read GetOldHdValue;
    property OldHdIsNull : Boolean read GetOldHdIsNull;
    property He : SmallInt read GetHeValue write SetHeValue;
    property HeIsNull : Boolean read GetHeIsNull write SetHeIsNull;
    property OldHe : SmallInt read GetOldHeValue;
    property OldHeIsNull : Boolean read GetOldHeIsNull;
    property Prima : SmallInt read GetPrimaValue write SetPrimaValue;
    property PrimaIsNull : Boolean read GetPrimaIsNull write SetPrimaIsNull;
    property OldPrima : SmallInt read GetOldPrimaValue;
    property OldPrimaIsNull : Boolean read GetOldPrimaIsNull;
    property HdA : SmallInt read GetHdAValue write SetHdAValue;
    property HdAIsNull : Boolean read GetHdAIsNull write SetHdAIsNull;
    property OldHdA : SmallInt read GetOldHdAValue;
    property OldHdAIsNull : Boolean read GetOldHdAIsNull;
    property HeA : SmallInt read GetHeAValue write SetHeAValue;
    property HeAIsNull : Boolean read GetHeAIsNull write SetHeAIsNull;
    property OldHeA : SmallInt read GetOldHeAValue;
    property OldHeAIsNull : Boolean read GetOldHeAIsNull;
    property PrimaA : SmallInt read GetPrimaAValue write SetPrimaAValue;
    property PrimaAIsNull : Boolean read GetPrimaAIsNull write SetPrimaAIsNull;
    property OldPrimaA : SmallInt read GetOldPrimaAValue;
    property OldPrimaAIsNull : Boolean read GetOldPrimaAIsNull;
    property Approved : DateTime read GetApprovedValue write SetApprovedValue;
    property ApprovedIsNull : Boolean read GetApprovedIsNull write SetApprovedIsNull;
    property OldApproved : DateTime read GetOldApprovedValue;
    property OldApprovedIsNull : Boolean read GetOldApprovedIsNull;
    property Nota : String read GetNotaValue write SetNotaValue;
    property NotaIsNull : Boolean read GetNotaIsNull write SetNotaIsNull;
    property OldNota : String read GetOldNotaValue;
    property OldNotaIsNull : Boolean read GetOldNotaIsNull;

  public
    constructor Create(aBusinessProcessor: TDABusinessProcessor); override;
    destructor Destroy; override;

  end;

implementation

uses
  Variants, uROBinaryHelpers, uDAInterfaces;

{ Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules }
constructor Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.Create(aBusinessProcessor: TDABusinessProcessor);
begin
  inherited;
end;

destructor Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.Destroy;
begin
  inherited;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetDepartamentoIDValue: Integer;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDepartamentoID];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetDepartamentoIDIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDepartamentoID]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldDepartamentoIDValue: Integer;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedDepartamentoID];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldDepartamentoIDIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedDepartamentoID]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetDepartamentoIDValue(const aValue: Integer);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDepartamentoID] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetDepartamentoIDIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDepartamentoID] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetDiaValue: Word;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDia];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetDiaIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDia]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldDiaValue: Word;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedDia];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldDiaIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedDia]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetDiaValue(const aValue: Word);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDia] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetDiaIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedDia] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetTrabajadorIDValue: Integer;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedTrabajadorID];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetTrabajadorIDIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedTrabajadorID]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldTrabajadorIDValue: Integer;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedTrabajadorID];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldTrabajadorIDIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedTrabajadorID]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetTrabajadorIDValue(const aValue: Integer);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedTrabajadorID] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetTrabajadorIDIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedTrabajadorID] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetNombreValue: String;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNombre];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetNombreIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNombre]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldNombreValue: String;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedNombre];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldNombreIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedNombre]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetNombreValue(const aValue: String);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNombre] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetNombreIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNombre] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetEpValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEp];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetEpIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEp]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldEpValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedEp];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldEpIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedEp]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetEpValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEp] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetEpIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEp] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetSpValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSp];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetSpIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSp]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldSpValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedSp];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldSpIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedSp]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetSpValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSp] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetSpIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSp] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetErValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEr];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetErIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEr]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldErValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedEr];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldErIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedEr]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetErValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEr] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetErIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedEr] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetSrValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSr];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetSrIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSr]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldSrValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedSr];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldSrIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedSr]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetSrValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSr] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetSrIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedSr] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHnValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHn];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHnIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHn]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHnValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHn];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHnIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHn]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHnValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHn] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHnIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHn] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHrValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHr];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHrIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHr]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHrValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHr];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHrIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHr]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHrValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHr] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHrIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHr] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHdValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHd];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHdIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHd]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHdValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHd];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHdIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHd]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHdValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHd] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHdIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHd] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHeValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHe];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHeIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHe]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHeValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHe];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHeIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHe]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHeValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHe] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHeIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHe] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetPrimaValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrima];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetPrimaIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrima]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldPrimaValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedPrima];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldPrimaIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedPrima]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetPrimaValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrima] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetPrimaIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrima] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHdAValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHdA];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHdAIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHdA]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHdAValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHdA];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHdAIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHdA]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHdAValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHdA] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHdAIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHdA] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHeAValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHeA];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetHeAIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHeA]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHeAValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHeA];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldHeAIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedHeA]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHeAValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHeA] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetHeAIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedHeA] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetPrimaAValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrimaA];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetPrimaAIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrimaA]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldPrimaAValue: SmallInt;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedPrimaA];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldPrimaAIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedPrimaA]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetPrimaAValue(const aValue: SmallInt);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrimaA] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetPrimaAIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedPrimaA] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetApprovedValue: DateTime;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedApproved];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetApprovedIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedApproved]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldApprovedValue: DateTime;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedApproved];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldApprovedIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedApproved]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetApprovedValue(const aValue: DateTime);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedApproved] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetApprovedIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedApproved] := Null;
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetNotaValue: String;
begin
  result := BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNota];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetNotaIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNota]);
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldNotaValue: String;
begin
  result := BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedNota];
end;

function Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.GetOldNotaIsNull: Boolean;
begin
  result := VarIsNull(BusinessProcessor.CurrentChange.OldValueByName[fld_dbo_viewTrabajadoresUnapprovedNota]);
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetNotaValue(const aValue: String);
begin
  BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNota] := aValue;
end;

procedure Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules.SetNotaIsNull(const aValue: Boolean);
begin
  if aValue then
    BusinessProcessor.CurrentChange.NewValueByName[fld_dbo_viewTrabajadoresUnapprovedNota] := Null;
end;


initialization
  RegisterBusinessProcessorRules(RID_dbo_viewTrabajadoresUnapprovedDelta, Tdbo_viewTrabajadoresUnapprovedBusinessProcessorRules);

end.
