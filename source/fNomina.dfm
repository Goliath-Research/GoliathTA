object frmNomina: TfrmNomina
  Left = 412
  Top = 183
  Caption = 'N'#243'mina'
  ClientHeight = 191
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
    Height = 150
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
    object lblFecha1: TcxLabel
      Left = 8
      Top = 43
      Caption = 'Desde'
    end
    object datFecha1: TcxDateEdit
      Left = 73
      Top = 42
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 130
    end
    object txtEstado: TcxTextEdit
      Left = 73
      Top = 114
      Properties.ReadOnly = True
      TabOrder = 3
      Width = 130
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 150
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
  object cxLabel1: TcxLabel
    Left = 8
    Top = 83
    Caption = 'Hasta'
  end
  object datFecha2: TcxDateEdit
    Left = 73
    Top = 82
    Properties.ReadOnly = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
    Width = 130
  end
  object lblEstado: TcxLabel
    Left = 8
    Top = 115
    Caption = 'Estado'
  end
end
