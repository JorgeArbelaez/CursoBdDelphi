object FormPrincipalCliente: TFormPrincipalCliente
  Left = 0
  Top = 0
  Caption = 'Cliente DataSanp'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SocketConnection: TSocketConnection
    ServerName = 'DSServer'
    Host = 'localhost'
    Left = 64
    Top = 32
  end
end
