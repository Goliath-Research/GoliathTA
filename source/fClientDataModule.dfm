object ClientDataModule: TClientDataModule
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 833
  Width = 743
  object Message: TROBinMessage
    Envelopes = <>
    Left = 40
    Top = 52
  end
  object RemoteService: TRORemoteService
    Message = Message
    Channel = Channel
    ServiceName = 'GoliathTAService'
    Left = 40
    Top = 96
  end
  object DataStreamer: TDABin2DataStreamer
    Left = 40
    Top = 140
  end
  object RemoteDataAdapter: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    UpdateDataCall.RemoteService = RemoteService
    GetScriptsCall.RemoteService = RemoteService
    RemoteService = RemoteService
    DataStreamer = DataStreamer
    Left = 40
    Top = 184
  end
  object tbl_dboAcceso: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
        Required = True
      end
      item
        Name = 'UserID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'UserName'
        DataType = datString
        Size = 255
        Required = True
      end
      item
        Name = 'DeviceID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'DeviceName'
        DataType = datString
        Size = 255
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Acceso'
    IndexDefs = <>
    Left = 216
    Top = 16
  end
  object ds_dboAcceso: TDADataSource
    DataSet = tbl_dboAcceso.Dataset
    DataTable = tbl_dboAcceso
    Left = 296
    Top = 16
  end
  object tbl_dboAsignacion: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'NominaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'TrabajadorID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'PeriodoID'
        DataType = datInteger
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Asignacion'
    IndexDefs = <>
    Left = 216
    Top = 64
  end
  object ds_dboAsignacion: TDADataSource
    DataSet = tbl_dboAsignacion.Dataset
    DataTable = tbl_dboAsignacion
    Left = 296
    Top = 64
  end
  object tbl_dboClasses: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datAutoInc
        GeneratorName = 'dbo.Classes'
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Name'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Classes'
    IndexDefs = <>
    Left = 208
    Top = 400
  end
  object ds_dboClasses: TDADataSource
    DataSet = tbl_dboClasses.Dataset
    DataTable = tbl_dboClasses
    Left = 296
    Top = 400
  end
  object tbl_dboDepartamento: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'JefeID'
        DataType = datInteger
      end
      item
        Name = 'SitioID'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Departamento'
    IndexDefs = <>
    Left = 216
    Top = 120
  end
  object ds_dboDepartamento: TDADataSource
    DataSet = tbl_dboDepartamento.Dataset
    DataTable = tbl_dboDepartamento
    Left = 296
    Top = 120
  end
  object tbl_dboDia: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datWord
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Semana'
        DataType = datWord
      end
      item
        Name = 'Dia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Laborable'
        DataType = datBoolean
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Dia'
    IndexDefs = <>
    Left = 216
    Top = 176
  end
  object ds_dboDia: TDADataSource
    DataSet = tbl_dboDia.Dataset
    DataTable = tbl_dboDia
    Left = 296
    Top = 176
  end
  object tbl_dboExcepcion: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'TrabajadorID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'JornadaID'
        DataType = datInteger
      end
      item
        Name = 'Laborable'
        DataType = datBoolean
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Excepcion'
    IndexDefs = <>
    Left = 216
    Top = 232
  end
  object ds_dboExcepcion: TDADataSource
    DataSet = tbl_dboExcepcion.Dataset
    DataTable = tbl_dboExcepcion
    Left = 296
    Top = 240
  end
  object tbl_dboFichadas: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'NominaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'TrabajadorID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Dia'
        DataType = datWord
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Ep'
        DataType = datSmallInt
      end
      item
        Name = 'Sp'
        DataType = datSmallInt
      end
      item
        Name = 'Er'
        DataType = datSmallInt
      end
      item
        Name = 'Sr'
        DataType = datSmallInt
      end
      item
        Name = 'Hl'
        DataType = datSmallInt
      end
      item
        Name = 'Ha'
        DataType = datSmallInt
      end
      item
        Name = 'Hp'
        DataType = datSmallInt
      end
      item
        Name = 'He'
        DataType = datSmallInt
      end
      item
        Name = 'Prima'
        DataType = datSmallInt
      end
      item
        Name = 'HpA'
        DataType = datSmallInt
      end
      item
        Name = 'HeA'
        DataType = datSmallInt
      end
      item
        Name = 'PrimaA'
        DataType = datSmallInt
      end
      item
        Name = 'Aprobar'
        DataType = datBoolean
      end
      item
        Name = 'Approved'
        DataType = datDateTime
      end
      item
        Name = 'Nota'
        DataType = datString
        Size = 255
      end>
    Params = <
      item
        Name = 'OperadorID'
        DataType = datInteger
        Value = '8'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Fichadas'
    IndexDefs = <>
    Left = 208
    Top = 288
  end
  object ds_dboFichadas: TDADataSource
    DataSet = tbl_dboFichadas.Dataset
    DataTable = tbl_dboFichadas
    Left = 296
    Top = 288
  end
  object tbl_dboJornada: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datAutoInc
        GeneratorName = 'dbo.Jornada'
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Hora1'
        DataType = datSmallInt
      end
      item
        Name = 'Hora2'
        DataType = datSmallInt
      end
      item
        Name = 'Preferida'
        DataType = datBoolean
      end
      item
        Name = 'Descanso'
        DataType = datSmallInt
      end
      item
        Name = 'Desc1'
        DataType = datSmallInt
      end
      item
        Name = 'Desc2'
        DataType = datSmallInt
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Jornada'
    IndexDefs = <>
    Left = 208
    Top = 344
  end
  object ds_dboJornada: TDADataSource
    DataSet = tbl_dboJornada.Dataset
    DataTable = tbl_dboJornada
    Left = 296
    Top = 344
  end
  object tbl_dboJornadaTipo: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datAutoInc
        GeneratorName = 'dbo.JornadaTipo'
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo JornadaTipo'
    IndexDefs = <>
    Left = 488
    Top = 16
  end
  object ds_dboJornadaTipo: TDADataSource
    DataSet = tbl_dboJornadaTipo.Dataset
    DataTable = tbl_dboJornadaTipo
    Left = 592
    Top = 16
  end
  object tbl_dboLectora: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'SitioID'
        DataType = datInteger
      end
      item
        Name = 'DeviceID'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Lectora'
    IndexDefs = <>
    Left = 488
    Top = 64
  end
  object ds_dboLectora: TDADataSource
    DataSet = tbl_dboLectora.Dataset
    DataTable = tbl_dboLectora
    Left = 592
    Top = 64
  end
  object tbl_dboNomina: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datAutoInc
        GeneratorName = 'dbo.Nomina'
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Fecha1'
        DataType = datDateTime
      end
      item
        Name = 'Fecha2'
        DataType = datDateTime
      end
      item
        Name = 'Estado'
        DataType = datWord
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Nomina'
    IndexDefs = <>
    Left = 488
    Top = 112
  end
  object ds_dboNomina: TDADataSource
    DataSet = tbl_dboNomina.Dataset
    DataTable = tbl_dboNomina
    Left = 592
    Top = 112
  end
  object tbl_dboNominas: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'NominaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'TrabajadorID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Ep'
        DataType = datSmallInt
      end
      item
        Name = 'Sp'
        DataType = datSmallInt
      end
      item
        Name = 'Er'
        DataType = datSmallInt
      end
      item
        Name = 'Sr'
        DataType = datSmallInt
      end
      item
        Name = 'Hn'
        DataType = datSmallInt
      end
      item
        Name = 'Hr'
        DataType = datSmallInt
      end
      item
        Name = 'Hd'
        DataType = datSmallInt
      end
      item
        Name = 'He'
        DataType = datSmallInt
      end
      item
        Name = 'Prima'
        DataType = datSmallInt
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Nominas'
    IndexDefs = <>
    Left = 488
    Top = 152
  end
  object ds_dboNominas: TDADataSource
    DataSet = tbl_dboNominas.Dataset
    DataTable = tbl_dboNominas
    Left = 592
    Top = 152
  end
  object tbl_dboObjects: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datAutoInc
        GeneratorName = 'dbo.Objects'
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'ClassID'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Objects'
    IndexDefs = <>
    Left = 488
    Top = 200
  end
  object ds_dboObjects: TDADataSource
    DataSet = tbl_dboObjects.Dataset
    DataTable = tbl_dboObjects
    Left = 592
    Top = 200
  end
  object tbl_dboPeriodo: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Periodo'
    IndexDefs = <>
    Left = 488
    Top = 248
  end
  object ds_dboPeriodo: TDADataSource
    DataSet = tbl_dboPeriodo.Dataset
    DataTable = tbl_dboPeriodo
    Left = 592
    Top = 248
  end
  object tbl_dboPeriodoJornada: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'PeriodoID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Dia'
        DataType = datWord
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'JornadaID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Laborable'
        DataType = datBoolean
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo PeriodoJornada'
    IndexDefs = <>
    Left = 488
    Top = 296
  end
  object ds_dboPeriodoJornada: TDADataSource
    DataSet = tbl_dboPeriodoJornada.Dataset
    DataTable = tbl_dboPeriodoJornada
    Left = 592
    Top = 296
  end
  object tbl_dboSitio: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Sitio'
    IndexDefs = <>
    Left = 488
    Top = 344
  end
  object ds_dboSitio: TDADataSource
    DataSet = tbl_dboSitio.Dataset
    DataTable = tbl_dboSitio
    Left = 592
    Top = 344
  end
  object tbl_Trabajador: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'DepartamentoID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 128
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 13
      end
      item
        Name = 'BioAdminID'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'Trabajador'
    IndexDefs = <>
    Left = 488
    Top = 392
  end
  object ds_Trabajador: TDADataSource
    DataSet = tbl_Trabajador.Dataset
    DataTable = tbl_Trabajador
    Left = 592
    Top = 392
  end
  object tbl_Operador: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datAutoInc
        GeneratorName = 'dbo.Operador'
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Operator'
        DataType = datString
        Size = 32
      end
      item
        Name = 'Password'
        DataType = datString
        Size = 32
      end
      item
        Name = 'Autoridad'
        DataType = datWord
      end
      item
        Name = 'TrabajadorID'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    ScriptCode.Strings = (
      '')
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'Operador'
    IndexDefs = <>
    Left = 208
    Top = 456
  end
  object ds_Operador: TDADataSource
    DataSet = tbl_Operador.Dataset
    DataTable = tbl_Operador
    Left = 296
    Top = 456
  end
  object tbl_ConfigTree: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datAutoInc
        InPrimaryKey = True
      end
      item
        Name = 'Caption'
        DataType = datString
        Size = 64
      end
      item
        Name = 'ParentID'
        DataType = datInteger
      end
      item
        Name = 'ObjectID'
        DataType = datInteger
      end
      item
        Name = 'ClassID'
        DataType = datInteger
      end
      item
        Name = 'StatusID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'OperadorID'
        DataType = datInteger
        Value = '1'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo spBuildConfigurationTree'
    IndexDefs = <>
    Left = 488
    Top = 448
  end
  object ds_ConfigTree: TDADataSource
    DataSet = tbl_ConfigTree.Dataset
    DataTable = tbl_ConfigTree
    Left = 592
    Top = 448
  end
  object Channel: TROSynapseSuperTcpChannel
    Encryption.UseCompression = True
    Host = 'localhost'
    RequestTimeout = 100000
    AutoReconnect = True
    StoreActive = False
    ServerLocators = <>
    DispatchOptions = []
    Left = 40
    Top = 8
  end
  object tbl_NewDevices: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'DeviceID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'DeviceName'
        DataType = datString
        Size = 255
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo viewDevicesDesconocidos'
    IndexDefs = <>
    Left = 488
    Top = 512
  end
  object ds_NewDevices: TDADataSource
    DataSet = tbl_NewDevices.Dataset
    DataTable = tbl_NewDevices
    Left = 592
    Top = 512
  end
  object tbl_NewUsers: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'UserID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'UserName'
        DataType = datString
        Size = 255
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo viewUsersDesconocidos'
    IndexDefs = <>
    Left = 488
    Top = 560
  end
  object ds_NewUsers: TDADataSource
    DataSet = tbl_NewUsers.Dataset
    DataTable = tbl_NewUsers
    Left = 592
    Top = 560
  end
  object tbl_dboFeriados: TDAMemDataTable
    RemoteUpdatesOptions = [ruoOnPost]
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
        Required = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'dbo Feriados'
    IndexDefs = <>
    Left = 488
    Top = 672
  end
  object ds_dboFeriados: TDADataSource
    DataSet = tbl_dboFeriados.Dataset
    DataTable = tbl_dboFeriados
    Left = 592
    Top = 672
  end
  object spCmd: TDARemoteCommand
    RemoteService = RemoteService
    ExecuteCall = spCmd.RemoteCommandRequest
    Left = 120
    Top = 536
  end
  object tbl_viewJefesDeDeptoSinOperador: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 128
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'viewJefesDeDeptoSinOperador'
    IndexDefs = <>
    Left = 208
    Top = 512
  end
  object ds_viewJefesDeDeptoSinOperador: TDADataSource
    DataSet = tbl_viewJefesDeDeptoSinOperador.Dataset
    DataTable = tbl_viewJefesDeDeptoSinOperador
    Left = 296
    Top = 512
  end
  object tbl_CalculosDiariosNoAprobados: TDAMemDataTable
    ScriptingProvider = sp_FichadasNoAprobadas
    RemoteUpdatesOptions = [ruoOnPost]
    Fields = <
      item
        Name = 'NominaID'
        DataType = datInteger
        InPrimaryKey = True
      end
      item
        Name = 'TrabajadorID'
        DataType = datInteger
        InPrimaryKey = True
      end
      item
        Name = 'Dia'
        DataType = datWord
        InPrimaryKey = True
      end
      item
        Name = 'Ep'
        DataType = datSmallInt
      end
      item
        Name = 'Sp'
        DataType = datSmallInt
      end
      item
        Name = 'Er'
        DataType = datSmallInt
      end
      item
        Name = 'Sr'
        DataType = datSmallInt
      end
      item
        Name = 'Hl'
        DataType = datSmallInt
      end
      item
        Name = 'Ha'
        DataType = datSmallInt
      end
      item
        Name = 'Hp'
        DataType = datSmallInt
      end
      item
        Name = 'He'
        DataType = datSmallInt
      end
      item
        Name = 'Prima'
        DataType = datSmallInt
      end
      item
        Name = 'HpA'
        DataType = datSmallInt
      end
      item
        Name = 'HeA'
        DataType = datSmallInt
      end
      item
        Name = 'PrimaA'
        DataType = datSmallInt
      end
      item
        Name = 'Aprobar'
        DataType = datBoolean
      end
      item
        Name = 'Approved'
        DataType = datDateTime
      end
      item
        Name = 'Nota'
        DataType = datString
        Size = 255
      end>
    Params = <
      item
        Name = 'OperadorID'
        DataType = datInteger
        Value = '8'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    ScriptCode.Strings = (
      'procedure BeforePost;'
      'begin'
      '  if VarIsNull(HdA)'
      
        '    then RaiseError('#39'Debe entrar las Horas a Descontar (o cero)'#39 +
        ');'
      ''
      '  if VarIsNull(HeA)'
      '    then RaiseError('#39'Debe entrar las Horas Extras (o cero)'#39');'
      ''
      '  if VarIsNull(PrimaA)'
      '    then RaiseError('#39'Debe entrar las Primas (o cero)'#39');'
      ''
      '  if (Hd <> HdA) or (He <> HeA) or (Prima <> PrimaA)'
      
        '    then RaiseError('#39'Debe justificar en la Nota las diferencias'#39 +
        ');'
      ''
      '  if VarIsNull(Approved)'
      
        '    then RaiseError('#39'Por favor, confirme la aprobaci'#243'n entrando ' +
        'la fecha'#39');'
      'end;'
      ''
      '')
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'CalculosDiariosNoAprobados'
    IndexDefs = <>
    Left = 208
    Top = 576
  end
  object ds_CalculosDiariosNoAprobados: TDADataSource
    DataSet = tbl_CalculosDiariosNoAprobados.Dataset
    DataTable = tbl_CalculosDiariosNoAprobados
    Left = 296
    Top = 576
  end
  object sp_FichadasNoAprobadas: TDAPSScriptingProvider
    ScriptableComponent = tbl_CalculosDiariosNoAprobados
    ScriptEngine.Script.Strings = (
      'procedure BeforePost;'
      'begin'
      '  if VarIsNull(HdA)'
      
        '    then RaiseError('#39'Debe entrar las Horas a Descontar (o cero)'#39 +
        ');'
      ''
      '  if VarIsNull(HeA)'
      '    then RaiseError('#39'Debe entrar las Horas Extras (o cero)'#39');'
      ''
      '  if VarIsNull(PrimaA)'
      '    then RaiseError('#39'Debe entrar las Primas (o cero)'#39');'
      ''
      '  if (Hd <> HdA) or (He <> HeA) or (Prima <> PrimaA)'
      
        '    then RaiseError('#39'Debe justificar en la Nota las diferencias'#39 +
        ');'
      ''
      '  if VarIsNull(Approved)'
      
        '    then RaiseError('#39'Por favor, confirme la aprobaci'#243'n entrando ' +
        'la fecha'#39');'
      'end;'
      ''
      '')
    ScriptEngine.CompilerOptions = [icAllowNoBegin, icAllowNoEnd, icBooleanShortCircuit]
    ScriptEngine.Plugins = <
      item
        Plugin = PluginClasses
      end
      item
        Plugin = PluginDB
      end
      item
        Plugin = PluginDateUtils
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    ScriptEngine.UsePreProcessor = False
    ScriptEngine.Defines.Strings = (
      'DATA_ABSTRACT_SCRIPT'
      'DATA_ABSTRACT_SCRIPT_CLIENT')
    Left = 80
    Top = 576
  end
  object PluginClasses: TPSImport_Classes
    EnableStreams = True
    EnableClasses = True
    Left = 80
    Top = 640
  end
  object PluginDB: TPSImport_DB
    Left = 168
    Top = 640
  end
  object PluginDateUtils: TPSImport_DateUtils
    Left = 256
    Top = 640
  end
  object tbl_Municipio: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'Municipio'
    IndexDefs = <>
    Left = 488
    Top = 616
  end
  object ds_Municipio: TDADataSource
    DataSet = tbl_Municipio.Dataset
    DataTable = tbl_Municipio
    Left = 592
    Top = 616
  end
  object tbl_CalculosSemanalesNoAprobados: TDAMemDataTable
    RemoteUpdatesOptions = [ruoOnPost]
    Fields = <
      item
        Name = 'NominaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Semana'
        DataType = datWord
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'TrabajadorID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Hp'
        DataType = datSmallInt
      end
      item
        Name = 'He'
        DataType = datSmallInt
      end
      item
        Name = 'Prima'
        DataType = datSmallInt
      end
      item
        Name = 'HpA'
        DataType = datSmallInt
      end
      item
        Name = 'HeA'
        DataType = datSmallInt
      end
      item
        Name = 'PrimaA'
        DataType = datSmallInt
      end
      item
        Name = 'Aprobar'
        DataType = datBoolean
      end
      item
        Name = 'Nota'
        DataType = datString
        Size = 254
      end
      item
        Name = 'Approved'
        DataType = datDateTime
      end>
    Params = <
      item
        Name = 'OperadorID'
        DataType = datInteger
        Value = '8'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'CalculosSemanalesNoAprobados'
    IndexDefs = <>
    Left = 208
    Top = 696
  end
  object ds_CalculosSemanalesNoAprobados: TDADataSource
    DataSet = tbl_CalculosSemanalesNoAprobados.Dataset
    DataTable = tbl_CalculosSemanalesNoAprobados
    Left = 296
    Top = 696
  end
  object tbl_CalculosTrabajadorNoAprobados: TDAMemDataTable
    RemoteUpdatesOptions = [ruoOnPost]
    Fields = <
      item
        Name = 'NominaID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'TrabajadorID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Hp'
        DataType = datSmallInt
      end
      item
        Name = 'He'
        DataType = datSmallInt
      end
      item
        Name = 'Prima'
        DataType = datSmallInt
      end
      item
        Name = 'HpA'
        DataType = datSmallInt
      end
      item
        Name = 'HeA'
        DataType = datSmallInt
      end
      item
        Name = 'PrimaA'
        DataType = datSmallInt
      end
      item
        Name = 'Aprobar'
        DataType = datBoolean
      end
      item
        Name = 'Nota'
        DataType = datString
        Size = 254
      end
      item
        Name = 'Approved'
        DataType = datDateTime
      end>
    Params = <
      item
        Name = 'OperadorID'
        DataType = datInteger
        Value = '8'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'CalculosTrabajadorNoAprobados'
    IndexDefs = <>
    Left = 208
    Top = 744
  end
  object ds_CalculosTrabajadorNoAprobados: TDADataSource
    DataSet = tbl_CalculosTrabajadorNoAprobados.Dataset
    DataTable = tbl_CalculosTrabajadorNoAprobados
    Left = 296
    Top = 744
  end
  object tbl_viewResultadosPendientes: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'NominaID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'DepartamentoID'
        DataType = datInteger
      end
      item
        Name = 'Pendientes'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'viewResultadosPendientes'
    IndexDefs = <>
    Left = 488
    Top = 720
  end
  object ds_viewResultadosPendientes: TDADataSource
    DataSet = tbl_viewResultadosPendientes.Dataset
    DataTable = tbl_viewResultadosPendientes
    Left = 592
    Top = 720
  end
  object tbl_viewNominaFacts: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'Nomina'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Fecha1'
        DataType = datDateTime
      end
      item
        Name = 'Fecha2'
        DataType = datDateTime
      end
      item
        Name = 'Sitio'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Departamento'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Trabajador'
        DataType = datString
        Size = 128
      end
      item
        Name = 'Laborables'
        DataType = datDecimal
        DecimalPrecision = 17
        DecimalScale = 6
      end
      item
        Name = 'Asistidas'
        DataType = datDecimal
        DecimalPrecision = 17
        DecimalScale = 6
      end
      item
        Name = 'ExtrasBrutas'
        DataType = datInteger
      end
      item
        Name = 'Pagar'
        DataType = datSmallInt
      end
      item
        Name = 'Extras'
        DataType = datSmallInt
      end
      item
        Name = 'Primas'
        DataType = datSmallInt
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = RemoteDataAdapter
    DetailOptions = [dtCascadeOpenClose, dtCascadeApplyUpdates, dtAutoFetch, dtCascadeDelete, dtCascadeUpdate, dtDisableLogOfCascadeDeletes, dtDisableLogOfCascadeUpdates, dtIncludeInAllInOneFetch]
    MasterOptions = [moCascadeOpenClose, moCascadeApplyUpdates, moCascadeDelete, moCascadeUpdate, moDisableLogOfCascadeDeletes, moDisableLogOfCascadeUpdates]
    LogicalName = 'viewNominaFacts'
    IndexDefs = <>
    Left = 488
    Top = 768
  end
  object ds_viewNominaFacts: TDADataSource
    DataSet = tbl_viewNominaFacts.Dataset
    DataTable = tbl_viewNominaFacts
    Left = 592
    Top = 768
  end
end
