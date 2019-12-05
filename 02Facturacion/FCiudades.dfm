object FormCiudades: TFormCiudades
  Left = 0
  Top = 0
  Caption = 'Tabla de ciudades'
  ClientHeight = 408
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 409
    Height = 29
    Caption = 'ToolBar'
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 72
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
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 409
    Height = 379
    ActivePage = TabSheetDetalles
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 447
    object TabSheetDetalles: TTabSheet
      Caption = 'Detalles'
      ExplicitLeft = 8
      ExplicitWidth = 439
      DesignSize = (
        401
        351)
      object LabelCodigo: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEditCodigo
      end
      object LabelNombre: TLabel
        Left = 8
        Top = 48
        Width = 37
        Height = 13
        Caption = 'Nombre'
        FocusControl = DBEditNombre
      end
      object DBEditCodigo: TDBEdit
        Left = 8
        Top = 24
        Width = 134
        Height = 21
        DataField = 'ID_CIUDAD'
        DataSource = DataSourceCiudad
        TabOrder = 0
      end
      object DBEditNombre: TDBEdit
        Left = 8
        Top = 64
        Width = 379
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NOMBRE_CIUDAD'
        DataSource = DataSourceCiudad
        TabOrder = 1
        ExplicitWidth = 417
      end
    end
    object TabSheetRejilla: TTabSheet
      Caption = 'Rejilla'
      ImageIndex = 1
      ExplicitWidth = 439
      object DBGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 401
        Height = 351
        Align = alClient
        DataSource = DataSourceCiudad
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Color = clYellow
            Expanded = False
            FieldName = 'ID_CIUDAD'
            Visible = True
          end
          item
            Color = clAqua
            Expanded = False
            FieldName = 'NOMBRE_CIUDAD'
            Title.Caption = 'Nombre de la ciudad'
            Width = 300
            Visible = True
          end>
      end
    end
  end
  object DataSourceCiudad: TDataSource
    DataSet = DataModulePrincipal.FDTableCiudad
    Left = 216
    Top = 208
  end
end
