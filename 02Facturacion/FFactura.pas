unit FFactura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
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
    DBEditTotal: TDBEdit;
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
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditNumeroChange(Sender: TObject);
    procedure ClientDataSetFacturaBeforePost(DataSet: TDataSet);
    procedure DataSourceFacturaUpdateData(Sender: TObject);
    procedure ClientDataSetDetalleCalcFields(DataSet: TDataSet);
    procedure Totalizar(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PonerTitulo(Titulo: String);
    procedure CrearNueva;
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
  if ClientDataSetFactura.State = dsInsert then
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

procedure TFormFactura.CrearNueva;
begin
  ClientDataSetFactura.CreateDataSet;
  ClientDataSetFactura.Insert;
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
end;

end.
