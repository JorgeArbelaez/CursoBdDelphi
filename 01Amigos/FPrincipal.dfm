object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  ActiveControl = PageControl
  Caption = 'Lista de amigos'
  ClientHeight = 397
  ClientWidth = 577
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
    Width = 577
    Height = 29
    ButtonHeight = 23
    Caption = 'ToolBar'
    TabOrder = 0
    ExplicitWidth = 343
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 232
      Height = 23
      DataSource = DataSourceAmigos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 577
    Height = 368
    ActivePage = TabSheetRejilla
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 442
    object TabSheetDetalles: TTabSheet
      Caption = 'Detalles'
      ExplicitWidth = 434
      DesignSize = (
        569
        340)
      object LabelNombre: TLabel
        Left = 8
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Nombre'
        FocusControl = DBEditNombre
      end
      object LabelTelefono: TLabel
        Left = 8
        Top = 48
        Width = 42
        Height = 13
        Caption = 'Tel'#233'fono'
        FocusControl = DBEditTelefono
      end
      object LabelEdad: TLabel
        Left = 8
        Top = 88
        Width = 24
        Height = 13
        Caption = 'Edad'
        FocusControl = DBEditEdad
      end
      object DBEditNombre: TDBEdit
        Left = 8
        Top = 24
        Width = 550
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Nombre'
        DataSource = DataSourceAmigos
        TabOrder = 0
        ExplicitWidth = 654
      end
      object DBEditTelefono: TDBEdit
        Left = 8
        Top = 64
        Width = 199
        Height = 21
        DataField = 'Telefono'
        DataSource = DataSourceAmigos
        TabOrder = 1
      end
      object DBEditEdad: TDBEdit
        Left = 8
        Top = 104
        Width = 134
        Height = 21
        DataField = 'Edad'
        DataSource = DataSourceAmigos
        TabOrder = 2
      end
    end
    object TabSheetRejilla: TTabSheet
      Caption = 'Rejilla'
      ImageIndex = 1
      ExplicitWidth = 434
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 569
        Height = 340
        Align = alClient
        DataSource = DataSourceAmigos
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object ClientDataSetAmigos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = ClientDataSetAmigosAfterPost
    BeforeDelete = ClientDataSetAmigosBeforeDelete
    Left = 184
    Top = 192
    object ClientDataSetAmigosNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object ClientDataSetAmigosTelefono: TStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'Telefono'
      Size = 15
    end
    object ClientDataSetAmigosEdad: TIntegerField
      FieldName = 'Edad'
      OnValidate = ClientDataSetAmigosEdadValidate
    end
  end
  object DataSourceAmigos: TDataSource
    DataSet = ClientDataSetAmigos
    Left = 56
    Top = 192
  end
end
