object CiudadesResource: TCiudadesResource
  OldCreateOrder = False
  Height = 338
  Width = 636
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=CursoBdDelphi'
      'User_Name=sa'
      'Password=AudiSoft123'
      'Server=localhost'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 176
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 312
    Top = 24
  end
  object FDQueryCiudades: TFDQuery
    Connection = FDConnection
    SchemaAdapter = FDSchemaAdapter
    SQL.Strings = (
      'select * from ciudad')
    Left = 48
    Top = 104
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    Left = 176
    Top = 104
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 448
    Top = 24
  end
end
