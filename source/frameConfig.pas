unit frameConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus, DB, cxDBTL, dxmdaset, cxStyles, cxTL, cxGraphics,
  cxCustomData, cxMaskEdit, dxSkinsCore, dxSkinsDefaultPainters, cxClasses,
  ImgList, cxInplaceContainer, cxControls, cxTLData;

type
  TfrmConfig = class(TFrame)
    Tree: TcxDBTreeList;
    Nodos: TcxDBTreeListColumn;
    ObjectID: TcxDBTreeListColumn;
    ClassID: TcxDBTreeListColumn;
    Nodes: TdxMemData;
    NodesID: TAutoIncField;
    NodesParentID: TIntegerField;
    NodesName: TStringField;
    NodesObjectID: TIntegerField;
    NodesClassID: TIntegerField;
    dsNodes: TDataSource;
    StatusImages: TImageList;
    Menu: TPopupMenu;
    Colapsar1: TMenuItem;
    Expandir1: TMenuItem;
    N1: TMenuItem;
    Editar: TMenuItem;
    AddSitio: TMenuItem;
    AddDepto: TMenuItem;
    AddPeriodo: TMenuItem;
    AddNomina: TMenuItem;
    AddFeriado: TMenuItem;
    DelSelected: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    AddJornada: TMenuItem;
    AddOperador: TMenuItem;
    TreeImages: TImageList;
    NodesStatusID: TIntegerField;
    RecId: TcxDBTreeListColumn;
    ID: TcxDBTreeListColumn;
    ParentID: TcxDBTreeListColumn;
    Name: TcxDBTreeListColumn;
    StatusID: TcxDBTreeListColumn;
    AsignarJefe: TMenuItem;
    SetAsFavorite: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pmImages: TImageList;
    AddMunicipio: TMenuItem;
    AddExcepcion: TMenuItem;
    MoveToDepto: TMenuItem;
    procedure TreeGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode;
      AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure MenuPopup(Sender: TObject);
    procedure Colapsar1Click(Sender: TObject);
    procedure Expandir1Click(Sender: TObject);
    procedure AddSitioClick(Sender: TObject);
    procedure AddDeptoClick(Sender: TObject);
    procedure AddPeriodoClick(Sender: TObject);
    procedure AddNominaClick(Sender: TObject);
    procedure AddFeriadoClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure DelSelectedClick(Sender: TObject);
    procedure AddJornadaClick(Sender: TObject);
    procedure AddOperadorClick(Sender: TObject);
    procedure AsignarJefeClick(Sender: TObject);
    procedure SetAsFavoriteClick(Sender: TObject);
    procedure AddMunicipioClick(Sender: TObject);
    procedure AddExcepcionClick(Sender: TObject);
    procedure MoveToDeptoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load;
    procedure UnLoad;
  end;

implementation

{$R *.dfm}

uses
  fClientDataModule, fSitio, fTrabajador, fLectora, fDepartamento, fFeriado, fNomina, fJornada, fOperador,
  fHorario, fMunicipio, fExcepcion, DateUtils,
  uROPleaseWaitForm;

{ TfrmConfig }

procedure TfrmConfig.Load;
begin
  PleaseWaitForm.Show('Cargando configuración...');
  try
    Nodes.Close;
    with ClientDataModule do
      begin
        tbl_ConfigTree.ParamByName('OperadorID').AsInteger := OperadorID;
        tbl_ConfigTree.Open;
        Nodes.Open;
        while not tbl_ConfigTree.EOF do
          begin
            Nodes.Append;
              NodesID.Value       := tbl_ConfigTree.FieldByName('ID'      ).Value;
              NodesParentID.Value := tbl_ConfigTree.FieldByName('ParentID').Value;
              NodesName.Value     := tbl_ConfigTree.FieldByName('Caption' ).Value;
              NodesObjectID.Value := tbl_ConfigTree.FieldByName('ObjectID').Value;
              NodesClassID.Value  := tbl_ConfigTree.FieldByName('ClassID' ).Value;
              NodesStatusID.Value := tbl_ConfigTree.FieldByName('StatusID').Value;
            Nodes.Post;

            tbl_ConfigTree.Next;
          end;
        tbl_ConfigTree.Close;

        tbl_dboDepartamento.Close;
        tbl_dboDepartamento.Open;
      end;
  finally
    PleaseWaitForm.Hide;
  end;
end;

