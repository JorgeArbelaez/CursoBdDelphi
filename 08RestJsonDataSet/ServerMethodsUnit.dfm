object ServerMethods: TServerMethods
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 232
  Width = 541
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=sa'
      'Password=AudiSoft123'
      'Database=CursoBdDelphi'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 432
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 432
    Top = 168
  end
  object FDQueryCiudad: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT ID_CIUDAD, NOMBRE_CIUDAD FROM CIUDAD')
    Left = 120
    Top = 24
    object FDQueryCiudadID_CIUDAD: TIntegerField
      FieldName = 'ID_CIUDAD'
      Origin = 'ID_CIUDAD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCiudadNOMBRE_CIUDAD: TStringField
      FieldName = 'NOMBRE_CIUDAD'
      Origin = 'NOMBRE_CIUDAD'
      Required = True
      Size = 100
    end
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 432
    Top = 72
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 432
    Top = 120
  end
end
