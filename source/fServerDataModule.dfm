object ServerDataModule: TServerDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 207
  Width = 352
  object Message: TROBinMessage
    Envelopes = <>
    Left = 32
    Top = 56
  end
  object ConnectionManager: TDAConnectionManager
    PoolTimeoutSeconds = 100
    Connections = <
      item
        Name = 'ADO Connection to GoliathTA'
        ConnectionString = 
          'ADO?AuxDriver=SQLOLEDB.1;Server=SERVER-W2K;Database=GoliathTA;Us' +
          'erID=sa;Password=incognito;Schemas=1;'
        ConnectionType = 'MSSQL'
        Default = True
      end>
    DriverManager = DriverManager
    PoolingEnabled = True
    Left = 136
    Top = 56
  end
  object DriverManager: TDADriverManager
    DriverDirectory = 'C:\Program Files\RemObjects Software\Data Abstract (Common)\Bin\'
    TraceActive = False
    TraceFlags = [toExecute, toConnect]
    Left = 136
    Top = 10
  end
  object ADODriver: TDAADODriver
    Left = 256
    Top = 8
  end
  object DataDictionary: TDADataDictionary
    Fields = <>
    Left = 32
    Top = 104
  end
  object SessionManager: TROInMemorySessionManager
    Left = 136
    Top = 104
  end
  object Server: TROSynapseSuperTcpServer
    Dispatchers = <
      item
        Name = 'Message'
        Message = Message
        Enabled = True
      end>
    DefaultResponse = 'ROSC:Invalid connection string'
    Left = 32
    Top = 8
  end
end
