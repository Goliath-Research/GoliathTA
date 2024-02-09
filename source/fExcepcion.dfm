object frmExcepcion: TfrmExcepcion
  Left = 412
  Top = 183
  Caption = 'Excepci'#243'n'
  ClientHeight = 164
  ClientWidth = 233
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
    Width = 233
    Height = 123
    Align = alClient
    TabOrder = 0
    object lblTurno: TcxLabel
      Left = 8
      Top = 84
      Caption = 'Turno'
    end
    object lblFecha: TcxLabel
      Left = 8
      Top = 16
      Caption = 'Fecha'
    end
    object datFecha: TcxDateEdit
      Left = 73
      Top = 15
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 130
    end
    object boxLaborable: TcxCheckBox
      Left = 8
      Top = 49
      Caption = 'Laborable'
      Properties.Alignment = taRightJustify
      Properties.OnChange = boxLaborablePropertiesChange
      TabOrder = 1
      Width = 83
    end
    object lcbTurno: TcxLookupComboBox
      Left = 73
      Top = 83
      Enabled = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Nombre'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = ClientDataModule.ds_dboJornada
      TabOrder = 2
      Width = 145
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 123
    Width = 233
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TcxButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TcxButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
