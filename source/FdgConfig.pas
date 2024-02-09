unit FdgConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, cxClasses,
  Menus, ImgList, DB, ADODB, dxmdaset, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, dxSkinsCore, dxSkinsDefaultPainters;

type
  TframeConfig = class(TFrame)
    Tree: TcxDBTreeList;
    Nodos: TcxDBTreeListColumn;
    Nodes: TdxMemData;
    NodesID: TAutoIncField;
    NodesParentID: TIntegerField;
    NodesName: TStringField;
    dsNodes: TDataSource;
    TreeImages: TImageList;
    Menu: TPopupMenu;
    AddCountry: TMenuItem;
    DelSelected: TMenuItem;
    MenuImages: TImageList;
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
    ObjectID: TcxDBTreeListColumn;
    ClassID: TcxDBTreeListColumn;
    NodesObjectID: TIntegerField;
    NodesClassID: TIntegerField;
    AddCity: TMenuItem;
    AddCustomer: TMenuItem;
    AddProvider: TMenuItem;
    AddSucursal: TMenuItem;
    AddBuyer: TMenuItem;
    AddProduct: TMenuItem;
    AddSeller: TMenuItem;
    Editar: TMenuItem;
    Colapsar1: TMenuItem;
    Expandir1: TMenuItem;
    N1: TMenuItem;
    procedure AddCountryClick(Sender: TObject);
    procedure DelSelectedClick(Sender: TObject);
    procedure MenuPopup(Sender: TObject);
    procedure TreeGetNodeImageIndex(Sender: TObject;
      ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
      var AIndex: TImageIndex);
    procedure AddCityClick(Sender: TObject);
    procedure AddCustomerClick(Sender: TObject);
    procedure AddProviderClick(Sender: TObject);
    procedure AddSucursalClick(Sender: TObject);
    procedure AddBuyerClick(Sender: TObject);
    procedure AddProductClick(Sender: TObject);
    procedure AddSellerClick(Sender: TObject);
    procedure TreeEdited(Sender: TObject; AColumn: TcxTreeListColumn);
    procedure TreeEditing(Sender: TObject; AColumn: TcxTreeListColumn;
      var Allow: Boolean);
    procedure NodesBeforeDelete(DataSet: TDataSet);
    procedure EditarClick(Sender: TObject);
    procedure Colapsar1Click(Sender: TObject);
    procedure Expandir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    KeyFieldName    : string;
    ParentFieldName : string;
    TextFieldName   : string;
    ObjectFieldName : string;
    ClassFieldName  : string;
    fEditing        : boolean;

    procedure Load(const ads : TADODataSet); virtual;

    property Editing : boolean read fEditing write fEditing;
  end;

implementation

uses UdgMain, UdgCliente, UdgSucursal, UdgProducto, UdgVendedor;

