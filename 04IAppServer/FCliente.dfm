object FormCliente: TFormCliente
  Left = 0
  Top = 0
  Caption = 'ClienteIAppServer'
  ClientHeight = 464
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 401
    Height = 29
    Caption = 'ToolBar'
    TabOrder = 0
    ExplicitLeft = 144
    ExplicitTop = 24
    ExplicitWidth = 150
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 22
      DataSource = DataSourceCiudad
      TabOrder = 0
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 29
    Width = 401
    Height = 435
    Align = alClient
    DataSource = DataSourceCiudad
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CIUDAD'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CIUDAD'
        Title.Caption = 'Nombre'
        Width = 300
        Visible = True
      end>
  end
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Connected = True
    Left = 88
    Top = 80
    UniqueId = '{DCE860C9-CED7-45F4-8B9A-2AC077F6FA4B}'
  end
  object DSProviderConnectionCiudad: TDSProviderConnection
    ServerClassName = 'TServerMethods'
    Connected = True
    SQLConnection = SQLConnection
    Left = 88
    Top = 136
  end
  object ClientDataSetCiudad: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCiudad'
    RemoteServer = DSProviderConnectionCiudad
    AfterPost = ClientDataSetCiudadAfterPostDelete
    AfterDelete = ClientDataSetCiudadAfterPostDelete
    Left = 88
    Top = 200
    object ClientDataSetCiudadID_CIUDAD: TIntegerField
      FieldName = 'ID_CIUDAD'
      Origin = 'ID_CIUDAD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSetCiudadNOMBRE_CIUDAD: TStringField
      FieldName = 'NOMBRE_CIUDAD'
      Origin = 'NOMBRE_CIUDAD'
      Required = True
      Size = 100
    end
  end
  object DataSourceCiudad: TDataSource
    DataSet = ClientDataSetCiudad
    Left = 88
    Top = 264
  end
end
