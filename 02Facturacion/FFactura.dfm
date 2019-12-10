object FormFactura: TFormFactura
  Left = 0
  Top = 0
  Caption = 'Factura'
  ClientHeight = 353
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 753
    Height = 29
    Caption = 'ToolBar'
    TabOrder = 0
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 56
      Height = 22
      DataSource = DataSourceFactura
      VisibleButtons = [nbPost, nbCancel]
      Hints.Strings = (
        'First record'
        'Prior record'
        'Next record'
        'Last record'
        'Insert record'
        'Delete record'
        'Edit record'
        'Guardar'
        'Cancelar'
        'Refresh data'
        'Apply updates'
        'Cancel updates')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object PanelFactura: TPanel
    Left = 0
    Top = 29
    Width = 753
    Height = 60
    Align = alTop
    TabOrder = 1
    object LabelNumero: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = DBEditNumero
    end
    object LabelFecha: TLabel
      Left = 148
      Top = 6
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object LabelVencimiento: TLabel
      Left = 280
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Vencimiento'
    end
    object LabelCliente: TLabel
      Left = 416
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Cliente'
      FocusControl = DBEditIdCliente
    end
    object LabelTotal: TLabel
      Left = 640
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object SpeedButtonBuscarCliente: TSpeedButton
      Left = 611
      Top = 24
      Width = 23
      Height = 22
      Caption = '...'
    end
    object DBTextTotal: TDBText
      Left = 640
      Top = 27
      Width = 104
      Height = 19
      AutoSize = True
      DataField = 'TOTAL'
      DataSource = DataSourceFactura
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEditNumero: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'NUMERO_FACTURA'
      DataSource = DataSourceFactura
      TabOrder = 0
      OnChange = DBEditNumeroChange
    end
    object DBEditIdCliente: TDBEdit
      Left = 416
      Top = 24
      Width = 33
      Height = 21
      DataField = 'ID_CLIENTE'
      DataSource = DataSourceFactura
      TabOrder = 3
    end
    object DBEditCliente: TDBEdit
      Left = 455
      Top = 24
      Width = 146
      Height = 21
      DataField = 'NOMBRE_CLIENTE'
      DataSource = DataSourceFactura
      TabOrder = 4
    end
    object DateTimePickerFecha: TDateTimePicker
      Left = 148
      Top = 24
      Width = 126
      Height = 21
      Date = 43803.000000000000000000
      Time = 0.336874502318096300
      TabOrder = 1
    end
    object DateTimePickerVencimiento: TDateTimePicker
      Left = 280
      Top = 24
      Width = 130
      Height = 21
      Date = 43803.000000000000000000
      Time = 0.337302083331451300
      TabOrder = 2
    end
  end
  object DBGridDetalles: TDBGrid
    Left = 0
    Top = 89
    Width = 753
    Height = 264
    Align = alClient
    DataSource = DataSourceDetalle
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_UNITARIO'
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'SUB_TOTAL'
        Visible = True
      end>
  end
  object ClientDataSetFactura: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = ClientDataSetFacturaBeforePost
    Left = 440
    Top = 216
    object ClientDataSetFacturaNUMERO_FACTURA: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO_FACTURA'
      Origin = 'NUMERO_FACTURA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSetFacturaFECHA: TDateField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'FECHA'
      Required = True
    end
    object ClientDataSetFacturaVENCIMIENTO: TDateField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
      Origin = 'VENCIMIENTO'
      Required = True
    end
    object ClientDataSetFacturaID_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object ClientDataSetFacturaNOMBRE_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'NOMBRE_CLIENTE'
      Size = 100
    end
    object ClientDataSetFacturaTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Required = True
      currency = True
    end
  end
  object DataSourceFactura: TDataSource
    DataSet = ClientDataSetFactura
    OnUpdateData = DataSourceFacturaUpdateData
    Left = 544
    Top = 216
  end
  object ClientDataSetDetalle: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = Totalizar
    AfterDelete = Totalizar
    OnCalcFields = ClientDataSetDetalleCalcFields
    Left = 440
    Top = 272
    object ClientDataSetDetalleNUMERO_FACTURA: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO_FACTURA'
      Origin = 'NUMERO_FACTURA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSetDetalleNUMERO_DETALLE: TIntegerField
      DisplayLabel = 'Consecutivo'
      FieldName = 'NUMERO_DETALLE'
      Origin = 'NUMERO_DETALLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSetDetalleDESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      Required = True
      Size = 200
    end
    object ClientDataSetDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
      Required = True
    end
    object ClientDataSetDetalleVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor unitario'
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      currency = True
    end
    object ClientDataSetDetalleSUB_TOTAL: TFloatField
      DisplayLabel = 'Subtotal'
      FieldKind = fkCalculated
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      Required = True
      currency = True
      Calculated = True
    end
  end
  object DataSourceDetalle: TDataSource
    DataSet = ClientDataSetDetalle
    Left = 544
    Top = 272
  end
end
