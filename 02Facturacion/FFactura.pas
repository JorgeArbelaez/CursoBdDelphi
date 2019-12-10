unit FFactura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TEstadoFactura = (efCrear, efConsultar);

  TFormFactura = class(TForm)
    ToolBar: TToolBar;
    PanelFactura: TPanel;
    ClientDataSetFactura: TClientDataSet;
    ClientDataSetFacturaNUMERO_FACTURA: TIntegerField;
    ClientDataSetFacturaFECHA: TDateField;
    ClientDataSetFacturaVENCIMIENTO: TDateField;
    ClientDataSetFacturaID_CLIENTE: TIntegerField;
    ClientDataSetFacturaNOMBRE_CLIENTE: TStringField;
    ClientDataSetFacturaTOTAL: TFloatField;
    DataSourceFactura: TDataSource;
    LabelNumero: TLabel;
    DBEditNumero: TDBEdit;
    LabelFecha: TLabel;
    LabelVencimiento: TLabel;
    LabelCliente: TLabel;
    DBEditIdCliente: TDBEdit;
    DBEditCliente: TDBEdit;
    LabelTotal: TLabel;
    DBNavigator: TDBNavigator;
    DateTimePickerFecha: TDateTimePicker;
    DateTimePickerVencimiento: TDateTimePicker;
    ClientDataSetDetalle: TClientDataSet;
    DataSourceDetalle: TDataSource;
    ClientDataSetDetalleNUMERO_FACTURA: TIntegerField;
    ClientDataSetDetalleNUMERO_DETALLE: TIntegerField;
    ClientDataSetDetalleDESCRIPCION: TStringField;
    ClientDataSetDetalleCANTIDAD: TFloatField;
    ClientDataSetDetalleVALOR_UNITARIO: TFloatField;
    ClientDataSetDetalleSUB_TOTAL: TFloatField;
    DBGridDetalles: TDBGrid;
    SpeedButtonBuscarCliente: TSpeedButton;
    DBTextTotal: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditNumeroChange(Sender: TObject);
    procedure ClientDataSetFacturaBeforePost(DataSet: TDataSet);
    procedure DataSourceFacturaUpdateData(Sender: TObject);
    procedure ClientDataSetDetalleCalcFields(DataSet: TDataSet);
    procedure Totalizar(DataSet: TDataSet);
  private
    { Private declarations }
    FEstado: TEstadoFactura;
    procedure SetEstado(const Value: TEstadoFactura);
    property Estado: TEstadoFactura read FEstado write SetEstado;
  public
    { Public declarations }
    procedure PonerTitulo(Titulo: String);
    procedure CrearNueva;
    procedure Consultar(Numero: Integer);
  end;

implementation

{$R *.dfm}

uses MFactura;

procedure TFormFactura.Totalizar(DataSet: TDataSet);
var
  Total: Double;
  BookMark: TBookMark;
begin
  Total := 0;
  BookMark := ClientDataSetDetalle.GetBookmark;
  ClientDataSetDetalle.DisableControls;
  try
    ClientDataSetDetalle.First;
    while not ClientDataSetDetalle.Eof do
    begin
      Total := Total + ClientDataSetDetalleSUB_TOTAL.Value;
      ClientDataSetDetalle.Next;
    end;
    ClientDataSetFacturaTOTAL.Value := Total;
  finally
    ClientDataSetDetalle.GotoBookmark(BookMark);
    ClientDataSetDetalle.FreeBookmark(BookMark);
    ClientDataSetDetalle.EnableControls;
  end;
end;

procedure TFormFactura.ClientDataSetDetalleCalcFields(DataSet: TDataSet);
begin
  ClientDataSetDetalleSUB_TOTAL.Value := ClientDataSetDetalleCANTIDAD.Value *
    ClientDataSetDetalleVALOR_UNITARIO.Value;
end;

procedure TFormFactura.ClientDataSetFacturaBeforePost(DataSet: TDataSet);
var
  I: Integer;
begin
  if Estado = efCrear then
  begin
    I := 0;
    ClientDataSetDetalle.First;
    while not ClientDataSetDetalle.Eof do
    begin
      Inc(I);
      ClientDataSetDetalle.Edit;
      ClientDataSetDetalleNUMERO_FACTURA.Value :=
        ClientDataSetFacturaNUMERO_FACTURA.Value;
      ClientDataSetDetalleNUMERO_DETALLE.Value := I;
      ClientDataSetDetalle.Post;
      ClientDataSetDetalle.Next;
    end;
    DataModuleFactura.CrearFactura(ClientDataSetFactura, ClientDataSetDetalle);
  end;
end;

procedure TFormFactura.Consultar(Numero: Integer);
begin
  Estado:= efConsultar;
  ClientDataSetFactura.CreateDataSet;
  ClientDataSetDetalle.CreateDataSet;
  DataModuleFactura.ConsultarFactura(Numero, ClientDataSetFactura, ClientDataSetDetalle);

end;

procedure TFormFactura.CrearNueva;
begin
  ClientDataSetFactura.CreateDataSet;
  ClientDataSetFactura.Insert;
  Estado:= efCrear;
  DBEditNumeroChange(nil);
  DateTimePickerFecha.Date := Date;
  DateTimePickerVencimiento.Date := IncMonth(Date);
  ClientDataSetDetalle.CreateDataSet;
end;

procedure TFormFactura.DataSourceFacturaUpdateData(Sender: TObject);
begin
  ClientDataSetFacturaFECHA.Value := DateTimePickerFecha.Date;
  ClientDataSetFacturaVENCIMIENTO.Value := DateTimePickerVencimiento.Date;
end;

procedure TFormFactura.DBEditNumeroChange(Sender: TObject);
begin
  if DBEditNumero.Text = '' then
  begin
    PonerTitulo('Nueva');
  end
  else
  begin
    PonerTitulo(DBEditNumero.Text);
  end;
end;

procedure TFormFactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormFactura.PonerTitulo(Titulo: String);
begin
  Caption := 'Factura - ' + Titulo;
  if FEstado = efCrear then
  begin
    Caption:= 'Creando ' + Caption;
  end
  else
  begin
    Caption:= 'Consultando ' + Caption;
  end;
end;

procedure TFormFactura.SetEstado(const Value: TEstadoFactura);
begin
  FEstado := Value;
  if FEstado = efConsultar then
  begin
    DBEditNumero.ReadOnly:= True;
    DateTimePickerFecha.Enabled:= True;
    DateTimePickerVencimiento.Enabled:= True;
    DBEditIdCliente.ReadOnly:= True;
    DBEditIdCliente.ReadOnly:= True;
    SpeedButtonBuscarCliente.Enabled:= False;
    DBGridDetalles.ReadOnly:= True;
  end;
end;

end.
