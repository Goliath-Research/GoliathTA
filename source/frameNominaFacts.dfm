object frmNominaFacts: TfrmNominaFacts
  Left = 0
  Top = 0
  Width = 805
  Height = 523
  TabOrder = 0
  object g: TcxGrid
    Left = 0
    Top = 0
    Width = 805
    Height = 523
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = -3
    object gDBTV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      DataController.DataSource = ClientDataModule.ds_viewNominaFacts
      DataController.KeyFieldNames = 'RecID'
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Column = gDBTVRecID
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gDBTVNomina
        end
        item
          Format = '#,###,###'
          Kind = skSum
          Column = gDBTVLaborables
        end
        item
          Format = '#,###,###'
          Kind = skSum
          Column = gDBTVAsistidas
        end
        item
          Format = '#,###,###'
          Kind = skSum
          Column = gDBTVExtrasBrutas
        end
        item
          Format = '#,###,###'
          Kind = skSum
          Column = gDBTVPagar
        end
        item
          Format = '#,###,###'
          Kind = skSum
          Column = gDBTVExtras
        end
        item
          Format = '#,###,###'
          Kind = skSum
          Column = gDBTVPrimas
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gDBTVRecID: TcxGridDBColumn
        DataBinding.FieldName = 'RecID'
        Visible = False
      end
      object gDBTVNomina: TcxGridDBColumn
        Caption = 'N'#243'mina'
        DataBinding.FieldName = 'Nomina'
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        Width = 129
      end
      object gDBTVFecha1: TcxGridDBColumn
        DataBinding.FieldName = 'Fecha1'
        HeaderAlignmentHorz = taCenter
        Width = 63
      end
      object gDBTVFecha2: TcxGridDBColumn
        DataBinding.FieldName = 'Fecha2'
        HeaderAlignmentHorz = taCenter
        Width = 61
      end
      object gDBTVSitio: TcxGridDBColumn
        DataBinding.FieldName = 'Sitio'
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object gDBTVDepartamento: TcxGridDBColumn
        DataBinding.FieldName = 'Departamento'
        HeaderAlignmentHorz = taCenter
        Width = 170
      end
      object gDBTVTrabajador: TcxGridDBColumn
        DataBinding.FieldName = 'Trabajador'
        HeaderAlignmentHorz = taCenter
        Width = 243
      end
      object gDBTVLaborables: TcxGridDBColumn
        DataBinding.FieldName = 'Laborables'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
      object gDBTVAsistidas: TcxGridDBColumn
        DataBinding.FieldName = 'Asistidas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object gDBTVExtrasBrutas: TcxGridDBColumn
        DataBinding.FieldName = 'ExtrasBrutas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
      object gDBTVPagar: TcxGridDBColumn
        DataBinding.FieldName = 'Pagar'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
      object gDBTVExtras: TcxGridDBColumn
        DataBinding.FieldName = 'Extras'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 58
      end
      object gDBTVPrimas: TcxGridDBColumn
        DataBinding.FieldName = 'Primas'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 57
      end
    end
    object gL: TcxGridLevel
      GridView = gDBTV
    end
  end
end
