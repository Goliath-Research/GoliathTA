object frmDptoByPayroll: TfrmDptoByPayroll
  Left = 0
  Top = 0
  Width = 900
  Height = 497
  TabOrder = 0
  object g: TcxGrid
    Left = 0
    Top = 0
    Width = 900
    Height = 497
    Align = alClient
    TabOrder = 0
    object gDBBTV: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      DataController.DataSource = ClientDataModule.ds_CalculosTrabajadorNoAprobados
      DataController.KeyFieldNames = 'NominaID; TrabajadorID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gDBBTVRecID
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Bands = <
        item
          Caption = 'General'
          Width = 274
        end
        item
          Caption = 'Propuesta'
          Width = 170
        end
        item
          Caption = 'Aprobaci'#243'n'
          Width = 462
        end>
      object gDBBTVRecID: TcxGridDBBandedColumn
        Caption = 'ID'
        DataBinding.FieldName = 'RecID'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gDBBTVDepartamentoID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DepartamentoID'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gDBBTVNominaID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NominaID'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gDBBTVTrabajadorID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'TrabajadorID'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gDBBTVNombre: TcxGridDBBandedColumn
        Caption = 'Trabajador'
        DataBinding.FieldName = 'TrabajadorID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Nombre'
          end>
        Properties.ListSource = ClientDataModule.ds_Trabajador
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 223
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gDBBTVHp: TcxGridDBBandedColumn
        Caption = 'Pagar'
        DataBinding.FieldName = 'Hp'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gDBBTVHe: TcxGridDBBandedColumn
        Caption = 'Extras'
        DataBinding.FieldName = 'He'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gDBBTVPrima: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Prima'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gDBBTVHpA: TcxGridDBBandedColumn
        Caption = 'Pagar'
        DataBinding.FieldName = 'HpA'
        PropertiesClassName = 'TcxCalcEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 63
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gDBBTVHeA: TcxGridDBBandedColumn
        Caption = 'Extras'
        DataBinding.FieldName = 'HeA'
        PropertiesClassName = 'TcxCalcEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 62
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gDBBTVPrimaA: TcxGridDBBandedColumn
        Caption = 'Prima'
        DataBinding.FieldName = 'PrimaA'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 62
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gDBBTVAprobar: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Aprobar'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Width = 45
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gDBBTVNota: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Nota'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentHorz = taCenter
        Width = 230
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
    object gL: TcxGridLevel
      GridView = gDBBTV
    end
  end
end
