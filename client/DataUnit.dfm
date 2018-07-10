object dmMy: TdmMy
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 455
  Top = 189
  Height = 256
  Width = 548
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{9D4A636F-014A-459C-A293-C2DFDCCFFD07}'
    ServerName = 'myServer.MyServerCl'
    Left = 40
    Top = 24
  end
  object cdsTovar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTovar'
    RemoteServer = DCOMConnection1
    Left = 16
    Top = 96
    object cdsTovarID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsTovarName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 100
    end
    object cdsTovarCost: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'Cost'
    end
  end
  object cdsClient: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClient'
    RemoteServer = DCOMConnection1
    Left = 16
    Top = 144
    object cdsClientID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsClientName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 100
    end
    object cdsClientAdress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Adress'
      Size = 255
    end
  end
  object cdsDogovor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDogovor'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsDogovorCalcFields
    Left = 104
    Top = 96
    object cdsDogovorID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object cdsDogovorClientID: TIntegerField
      FieldName = 'ClientID'
      Required = True
      Visible = False
    end
    object cdsDogovorDate: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'Date'
    end
    object cdsDogovoroplataN: TIntegerField
      DisplayLabel = #1053#1072#1083'/'#1041#1077#1079#1085#1072#1083
      FieldName = 'oplataN'
      Visible = False
    end
    object cdsDogovorClientName: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 50
      FieldKind = fkInternalCalc
      FieldName = 'ClientName'
      Size = 100
    end
    object cdsDogovorClientAdress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'ClientAdress'
      Size = 255
      Calculated = True
    end
    object cdsDogovorNal: TStringField
      DisplayLabel = #1053#1072#1083#1080#1095#1085#1099#1081'/'#1041#1077#1079#1085#1072#1083#1080#1095#1085#1099#1081
      FieldKind = fkCalculated
      FieldName = 'Nal'
      Calculated = True
    end
    object cdsDogovorTOTALSUM: TFloatField
      DisplayLabel = 'C'#1091#1084#1084#1072
      DisplayWidth = 30
      FieldName = 'TOTALSUM'
    end
  end
  object cdsD_T: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspD_T'
    RemoteServer = DCOMConnection1
    OnCalcFields = cdsD_TCalcFields
    Left = 104
    Top = 144
    object cdsD_TTovarID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'TovarID'
    end
    object cdsD_TDogovorID: TIntegerField
      FieldName = 'DogovorID'
      Visible = False
    end
    object cdsD_TName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Name'
      LookupDataSet = cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'TovarID'
      Size = 100
      Lookup = True
    end
    object cdsD_TDATE: TDateField
      FieldName = 'DATE'
    end
    object cdsD_TPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'Price'
      LookupDataSet = cdsTovar
      LookupKeyFields = 'ID'
      LookupResultField = 'Cost'
      KeyFields = 'TovarID'
      DisplayFormat = ',0.00'
      Lookup = True
    end
    object cdsD_Tkolvo: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'kolvo'
      DisplayFormat = ',0.00'
    end
    object cdsD_TSum: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Sum'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object cdsD_TSHIPMENT: TSmallintField
      FieldName = 'SHIPMENT'
      Visible = False
    end
    object cdsD_TOtgruz: TStringField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085'/'#1053#1077' '#1086#1090#1075#1088#1091#1078#1077#1085
      FieldKind = fkCalculated
      FieldName = 'Otgruz'
      Size = 100
      Calculated = True
    end
    object cdsD_TClientID: TStringField
      FieldKind = fkLookup
      FieldName = 'ClientID'
      LookupDataSet = cdsDogovor
      LookupKeyFields = 'ID'
      LookupResultField = 'ClientID'
      KeyFields = 'DogovorID'
      Visible = False
      Size = 100
      Lookup = True
    end
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOMConnection1
    Left = 176
    Top = 96
  end
  object cdsTMP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTMP'
    RemoteServer = DCOMConnection1
    Left = 176
    Top = 144
    object cdsTMPID: TIntegerField
      FieldName = 'ID'
    end
    object cdsTMPName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object cdsTMPKolvo: TIntegerField
      FieldName = 'Kolvo'
    end
    object cdsTMPKolvoOt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'KolvoOt'
      Calculated = True
    end
  end
end
