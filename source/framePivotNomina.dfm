object frmPivotNomina: TfrmPivotNomina
  Left = 0
  Top = 0
  Width = 721
  Height = 583
  TabOrder = 0
  object p: TcxDBPivotGrid
    Left = 0
    Top = 0
    Width = 721
    Height = 583
    Align = alClient
    DataSource = ClientDataModule.ds_viewNominaFacts
    Groups = <>
    TabOrder = 0
    ExplicitLeft = 208
    ExplicitTop = 152
    ExplicitWidth = 300
    ExplicitHeight = 250
    object pRecID: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      DataBinding.FieldName = 'RecID'
      SummaryType = stCount
      Visible = True
    end
    object pNomina: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      DataBinding.FieldName = 'Nomina'
      Visible = True
    end
    object pFecha1: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.FieldName = 'Fecha1'
      Visible = True
    end
    object pSitio: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      DataBinding.FieldName = 'Sitio'
      Visible = True
    end
    object pDepartamento: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      DataBinding.FieldName = 'Departamento'
      Visible = True
    end
    object pTrabajador: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 2
      DataBinding.FieldName = 'Trabajador'
      Visible = True
    end
    object pLaborables: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      DataBinding.FieldName = 'Laborables'
      Visible = True
    end
    object pAsistidas: TcxDBPivotGridField
      Area = faData
      AreaIndex = 2
      DataBinding.FieldName = 'Asistidas'
      Visible = True
    end
    object pExtrasBrutas: TcxDBPivotGridField
      Area = faData
      AreaIndex = 3
      DataBinding.FieldName = 'ExtrasBrutas'
      Visible = True
    end
    object pPagar: TcxDBPivotGridField
      Area = faData
      AreaIndex = 4
      DataBinding.FieldName = 'Pagar'
      Visible = True
    end
    object pExtras: TcxDBPivotGridField
      Area = faData
      AreaIndex = 5
      DataBinding.FieldName = 'Extras'
      Visible = True
    end
    object pPrimas: TcxDBPivotGridField
      Area = faData
      AreaIndex = 6
      DataBinding.FieldName = 'Primas'
      Visible = True
    end
  end
end