procedure TfrmConfig.UnLoad;
begin
  Nodes.Close;
  ClientDataModule.tbl_dboDepartamento.Close;
end;

procedure TfrmConfig.TreeGetNodeImageIndex(Sender: TObject;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
  var AIndex: TImageIndex);

begin
  case AIndexType of
    tlitImageIndex,
    tlitSelectedIndex :
      begin
        if ANode.Level = 0
          then AIndex := 0
          else AIndex := ANode.Values[ClassID.ItemIndex];
      end;
    tlitStateIndex    :
      if ANode.Level > 0
        then
          case ANode.Values[ClassID.ItemIndex] of
            4 : // Trabajador
              if ANode.Values[StatusID.ItemIndex] = 1
                then AIndex := 0; // Icono 0 -> JEFE
            5 : // Horario
              if ANode.Values[StatusID.ItemIndex] = 1
                then AIndex := 1; // Icono 1 -> Horario preferido
            12 : // Turno
              if ANode.Values[StatusID.ItemIndex] = 1
                then AIndex := 2; // Icono 2 -> Turno preferido
            14 : // Operador
              AIndex := ANode.Values[StatusID.ItemIndex] + 2; // Iconos 3..5 -> Admin, JRH, JD
            else
          end;
  end;
end;

procedure TfrmConfig.MenuPopup(Sender: TObject);
var
  mi : TMenuItem;
  DeptoID : integer;
begin
  AddMunicipio.Visible  := (ClientDataModule.Autoridad  = 1) and (Tree.FocusedNode.Level = 0);
  AddSitio.Visible      := (ClientDataModule.Autoridad  = 1) and (Tree.FocusedNode.Level = 1) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 15);
  AddDepto.Visible      := (ClientDataModule.Autoridad <= 2) and (Tree.FocusedNode.Level = 2) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 1);
  AddExcepcion.Visible  := (ClientDataModule.Autoridad  = 3) and (Tree.FocusedNode.Level = 4) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 4);
  AddPeriodo.Visible    := (ClientDataModule.Autoridad <= 2) and (Tree.FocusedNode.Level = 1) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 7);
  AddNomina.Visible     := (ClientDataModule.Autoridad <= 2) and (Tree.FocusedNode.Level = 1) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 8);
  AddFeriado.Visible    := (ClientDataModule.Autoridad <= 2) and (Tree.FocusedNode.Level = 1) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 9);
  AddJornada.Visible    := (ClientDataModule.Autoridad <= 2) and (Tree.FocusedNode.Level = 1) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 11);
  AddOperador.Visible   := (ClientDataModule.Autoridad <= 2) and (Tree.FocusedNode.Level = 1) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 13);
  AsignarJefe.Visible   :=
    (ClientDataModule.Autoridad <= 2) and
    (Tree.FocusedNode.Level = 4) and                     // Objetos / Sitio / Departamento
    (Tree.FocusedNode.Values[ClassID.ItemIndex] = 4) and // Trabajador
    (Tree.FocusedNode.Values[StatusID.ItemIndex] = 0);   // No Jefe
  MoveToDepto.Visible   :=
    (ClientDataModule.Autoridad <= 2) and
    (Tree.FocusedNode.Level = 4) and                     // Objetos / Sitio / Departamento
    (Tree.FocusedNode.Values[ClassID.ItemIndex] = 4) and // Trabajador
    (Tree.FocusedNode.Values[StatusID.ItemIndex] = 0);   // No Jefe

  if MoveToDepto.Visible
    then
      begin
        MoveToDepto.Clear;
        with ClientDataModule, tbl_dboDepartamento do
          begin
            Close;
            Open;
            try
              while not Eof do
                begin
                  DeptoID := FieldByName('ID').AsInteger;
                  if DeptoID <> Tree.FocusedNode.Parent.Values[ObjectID.ItemIndex]
                    then
                      begin
                        mi := TMenuItem.Create(nil);
                        mi.Caption := FieldByName('Nombre').AsString;
                        mi.ImageIndex := 4;
                        mi.Tag        := DeptoID;
                        mi.OnClick    := MoveToDeptoClick;

                        MoveToDepto.Add(mi);
                      end;
                  Next;
                end;
              MoveToDepto.Visible := MoveToDepto.Count > 0;
              
            finally
              Close;
            end;
          end;
      end;

  SetAsFavorite.Visible :=
    (ClientDataModule.Autoridad <= 2) and
    (Tree.FocusedNode.Level = 2) and                     // Objetos / Horarios | Turnos / Horario | Turno
    (integer(Tree.FocusedNode.Values[ClassID.ItemIndex]) in [5, 12]) and // Horario | Turno
    (Tree.FocusedNode.Values[StatusID.ItemIndex] = 0);   // No Favorito
  DelSelected.Visible   :=
    (ClientDataModule.Autoridad = 1) and (Tree.FocusedNode.Level > 0) and (integer(Tree.FocusedNode.Values[ClassID.ItemIndex]) in [1..6, 10, 12, 14..15]) and not Tree.FocusedNode.HasChildren
    OR
    (ClientDataModule.Autoridad = 3) and (Tree.FocusedNode.Level > 0) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 16);
  Editar.Visible        :=
    (ClientDataModule.Autoridad = 1) and (Tree.FocusedNode.Level > 0) and (integer(Tree.FocusedNode.Values[ClassID.ItemIndex]) in [1..6, 10, 12, 14..15])
    OR
    (ClientDataModule.Autoridad = 3) and (Tree.FocusedNode.Level > 0) and (integer(Tree.FocusedNode.Values[ClassID.ItemIndex]) in [4, 16]);
