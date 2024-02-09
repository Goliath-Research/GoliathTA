object frmHorario: TfrmHorario
  Left = 412
  Top = 183
  Caption = 'Horario'
  ClientHeight = 377
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 336
    Align = alClient
    TabOrder = 0
    object pnlHorario: TPanel
      Left = 1
      Top = 1
      Width = 433
      Height = 40
      Align = alTop
      TabOrder = 0
      object lblNombre: TcxLabel
        Left = 8
        Top = 8
        Caption = 'Nombre'
      end
      object txtNombre: TcxTextEdit
        Left = 73
        Top = 7
        TabOrder = 1
        Width = 168
      end
    end
    object g: TcxGrid
      Left = 1
      Top = 41
      Width = 433
      Height = 294
      Align = alClient
      TabOrder = 1
      object gDBTV: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Filter.Visible = False
        DataController.DataSource = ClientDataModule.ds_dboPeriodoJornada
        DataController.KeyFieldNames = 'PeriodoID; Dia'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.Navigator = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object gDBTVRecID: TcxGridDBColumn
          DataBinding.FieldName = 'RecID'
          Visible = False
        end
        object gDBTVPeriodoID: TcxGridDBColumn
          DataBinding.FieldName = 'PeriodoID'
          Visible = False
        end
        object gDBTVDia: TcxGridDBColumn
          Caption = 'D'#237'a'
          DataBinding.FieldName = 'Dia'
          HeaderAlignmentHorz = taCenter
          Width = 36
        end
        object gDBTVNombre: TcxGridDBColumn
          DataBinding.FieldName = 'Nombre'
          HeaderAlignmentHorz = taCenter
          Width = 155
        end
        object gDBTVJornadaID: TcxGridDBColumn
          DataBinding.FieldName = 'JornadaID'
          Visible = False
        end
        object gDBTVTurno: TcxGridDBColumn
          Caption = 'Turno'
          DataBinding.FieldName = 'JornadaID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = ClientDataModule.ds_dboJornada
          HeaderAlignmentHorz = taCenter
          Width = 165
        end
        object gDBTVLaborable: TcxGridDBColumn
          DataBinding.FieldName = 'Laborable'
          HeaderAlignmentHorz = taCenter
          Width = 58
        end
      end
      object gL: TcxGridLevel
        GridView = gDBTV
      end
    end
  end
  object pnlButtons: TGridPanel
    Left = 0
    Top = 336
    Width = 435
    Height = 41
    Align = alBottom
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = btnAceptar
        Row = 0
      end
      item
        Column = 1
        Control = btnCancelar
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 1
    DesignSize = (
      435
      41)
    object btnAceptar: TcxButton
      Left = 71
      Top = 8
      Width = 75
      Height = 25
      Anchors = []
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Anchors = []
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
