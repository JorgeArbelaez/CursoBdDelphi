object DataModuleFactura: TDataModuleFactura
  OldCreateOrder = False
  Height = 378
  Width = 549
  object FDQueryFacturaCrear: TFDQuery
    Connection = DataModulePrincipal.FDConnection
    SQL.Strings = (
      'INSERT INTO [FACTURA_CAB]'
      '           ([NUMERO_FACTURA]'
      '           ,[FECHA]'
      '           ,[VENCIMIENTO]'
      '           ,[ID_CLIENTE]'
      '           ,[NOMBRE_CLIENTE]'
      '           ,[TOTAL])'
      '     VALUES'
      '           (:NUMERO_FACTURA,'
      '            :FECHA,'
      '            :VENCIMIENTO,'
      '            :ID_CLIENTE,'
      '            :NOMBRE_CLIENTE,'
      '            :TOTAL)')
    Left = 72
    Top = 24
    ParamData = <
      item
        Name = 'NUMERO_FACTURA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'FECHA'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 0d
      end
      item
        Name = 'VENCIMIENTO'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 0d
      end
      item
        Name = 'ID_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'NOMBRE_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0.000000000000000000
      end>
  end
  object FDQueryFacturaActualizar: TFDQuery
    Left = 72
    Top = 80
  end
  object FDQueryFacturaConsultar: TFDQuery
    Connection = DataModulePrincipal.FDConnection
    SQL.Strings = (
      'SELECT [NUMERO_FACTURA]'
      '      ,[FECHA]'
      '      ,[VENCIMIENTO]'
      '      ,[ID_CLIENTE]'
      '      ,[NOMBRE_CLIENTE]'
      '      ,[TOTAL]'
      '  FROM [FACTURA_CAB]'
      '  WHERE [NUMERO_FACTURA] = :NUMERO_FACTURA')
    Left = 72
    Top = 136
    ParamData = <
      item
        Name = 'NUMERO_FACTURA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FDQueryFacturaConsultarNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'NUMERO_FACTURA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryFacturaConsultarFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'FECHA'
      Required = True
    end
    object FDQueryFacturaConsultarVENCIMIENTO: TDateField
      FieldName = 'VENCIMIENTO'
      Origin = 'VENCIMIENTO'
      Required = True
    end
    object FDQueryFacturaConsultarID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object FDQueryFacturaConsultarNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'NOMBRE_CLIENTE'
      Size = 100
    end
    object FDQueryFacturaConsultarTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Required = True
    end
  end
  object FDQueryDetalleConsultar: TFDQuery
    Connection = DataModulePrincipal.FDConnection
    SQL.Strings = (
      'SELECT [NUMERO_FACTURA]'
      '      ,[NUMERO_DETALLE]'
      '      ,[DESCRIPCION]'
      '      ,[CANTIDAD]'
      '      ,[VALOR_UNITARIO]'
      '      ,[SUB_TOTAL]'
      '  FROM [FACTURA_DET]'
      '  WHERE [NUMERO_FACTURA] = :NUMERO_FACTURA')
    Left = 248
    Top = 136
    ParamData = <
      item
        Name = 'NUMERO_FACTURA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FDQueryDetalleConsultarNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'NUMERO_FACTURA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryDetalleConsultarNUMERO_DETALLE: TIntegerField
      FieldName = 'NUMERO_DETALLE'
      Origin = 'NUMERO_DETALLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryDetalleConsultarDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      Required = True
      Size = 200
    end
    object FDQueryDetalleConsultarCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
      Required = True
    end
    object FDQueryDetalleConsultarVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
    end
    object FDQueryDetalleConsultarSUB_TOTAL: TFloatField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      Required = True
    end
  end
  object FDQueryDetalleCrear: TFDQuery
    Connection = DataModulePrincipal.FDConnection
    SQL.Strings = (
      'INSERT INTO [FACTURA_DET]'
      '           ([NUMERO_FACTURA]'
      '           ,[NUMERO_DETALLE]'
      '           ,[DESCRIPCION]'
      '           ,[CANTIDAD]'
      '           ,[VALOR_UNITARIO]'
      '           ,[SUB_TOTAL])'
      '     VALUES'
      '           (:NUMERO_FACTURA'
      '           ,:NUMERO_DETALLE'
      '           ,:DESCRIPCION'
      '           ,:CANTIDAD'
      '           ,:VALOR_UNITARIO'
      '           ,:SUB_TOTAL)')
    Left = 248
    Top = 24
    ParamData = <
      item
        Name = 'NUMERO_FACTURA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'NUMERO_DETALLE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'CANTIDAD'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        Name = 'VALOR_UNITARIO'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        Name = 'SUB_TOTAL'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0.000000000000000000
      end>
  end
end