end;

procedure TfrmConfig.MoveToDeptoClick(Sender: TObject);
var
  ObjID : integer;
begin
  ObjID := integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]);
  if ClientDataModule.MoveToDepartamento(ObjID, TMenuItem(Sender).Tag)
    then Load;
end;

procedure TfrmConfig.SetAsFavoriteClick(Sender: TObject);
var
  ObjID : integer;
begin
  ObjID := integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]);
  if Tree.FocusedNode.Values[ClassID.ItemIndex] = 5
    then ClientDataModule.SetHorarioFavorito(ObjID)
    else ClientDataModule.SetTurnoFavorito  (ObjID);
  Load;
end;

procedure TfrmConfig.AddMunicipioClick(Sender: TObject);
var
  ID : integer;
begin
  with ClientDataModule do
    begin
      CreateNewMunicipio('Municipio nuevo', ID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 15]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AddSitioClick(Sender: TObject);
var
  MunicipioID, ID : integer;
begin
  MunicipioID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
  with ClientDataModule do
    begin
      CreateNewSitio('Sitio nuevo', MunicipioID, ID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 1]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AsignarJefeClick(Sender: TObject);
var
  TrabID, OperID : integer;
begin
  TrabID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
  with ClientDataModule do
    begin
      AsignarJefe(TrabID, OperID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([OperID, 14]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AddDeptoClick(Sender: TObject);
var
  ID, SitioID : integer;
begin
  SitioID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
  with ClientDataModule do
    begin
      CreateNewDepto('Departamento nuevo', SitioID, ID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 2]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AddPeriodoClick(Sender: TObject);
var
  ID : integer;
begin
  with ClientDataModule do
    begin
      CreateNewPeriodo('Horario nuevo', ID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 5]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AddNominaClick(Sender: TObject);
var
  ID : integer;
begin
  with ClientDataModule do
    begin
      if not Tree.FocusedNode.HasChildren
        then CreateFirstNomina(Now(), ID)
        else CreateNewNomina(ID);
        
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 10]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AddExcepcionClick(Sender: TObject);
var
  r : boolean;
begin
  frmExcepcion := TfrmExcepcion.Create(nil);
  try
    r := frmExcepcion.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]), 0);
  finally
    frmExcepcion.Free;
  end;

  if r
    then Load;
end;

procedure TfrmConfig.AddFeriadoClick(Sender: TObject);
var
  ID : integer;
begin
  with ClientDataModule do
    begin
      CreateNewFeriado('Feriado nuevo', Now(), ID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 6]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AddJornadaClick(Sender: TObject);
var
  ID : integer;
begin
  with ClientDataModule do
    begin
      CreateNewJornada('Turno nuevo', 800, 1500, ID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 12]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.AddOperadorClick(Sender: TObject);
var
  ID : integer;
begin
  with ClientDataModule do
    begin
      CreateNewOperador('Operador', '', 1, 0, ID);
      Load;
      if Nodes.Locate('ObjectID; ClassID', VarArrayOf([ID, 14]),[])
        then EditarClick(nil);
    end;
end;

procedure TfrmConfig.Colapsar1Click(Sender: TObject);
begin
  Tree.FocusedNode.Collapse(true);
end;

