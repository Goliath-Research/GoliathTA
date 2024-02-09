object frmDptoByDay: TfrmDptoByDay
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
      DataController.DataSource = ClientDataModule.ds_CalculosDiariosNoAprobados
      DataController.KeyFieldNames = 'NominaID; TrabajadorID; Dia'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = gDBBTVDia
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
          Width = 248
        end
        item
          Caption = 'Plan'
          Width = 151
        end
        item
          Caption = 'Real'
          Width = 156
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
        DataBinding.FieldName = 'RecID'
        Visible = False
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
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object gDBBTVDia: TcxGridDBBandedColumn
        Caption = 'D'#237'a'
        DataBinding.FieldName = 'Dia'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 39
        Position.BandIndex = 0
        Position.ColIndex = 3
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
        Width = 230
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object gDBBTVEp: TcxGridDBBandedColumn
        Caption = 'Entrada'
        DataBinding.FieldName = 'Ep'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gDBBTVSp: TcxGridDBBandedColumn
        Caption = 'Salida'
        DataBinding.FieldName = 'Sp'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gDBBTVEr: TcxGridDBBandedColumn
        Caption = 'Entrada'
        DataBinding.FieldName = 'Er'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gDBBTVSr: TcxGridDBBandedColumn
        Caption = 'Salida'
        DataBinding.FieldName = 'Sr'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gDBBTVHl: TcxGridDBBandedColumn
        Caption = 'Horas'
        DataBinding.FieldName = 'Hl'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gDBBTVHa: TcxGridDBBandedColumn
        Caption = 'Horas'
        DataBinding.FieldName = 'Ha'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gDBBTVHp: TcxGridDBBandedColumn
        Caption = 'Pagar'
        DataBinding.FieldName = 'Hp'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!90:00;1;_'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 3
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
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object gDBBTVPrima: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Prima'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gDBBTVHpA: TcxGridDBBandedColumn
        Caption = 'Pagar'
        DataBinding.FieldName = 'HpA'
        PropertiesClassName = 'TcxCalcEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 63
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object gDBBTVHeA: TcxGridDBBandedColumn
        Caption = 'Extras'
        DataBinding.FieldName = 'HeA'
        PropertiesClassName = 'TcxCalcEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 62
        Position.BandIndex = 4
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
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object gDBBTVAprobar: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Aprobar'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Width = 45
        Position.BandIndex = 4
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object gDBBTVNota: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Nota'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentHorz = taCenter
        Width = 230
        Position.BandIndex = 4
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
    object gL: TcxGridLevel
      GridView = gDBBTV
    end
  end
end
