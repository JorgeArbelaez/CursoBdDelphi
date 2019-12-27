object CiudadResource: TCiudadResource
  OldCreateOrder = False
  Height = 300
  Width = 600
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
  object FDQueryCiudades: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from ciudad')
    Left = 48
    Top = 104
    object FDQueryCiudadesID_CIUDAD: TIntegerField
      FieldName = 'ID_CIUDAD'
      Required = True
    end
    object FDQueryCiudadesNOMBRE_CIUDAD: TStringField
      FieldName = 'NOMBRE_CIUDAD'
      Required = True
      Size = 100
    end
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 160
    Top = 24
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 280
    Top = 24
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 424
    Top = 24
  end
  object FDQueryCiudad: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from ciudad where id_ciudad = :id_ciudad')
    Left = 192
    Top = 104
    ParamData = <
      item
        Name = 'ID_CIUDAD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
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
end
