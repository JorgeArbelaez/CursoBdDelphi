object FormPrincipalCliente: TFormPrincipalCliente
  Left = 0
  Top = 0
  Caption = 'Cliente DataSanp'
  ClientHeight = 45
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCadena: TLabel
    Left = 8
    Top = 11
    Width = 37
    Height = 13
    Caption = 'Cadena'
  end
  object EditCadena: TEdit
    Left = 51
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object ButtonEcho: TButton
    Left = 178
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Repetir'
    TabOrder = 1
    OnClick = ButtonEchoClick
  end
  object ButtonReversar: TButton
    Left = 259
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Reversar'
    TabOrder = 2
    OnClick = ButtonReversarClick
  end
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
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
    Top = 8
    UniqueId = '{105659D2-3B25-43F9-B4B3-ACD951B1E65E}'
  end
end
