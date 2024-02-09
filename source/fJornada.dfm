object frmJornada: TfrmJornada
  Left = 412
  Top = 183
  Caption = 'Turno'
  ClientHeight = 166
  ClientWidth = 380
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
    Width = 380
    Height = 125
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 222
    object lblNombre: TcxLabel
      Left = 8
      Top = 8
      Caption = 'Nombre'
    end
    object txtNombre: TcxTextEdit
      Left = 73
      Top = 7
      TabOrder = 0
      Width = 130
    end
    object lblFecha1: TcxLabel
      Left = 8
      Top = 43
      Caption = 'Desde'
    end
    object lblHasta: TcxLabel
      Left = 8
      Top = 83
      Caption = 'Hasta'
    end
    object timHora1: TcxTimeEdit
      Left = 73
      Top = 42
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      Properties.Use24HourFormat = False
      TabOrder = 1
      Width = 88
    end
    object timHora2: TcxTimeEdit
      Left = 73
      Top = 82
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      Properties.Use24HourFormat = False
      TabOrder = 2
      Width = 88
    end
    object boxDescanso: TcxCheckBox
      Left = 240
      Top = 7
      Caption = 'Descanso'
      Properties.OnChange = boxDescansoPropertiesChange
      TabOrder = 3
      Width = 121
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 125
    Width = 380
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 222
    object btnAceptar: TcxButton
      Left = 96
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TcxButton
      Left = 208
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cxLabel1: TcxLabel
    Left = 208
    Top = 43
    Caption = 'Desde'
  end
  object timDesc1: TcxTimeEdit
    Left = 273
    Top = 42
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.TimeFormat = tfHourMin
    Properties.Use24HourFormat = False
    TabOrder = 4
    Width = 88
  end
  object cxLabel2: TcxLabel
    Left = 208
    Top = 83
    Caption = 'Hasta'
  end
  object timDesc2: TcxTimeEdit
    Left = 273
    Top = 82
    EditValue = 0.000000000000000000
    Properties.ReadOnly = True
    Properties.TimeFormat = tfHourMin
    Properties.Use24HourFormat = False
    TabOrder = 5
    Width = 88
  end
end
