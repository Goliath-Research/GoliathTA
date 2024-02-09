object frmResultadosPendientes: TfrmResultadosPendientes
  Left = 0
  Top = 0
  Width = 480
  Height = 400
  TabOrder = 0
  object g: TcxGrid
    Left = 0
    Top = 0
    Width = 480
    Height = 400
    Align = alClient
    TabOrder = 0
    object gDBTV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      DataController.DataSource = ClientDataModule.ds_viewResultadosPendientes
      DataController.KeyFieldNames = 'NominaID; DepartamentoID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gDBTVRecID: TcxGridDBColumn
        DataBinding.FieldName = 'RecID'
        Visible = False
      end
      object gDBTVNominaID: TcxGridDBColumn
        DataBinding.FieldName = 'NominaID'
        Visible = False
      end
      object gDBTVDepartamentoID: TcxGridDBColumn
        Caption = 'Departamento'
        DataBinding.FieldName = 'DepartamentoID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Nombre'
          end>
        Properties.ListSource = ClientDataModule.ds_dboDepartamento
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 212
      end
      object gDBTVPendientes: TcxGridDBColumn
        DataBinding.FieldName = 'Pendientes'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
    end
    object gL: TcxGridLevel
      GridView = gDBTV
    end
  end
end
