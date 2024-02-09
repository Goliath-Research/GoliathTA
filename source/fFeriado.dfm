object frmFeriado: TfrmFeriado
  Left = 412
  Top = 183
  Caption = 'Feriado'
  ClientHeight = 128
  ClientWidth = 222
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
    Width = 222
    Height = 87
    Align = alClient
    TabOrder = 0
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
    object lblFecha: TcxLabel
      Left = 8
      Top = 43
      Caption = 'Fecha'
    end
    object datFecha: TcxDateEdit
      Left = 73
      Top = 42
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 130
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 87
    Width = 222
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
