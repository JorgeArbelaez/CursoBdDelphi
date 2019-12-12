object ServerMethods: TServerMethods
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConnection: TFDConnection
    Params.Strings = (
      'Password=AudiSoft123'
      'Server=localhost'
      'User_Name=sa'
      'Database=CursoBdDelphi'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
end
