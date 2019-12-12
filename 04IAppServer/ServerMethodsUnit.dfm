object ServerMethods: TServerMethods
  Tag = 1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 246
  Width = 306
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=sa'
      'Password=AudiSoft123'
      'Database=CursoBdDelphi'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 72
    Top = 16
  end
  object FDTableCiudad: TFDTable
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'CursoBdDelphi.dbo.CIUDAD'
    TableName = 'CursoBdDelphi.dbo.CIUDAD'
    Left = 72
    Top = 64
  end
  object DataSetProviderCiudad: TDataSetProvider
    DataSet = FDTableCiudad
    Left = 72
    Top = 120
  end
end
