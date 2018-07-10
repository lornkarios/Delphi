object MyD: TMyD
  OldCreateOrder = False
  Left = 923
  Top = 218
  Height = 483
  Width = 724
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Users\'#1040#1085#1090#1086#1085'\Desktop\'#1059#1085#1080#1082'\'#1041#1044'\'#1044#1088#1072#1075#1091#1085'\db\KOVALEV.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 64
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 136
    Top = 24
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 312
    Top = 104
  end
  object ibtTovar: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 100
      end>
    StoreDefs = True
    TableName = 'Tovar'
    Left = 56
    Top = 104
    object ibtTovarID: TIntegerField
      FieldName = 'ID'
    end
    object ibtTovarName: TIBStringField
      FieldName = 'Name'
      Size = 100
    end
  end
  object ibtClient: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'Client'
    Left = 120
    Top = 104
    object ibtClientID: TIntegerField
      FieldName = 'ID'
    end
    object ibtClientName: TIBStringField
      FieldName = 'Name'
      Size = 100
    end
    object ibtClientAdress: TIBStringField
      FieldName = 'Adress'
      Size = 255
    end
  end
  object ibtDogovor: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'Dogovor'
    Left = 184
    Top = 104
    object ibtDogovorID: TIntegerField
      FieldName = 'ID'
    end
    object ibtDogovorClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object ibtDogovorDate: TDateField
      FieldName = 'Date'
    end
    object ibtDogovorTOTALSUM: TFloatField
      FieldName = 'TOTALSUM'
    end
    object ibtDogovorOPLATA: TFloatField
      FieldName = 'OPLATA'
    end
  end
  object ibtD_T: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'Dogovor_Tovar'
    Left = 248
    Top = 104
    object ibtD_TTovarID: TIntegerField
      FieldName = 'TovarID'
    end
    object ibtD_TDogovorID: TIntegerField
      FieldName = 'DogovorID'
    end
    object ibtD_Tkolvo: TIntegerField
      FieldName = 'kolvo'
    end
    object ibtD_TDATE: TDateField
      FieldName = 'DATE'
    end
    object ibtD_TOPLATA: TFloatField
      FieldName = 'OPLATA'
    end
    object ibtD_TPRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object dspTovar: TDataSetProvider
    DataSet = ibtTovar
    Left = 56
    Top = 152
  end
  object dspClient: TDataSetProvider
    DataSet = ibtClient
    Left = 120
    Top = 152
  end
  object dspDogovor: TDataSetProvider
    DataSet = ibtDogovor
    Left = 184
    Top = 152
  end
  object dspD_T: TDataSetProvider
    DataSet = ibtD_T
    Left = 248
    Top = 152
  end
  object dspQuery: TDataSetProvider
    DataSet = IBQuery1
    Left = 312
    Top = 152
  end
  object ibspUpdTov: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateTovar'
    Left = 56
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptInput
      end>
  end
  object ibspDelTov: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteTovar'
    Left = 56
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdCl: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateClient'
    Left = 120
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INADRESS'
        ParamType = ptInput
      end>
  end
  object ibspDelCl: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteClient'
    Left = 120
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdDog: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateDogovor'
    Left = 184
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INCLIENTID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'INDATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INTOT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INOPL'
        ParamType = ptInput
      end>
  end
  object ibspDelDog: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteDogovor'
    Left = 184
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
  object ibspUpdD_T: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateDogovor_Tovar'
    Left = 248
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INTOVARID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INDOGOVORID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INKOL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'INDATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INOPL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INPRICE'
        ParamType = ptInput
      end>
  end
  object ibspDelD_T: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteDogovor_Tovar'
    Left = 248
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INTOVARID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INDOGOVORID'
        ParamType = ptInput
      end>
  end
  object ibtTMP: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TMP'
    Left = 368
    Top = 104
    object ibtTMPID: TIntegerField
      FieldName = 'ID'
    end
    object ibtTMPName: TIBStringField
      FieldName = 'Name'
      Size = 100
    end
    object ibtTMPKolvo: TIntegerField
      FieldName = 'Kolvo'
    end
    object ibtTMPKOLVOO: TSmallintField
      FieldName = 'KOLVOO'
    end
  end
  object dspTMP: TDataSetProvider
    DataSet = ibtTMP
    Left = 368
    Top = 152
  end
  object ibspUpdTMP: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UpdateTMP'
    Left = 368
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INKOL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INKOL2'
        ParamType = ptInput
      end>
  end
  object ibspDelTMP: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DeleteTMP'
    Left = 368
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end>
  end
end
