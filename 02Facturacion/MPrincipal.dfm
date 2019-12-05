object DataModulePrincipal: TDataModulePrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 378
  Width = 444
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=CursoBdDelphi'
      'User_Name=sa'
      'Password=AudiSoft123'
      'Server=localhost'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object FDTableCliente: TFDTable
    IndexFieldNames = 'ID_CLIENTE'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'CursoBdDelphi.dbo.CLIENTE'
    TableName = 'CursoBdDelphi.dbo.CLIENTE'
    Left = 152
    Top = 32
    object FDTableClienteID_CLIENTE: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTableClienteNOMBRE_CLIENTE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'NOMBRE_CLIENTE'
      Required = True
      Size = 100
    end
    object FDTableClienteDIRECCION: TStringField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECCION'
      Origin = 'DIRECCION'
      Size = 100
    end
    object FDTableClienteTELEFONO: TStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
    end
    object FDTableClienteFOTO: TBlobField
      DisplayLabel = 'Foto'
      FieldName = 'FOTO'
      Origin = 'FOTO'
      Size = 2147483647
    end
    object FDTableClienteID_CIUDAD: TIntegerField
      DisplayLabel = 'Ciudad'
      FieldName = 'ID_CIUDAD'
      Origin = 'ID_CIUDAD'
    end
    object FDTableClienteNomCiudad: TStringField
      FieldKind = fkLookup
      FieldName = 'NomCiudad'
      LookupDataSet = FDTableCiudad
      LookupKeyFields = 'ID_CIUDAD'
      LookupResultField = 'NOMBRE_CIUDAD'
      KeyFields = 'ID_CIUDAD'
      Size = 100
      Lookup = True
    end
  end
  object FDTableCiudad: TFDTable
    IndexFieldNames = 'ID_CIUDAD'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'CursoBdDelphi.dbo.CIUDAD'
    TableName = 'CursoBdDelphi.dbo.CIUDAD'
    Left = 256
    Top = 32
    object FDTableCiudadID_CIUDAD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_CIUDAD'
      Origin = 'ID_CIUDAD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDTableCiudadNOMBRE_CIUDAD: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_CIUDAD'
      Origin = 'NOMBRE_CIUDAD'
      Required = True
      Size = 100
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 40
    Top = 120
  end
end