procedure TfrmConfig.Expandir1Click(Sender: TObject);
begin
  Tree.FocusedNode.Expand(true);
end;

procedure TfrmConfig.DelSelectedClick(Sender: TObject);
var
  eFecha : integer;
  Fecha  : TDateTime;
begin
  case integer(Tree.FocusedNode.Values[ClassID.ItemIndex]) of
    1 : // Sitio
      begin
        ClientDataModule.DeleteSitio(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
        // then MessageDlg('No se pudo eliminar', mtInformation, [mbOk], 0);
      end;
    2 : // Departamento
      begin
        ClientDataModule.DeleteDepto(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    3 : // Lectora
      begin
        ClientDataModule.DeleteLectora(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    4 : // Trabajador
      begin
        ClientDataModule.DeleteTrabajador(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    5 : // Período
      begin
        ClientDataModule.DeletePeriodo(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    6 : // Feriado
      begin
        ClientDataModule.DeleteFeriado(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    10 : // Nómina
      begin
        ClientDataModule.DeleteNomina(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    12 : // Jornada
      begin
        ClientDataModule.DeleteJornada(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
      end;
    14 : // Operador
      begin
        ClientDataModule.DeleteOperador(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    15 : // Municipio
      begin
        ClientDataModule.DeleteMunicipio(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]))
      end;
    16 : // Excepción ***
      begin
        // Hay que extraer del nodo la Fecha como YYYYMMDD ... en Status
        eFecha := integer(Tree.FocusedNode.Values[StatusID.ItemIndex]);
        Fecha  := EncodeDate(eFecha div 10000, (eFecha div 100) mod 100, eFecha mod 100);
        ClientDataModule.DeleteExcepcion(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]), Fecha);
      end;
  end;
  Load;
end;

procedure TfrmConfig.EditarClick(Sender: TObject);
var
  eFecha : integer;
  Fecha  : TDateTime;
  r : boolean;
begin
  //
  r := false;
  case integer(Tree.FocusedNode.Values[ClassID.ItemIndex]) of
    1 : // Sitio
      begin
        frmSitio := TfrmSitio.Create(nil);
        try
          r := frmSitio.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmSitio.Free;
        end;
      end;
    2 : // Departamento
      begin
        frmDepartamento := TfrmDepartamento.Create(nil);
        try
          r := frmDepartamento.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmDepartamento.Free;
        end;
      end;
    3 : // Lectora
      begin
        frmLectora := TfrmLectora.Create(nil);
        try
          r := frmLectora.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmLectora.Free;
        end;
      end;
    4 : // Trabajador
      begin
        frmTrabajador := TfrmTrabajador.Create(nil);
        try
          r := frmTrabajador.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmTrabajador.Free;
        end;
      end;
    5 : // Período
      begin
        frmHorario := TfrmHorario.Create(nil);
        try
          r := frmHorario.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmHorario.Free;
        end;
      end;
    6 : // Feriado
      begin
        frmFeriado := TfrmFeriado.Create(nil);
        try
          r := frmFeriado.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmFeriado.Free;
        end;
      end;
    10 : // Nómina
      begin
        frmNomina := TfrmNomina.Create(nil);
        try
          r := frmNomina.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]), Tree.FocusedNode.Parent.Count > 1);
        finally
          frmNomina.Free;
        end;
      end;
    12 : // Jornada
      begin
        frmJornada := TfrmJornada.Create(nil);
        try
          r := frmJornada.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmJornada.Free;
        end;
      end;
    14 : // Operador
      begin
        frmOperador := TfrmOperador.Create(nil);
        try
          r := frmOperador.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmOperador.Free;
        end;
      end;
    15 : // Municipio
      begin
        frmMunicipio := TfrmMunicipio.Create(nil);
        try
          r := frmMunicipio.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]));
        finally
          frmMunicipio.Free;
        end;
      end;
    16 : // Excepción
      begin
        eFecha := integer(Tree.FocusedNode.Values[StatusID.ItemIndex]);
        Fecha  := EncodeDate(eFecha div 10000, (eFecha div 100) mod 100, eFecha mod 100);

        frmExcepcion := TfrmExcepcion.Create(nil);
        try
          r := frmExcepcion.Edit(integer(Tree.FocusedNode.Values[ObjectID.ItemIndex]), Fecha);
        finally
          frmExcepcion.Free;
        end;
      end;
  end;
  if r
    then Load;
end;

end.