{$R *.dfm}

  procedure TframeConfig.Load(const ads : TADODataSet);
  begin
    Nodes.Close;
    Nodes.Open;

    ads.Open;
    try
      while not ads.Eof do
        begin
          Nodes.Append;
            NodesID.Value       := ads.FieldValues[KeyFieldName   ];
            NodesParentID.Value := ads.FieldValues[ParentFieldName];
            NodesName.Value     := ads.FieldValues[TextFieldName  ];
            NodesObjectID.Value := ads.FieldValues[ObjectFieldName];
            NodesClassID.Value  := ads.FieldValues[ClassFieldName ];
          Nodes.Post;

          ads.Next;
        end;
    finally
      ads.Close;
    end;

    Nodes.First;

    Tree.OptionsData.Editing := Editing;
  end;

  procedure TframeConfig.TreeGetNodeImageIndex(Sender: TObject;
    ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
    var AIndex: TImageIndex);
  begin
    if ANode.Level = 0
      then AIndex := 0
      else AIndex := ANode.Values[ClassID.ItemIndex];
  end;

  procedure TframeConfig.MenuPopup(Sender: TObject);
  begin
    AddCountry.Visible  := Editing and (Tree.FocusedNode.Level = 0);
    AddCity.Visible     := Editing and (Tree.FocusedNode.Level = 1);
    AddCustomer.Visible := Editing and (Tree.FocusedNode.Level = 2);
    AddProvider.Visible := Editing and (Tree.FocusedNode.Level = 2);
    AddSucursal.Visible := Editing and (Tree.FocusedNode.Level = 2);
    AddBuyer.Visible    := Editing and (Tree.FocusedNode.Level = 3) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 3);
    AddProduct.Visible  := Editing and (Tree.FocusedNode.Level = 3) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 4);
    AddSeller.Visible   := Editing and (Tree.FocusedNode.Level = 3) and (Tree.FocusedNode.Values[ClassID.ItemIndex] = 5);
    DelSelected.Visible := Editing and (Tree.FocusedNode.Level > 0);
    Editar.Visible      := Editing and (Tree.FocusedNode.Level > 0) and (integer(Tree.FocusedNode.Values[ClassID.ItemIndex]) in [3, 5, 7, 8]);
  end;

  procedure TframeConfig.Colapsar1Click(Sender: TObject);
  begin
    Tree.FocusedNode.Collapse(true);
  end;

  procedure TframeConfig.Expandir1Click(Sender: TObject);
  begin
    Tree.FocusedNode.Expand(true);
  end;

  procedure TframeConfig.AddCountryClick(Sender: TObject);
  var
    ObjID    : integer;
    ParentID : integer;
  begin
    Tree.BeginUpdate;
      ObjID    := formMain.LinkD.VirtualDB.InsertNewRecordID('Country');
      ParentID := NodesID.Value;
      Nodes.Append;
        NodesParentID.Value := ParentID;
        NodesName.Value     := 'Nuevo País';
        NodesObjectID.Value := ObjID;
        NodesClassID.Value  := 1;
      Nodes.Post;
    Tree.EndUpdate;
  end;

  procedure TframeConfig.AddCityClick(Sender: TObject);
  var
    ObjID     : integer;
    CountryID : integer;
    ParentID  : integer;
  begin
    Tree.BeginUpdate;
      CountryID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
      ParentID  := NodesID.Value;
      ObjID     := formMain.LinkD.VirtualDB.InsertNewRecordID('City');
      formMain.LinkD.ExecSQL(Format('UPDATE City SET CountryID = %d WHERE ID = %d', [CountryID, ObjID]));
      Nodes.Append;
        NodesParentID.Value := ParentID;
        NodesName.Value     := 'Nueva Ciudad';
        NodesObjectID.Value := ObjID;
        NodesClassID.Value  := 2;
      Nodes.Post;
    Tree.EndUpdate;
  end;

  procedure TframeConfig.AddCustomerClick(Sender: TObject);
  var
    ObjID    : integer;
    CityID   : integer;
    ParentID : integer;
  begin
    Tree.BeginUpdate;
    try
      if formMain.LinkD.VirtualDB.CreateObject(3, ObjID)
        then
          begin
            CityID    := Tree.FocusedNode.Values[ObjectID.ItemIndex];
            ParentID  := NodesID.Value;
            formMain.LinkD.ExecSQL(Format('UPDATE Company SET CityID = %d WHERE ObjectID = %d', [CityID, ObjID]));
            Nodes.Append;
              NodesParentID.Value := ParentID;
              NodesName.Value     := 'Nuevo Cliente';
              NodesObjectID.Value := ObjID;
              NodesClassID.Value  := 3;
            Nodes.Post;
          end;
    finally
      Tree.EndUpdate;
    end;
  end;

  procedure TframeConfig.AddProviderClick(Sender: TObject);
  var
    ObjID    : integer;
    CityID   : integer;
    ParentID : integer;
  begin
    Tree.BeginUpdate;
    try
      if formMain.LinkD.VirtualDB.CreateObject(4, ObjID)
        then
          begin
            CityID    := Tree.FocusedNode.Values[ObjectID.ItemIndex];
            ParentID  := NodesID.Value;
            formMain.LinkD.ExecSQL(Format('UPDATE Company SET CityID = %d WHERE ObjectID = %d', [CityID, ObjID]));
            Nodes.Append;
              NodesParentID.Value := ParentID;
              NodesName.Value     := 'Nuevo Proveedor';
              NodesObjectID.Value := ObjID;
              NodesClassID.Value  := 4;
            Nodes.Post;
          end;
    finally
      Tree.EndUpdate;
    end;
  end;

  procedure TframeConfig.AddSucursalClick(Sender: TObject);
  var
    ObjID    : integer;
    CityID   : integer;
    ParentID : integer;
  begin
    Tree.BeginUpdate;
    try
      if formMain.LinkD.VirtualDB.CreateObject(5, ObjID)
        then
          begin
            CityID    := Tree.FocusedNode.Values[ObjectID.ItemIndex];
            ParentID  := NodesID.Value;
            formMain.LinkD.ExecSQL(Format('UPDATE Company SET CityID = %d WHERE ObjectID = %d', [CityID, ObjID]));
            Nodes.Append;
              NodesParentID.Value := ParentID;
              NodesName.Value     := 'Nueva Sucursal';
              NodesObjectID.Value := ObjID;
              NodesClassID.Value  := 5;
            Nodes.Post;
          end;
    finally
      Tree.EndUpdate;
    end;
  end;

  procedure TframeConfig.AddBuyerClick(Sender: TObject);
  var
    ObjID     : integer;
    CompanyID : integer;
    ParentID  : integer;
  begin
    Tree.BeginUpdate;
    try
      if formMain.LinkD.VirtualDB.CreateObject(6, ObjID)
        then
          begin
            CompanyID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
            ParentID  := NodesID.Value;
            formMain.LinkD.ExecSQL(Format('UPDATE Contacto SET CompanyID = %d WHERE ObjectID = %d', [CompanyID, ObjID]));
            Nodes.Append;
              NodesParentID.Value := ParentID;
              NodesName.Value     := 'Nuevo Comprador';
              NodesObjectID.Value := ObjID;
              NodesClassID.Value  := 6;
            Nodes.Post;
          end;
    finally
      Tree.EndUpdate;
    end;
  end;

  procedure TframeConfig.AddProductClick(Sender: TObject);
  var
    ObjID      : integer;
    ProviderID : integer;
    ParentID   : integer;
  begin
    Tree.BeginUpdate;
    try
      if formMain.LinkD.VirtualDB.CreateObject(7, ObjID)
        then
          begin
            ProviderID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
            ParentID   := NodesID.Value;
            formMain.LinkD.ExecSQL(Format('UPDATE Producto SET ProveedorID = %d WHERE ObjectID = %d', [ProviderID, ObjID]));
            Nodes.Append;
              NodesParentID.Value := ParentID;
              NodesName.Value     := 'Nuevo Producto';
              NodesObjectID.Value := ObjID;
              NodesClassID.Value  := 7;
            Nodes.Post;
          end;
    finally
      Tree.EndUpdate;
    end;
  end;

  procedure TframeConfig.AddSellerClick(Sender: TObject);
  var
    ObjID     : integer;
    CompanyID : integer;
    ParentID  : integer;
  begin
    Tree.BeginUpdate;
    try
      if formMain.LinkD.VirtualDB.CreateObject(8, ObjID)
        then
          begin
            CompanyID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
            ParentID  := NodesID.Value;
            formMain.LinkD.ExecSQL(Format('UPDATE Contacto SET CompanyID = %d WHERE ObjectID = %d', [CompanyID, ObjID]));
            Nodes.Append;
              NodesParentID.Value := ParentID;
              NodesName.Value     := 'Nuevo Vendedor';
              NodesObjectID.Value := ObjID;
              NodesClassID.Value  := 8;
            Nodes.Post;
          end;
    finally
      Tree.EndUpdate;
    end;
  end;

  procedure TframeConfig.NodesBeforeDelete(DataSet: TDataSet);
  var
    ObjID : integer;
  begin
    ObjID := NodesObjectID.Value;
    case NodesClassID.Value of
      1 :
        begin
          formMain.LinkD.ExecSQL(Format('DELETE FROM Country WHERE ID = %d', [ObjID]));
        end;
      2 :
        begin
          formMain.LinkD.ExecSQL(Format('DELETE FROM City WHERE ID = %d', [ObjID]));
        end;
      3..8 :
        begin
          formMain.LinkD.VirtualDB.DeleteObject(ObjID);
        end;
    end;
  end;

  procedure TframeConfig.DelSelectedClick(Sender: TObject);
  begin
    if MessageDlg('¿Está seguro? Se borrará toda la rama...', mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then Tree.FocusedNode.Delete;
  end;

  procedure TframeConfig.TreeEditing(Sender: TObject;
    AColumn: TcxTreeListColumn; var Allow: Boolean);
  begin
    Allow := Tree.FocusedNode.Level > 0;
  end;

  procedure TframeConfig.TreeEdited(Sender: TObject; AColumn: TcxTreeListColumn);
  var
    ObjID : integer;
    Texto : string;
  begin
    ObjID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
    Texto := AColumn.EditValue;
    case Tree.FocusedNode.Values[ClassID.ItemIndex] of
      1 :
        begin
          formMain.LinkD.ExecSQL(Format('UPDATE Country SET Country = ''%s'' WHERE ID = %d', [Texto, ObjID]));
        end;
      2 :
        begin
          formMain.LinkD.ExecSQL(Format('UPDATE City SET City = ''%s'' WHERE ID = %d', [Texto, ObjID]));
        end;
      3..5 :
        begin
          formMain.LinkD.ExecSQL(Format('UPDATE Company SET Nombre = ''%s'' WHERE ObjectID = %d', [Texto, ObjID]));
        end;
      6, 8 :
        begin
          formMain.LinkD.ExecSQL(Format('UPDATE Contacto SET Nombre = ''%s'' WHERE ObjectID = %d', [Texto, ObjID]));
        end;
      7 :
        begin
          formMain.LinkD.ExecSQL(Format('UPDATE Producto SET Nombre = ''%s'' WHERE ObjectID = %d', [Texto, ObjID]));
        end;
    end;
  end;

  procedure TframeConfig.EditarClick(Sender: TObject);
  var
    ObjID : integer;
  begin
    ObjID := Tree.FocusedNode.Values[ObjectID.ItemIndex];
    case Tree.FocusedNode.Values[ClassID.ItemIndex] of
      3 : // Cliente
        begin
          frmClient.Edit(ObjID);
        end;
      5 : // Sucursal
        begin
          frmSucursal.Edit(ObjID);
        end;
      7 : // Producto
        begin
          frmProducto.Edit(ObjID);
        end;
      8 : // Vendedor
        begin
          frmVendedor.Edit(ObjID);
        end;
      else
    end;
  end;

end.
