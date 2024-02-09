object frmCards: TfrmCards
  Left = 0
  Top = 0
  Width = 652
  Height = 408
  TabOrder = 0
  object gCard: TcxGrid
    Left = 0
    Top = 0
    Width = 652
    Height = 408
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object gCardDBTV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Cancel.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Column = gCardDBTVCARDID
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'MANID'
          Column = gCardDBTVCARDID
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object gCardDBTVRecID: TcxGridDBColumn
        DataBinding.FieldName = 'RecID'
        Visible = False
      end
      object gCardDBTVCARDID: TcxGridDBColumn
        DataBinding.FieldName = 'CARDID'
        HeaderAlignmentHorz = taCenter
      end
      object gCardDBTVCARDNUMBER: TcxGridDBColumn
        DataBinding.FieldName = 'CARDNUMBER'
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object gCardDBTVCREATIONTIME: TcxGridDBColumn
        DataBinding.FieldName = 'CREATIONTIME'
        HeaderAlignmentHorz = taCenter
        Width = 132
      end
      object gCardDBTVDESTRUCTIONTIME: TcxGridDBColumn
        DataBinding.FieldName = 'DESTRUCTIONTIME'
        HeaderAlignmentHorz = taCenter
        Width = 129
      end
      object gCardDBTVSTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'STATUS'
        HeaderAlignmentHorz = taCenter
        Width = 116
      end
    end
    object gCardL: TcxGridLevel
      GridView = gCardDBTV
    end
  end
end
