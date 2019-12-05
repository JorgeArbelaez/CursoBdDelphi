object FormClientes: TFormClientes
  Left = 0
  Top = 0
  Caption = 'Tabla de clientes'
  ClientHeight = 415
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    329
    415)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCodigo: TLabel
    Left = 8
    Top = 32
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = DBEditCodigo
  end
  object LabelNombre: TLabel
    Left = 8
    Top = 72
    Width = 37
    Height = 13
    Caption = 'Nombre'
    FocusControl = DBEditNombre
  end
  object LabelDireccion: TLabel
    Left = 8
    Top = 112
    Width = 43
    Height = 13
    Caption = 'Direcci'#243'n'
    FocusControl = DBEditDireccion
  end
  object LabelTelefono: TLabel
    Left = 8
    Top = 152
    Width = 42
    Height = 13
    Caption = 'Tel'#233'fono'
    FocusControl = DBEditTelefono
  end
  object LabelFoto: TLabel
    Left = 8
    Top = 192
    Width = 22
    Height = 13
    Caption = 'Foto'
    FocusControl = DBImageFoto
  end
  object LabelCiuda: TLabel
    Left = 8
    Top = 360
    Width = 33
    Height = 13
    Caption = 'Ciudad'
    FocusControl = DBEditCiudad
  end
  object DBEditCodigo: TDBEdit
    Left = 8
    Top = 48
    Width = 134
    Height = 21
    DataField = 'ID_CLIENTE'
    DataSource = DataSourceCliente
    TabOrder = 0
  end
  object DBEditNombre: TDBEdit
    Left = 8
    Top = 88
    Width = 312
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NOMBRE_CLIENTE'
    DataSource = DataSourceCliente
    TabOrder = 1
    ExplicitWidth = 300
  end
  object DBEditDireccion: TDBEdit
    Left = 8
    Top = 128
    Width = 312
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DIRECCION'
    DataSource = DataSourceCliente
    TabOrder = 2
    ExplicitWidth = 300
  end
  object DBEditTelefono: TDBEdit
    Left = 8
    Top = 168
    Width = 312
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'TELEFONO'
    DataSource = DataSourceCliente
    TabOrder = 3
    ExplicitWidth = 300
  end
  object DBImageFoto: TDBImage
    Left = 8
    Top = 208
    Width = 105
    Height = 140
    DataField = 'FOTO'
    DataSource = DataSourceCliente
    Stretch = True
    TabOrder = 4
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 329
    Height = 29
    ButtonHeight = 29
    Caption = 'ToolBar'
    TabOrder = 7
    ExplicitWidth = 336
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 29
      DataSource = DataSourceCliente
      TabOrder = 0
    end
  end
  object DBEditCiudad: TDBEdit
    Left = 8
    Top = 379
    Width = 33
    Height = 21
    TabStop = False
    Color = clInactiveCaption
    DataField = 'ID_CIUDAD'
    DataSource = DataSourceCliente
    ReadOnly = True
    TabOrder = 5
  end
  object DBLookupComboBoxCiudad: TDBLookupComboBox
    Left = 47
    Top = 379
    Width = 273
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NomCiudad'
    DataSource = DataSourceCliente
    TabOrder = 6
    ExplicitWidth = 253
  end
  object DataSourceCliente: TDataSource
    DataSet = DataModulePrincipal.FDTableCliente
    Left = 168
    Top = 232
  end
end
