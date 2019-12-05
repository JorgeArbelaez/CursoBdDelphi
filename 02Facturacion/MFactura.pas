unit MFactura;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModuleFactura = class(TDataModule)
    FDQueryFacturaCrear: TFDQuery;
    FDQueryFacturaActualizar: TFDQuery;
    FDQueryFacturaConsultar: TFDQuery;
    FDQueryFacturaConsultarNUMERO_FACTURA: TIntegerField;
    FDQueryFacturaConsultarFECHA: TDateField;
    FDQueryFacturaConsultarVENCIMIENTO: TDateField;
    FDQueryFacturaConsultarID_CLIENTE: TIntegerField;
    FDQueryFacturaConsultarNOMBRE_CLIENTE: TStringField;
    FDQueryFacturaConsultarTOTAL: TFloatField;
    FDQueryDetalleConsultar: TFDQuery;
    FDQueryDetalleConsultarNUMERO_FACTURA: TIntegerField;
    FDQueryDetalleConsultarNUMERO_DETALLE: TIntegerField;
    FDQueryDetalleConsultarDESCRIPCION: TStringField;
    FDQueryDetalleConsultarCANTIDAD: TFloatField;
    FDQueryDetalleConsultarVALOR_UNITARIO: TFloatField;
    FDQueryDetalleConsultarSUB_TOTAL: TFloatField;
    FDQueryDetalleCrear: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CrearFactura(DataSetCabecera, DataSetDetalle: TDataSet);
  end;

var
  DataModuleFactura: TDataModuleFactura;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MPrincipal;

{$R *.dfm}
{ TDataModuleFactura }

procedure TDataModuleFactura.CrearFactura(DataSetCabecera, DataSetDetalle
  : TDataSet);
begin
  DataModulePrincipal.FDConnection.StartTransaction;
  try
    FDQueryFacturaCrear.ParamByName('NUMERO_FACTURA').Value :=
      DataSetCabecera.FieldByName('NUMERO_FACTURA').Value;
    FDQueryFacturaCrear.ParamByName('FECHA').Value :=
      DataSetCabecera.FieldByName('FECHA').Value;
    FDQueryFacturaCrear.ParamByName('VENCIMIENTO').Value :=
      DataSetCabecera.FieldByName('VENCIMIENTO').Value;
    FDQueryFacturaCrear.ParamByName('TOTAL').Value :=
      DataSetCabecera.FieldByName('TOTAL').Value;
    if DataSetCabecera.FieldByName('ID_CLIENTE').AsInteger = 0 then
    begin
      FDQueryFacturaCrear.ParamByName('ID_CLIENTE').Clear;
    end
    else
    begin
      FDQueryFacturaCrear.ParamByName('ID_CLIENTE').Value :=
        DataSetCabecera.FieldByName('ID_CLIENTE').Value;
    end;
    if DataSetCabecera.FieldByName('NOMBRE_CLIENTE').AsString = '' then
    begin
      FDQueryFacturaCrear.ParamByName('NOMBRE_CLIENTE').Clear;
    end
    else
    begin
      FDQueryFacturaCrear.ParamByName('NOMBRE_CLIENTE').Value :=
        DataSetCabecera.FieldByName('NOMBRE_CLIENTE').Value;
    end;
    FDQueryFacturaCrear.ExecSQL;
    DataSetDetalle.First;
    while not DataSetDetalle.Eof do
    begin
      FDQueryDetalleCrear.ParamByName('NUMERO_FACTURA').Value :=
        DataSetDetalle.FieldByName('NUMERO_FACTURA').Value;
      FDQueryDetalleCrear.ParamByName('NUMERO_DETALLE').Value :=
        DataSetDetalle.FieldByName('NUMERO_DETALLE').Value;
      FDQueryDetalleCrear.ParamByName('DESCRIPCION').Value :=
        DataSetDetalle.FieldByName('DESCRIPCION').Value;
      FDQueryDetalleCrear.ParamByName('CANTIDAD').Value :=
        DataSetDetalle.FieldByName('CANTIDAD').Value;
      FDQueryDetalleCrear.ParamByName('VALOR_UNITARIO').Value :=
        DataSetDetalle.FieldByName('VALOR_UNITARIO').Value;
      FDQueryDetalleCrear.ParamByName('SUB_TOTAL').Value :=
        DataSetDetalle.FieldByName('SUB_TOTAL').Value;
      FDQueryDetalleCrear.ExecSQL;
      DataSetDetalle.Next;
    end;
    DataModulePrincipal.FDConnection.Commit;
  except
    DataModulePrincipal.FDConnection.Rollback;
  end;
end;

end.
