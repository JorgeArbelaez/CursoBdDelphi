unit FCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, Data.DBXCommon, Data.DbxHTTPLayer, Data.DB, Data.SqlExpr,
  FMX.StdCtrls, FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.Controls.Presentation;

type
  TFormCliente = class(TForm)
    SQLConnection: TSQLConnection;
    LabelSumando1: TLabel;
    LabelSumando2: TLabel;
    NumberBoxSumando1: TNumberBox;
    NumberBoxSumando2: TNumberBox;
    ButtonSumar: TButton;
    LabelResultado: TLabel;
    LabelSuma: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LimpiarSuma(Sender: TObject);
    procedure ButtonSumarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

{$R *.fmx}

uses ServerMethodsClient;

procedure TFormCliente.ButtonSumarClick(Sender: TObject);
var
  Proxy: TServerMethods1Client;
  Suma: Integer;
begin
  Proxy := TServerMethods1Client.Create(SQLConnection.DBXConnection);
  Suma := Proxy.Sumar(Trunc(NumberBoxSumando1.Value),
    Trunc(NumberBoxSumando2.Value));
  LabelSuma.Text:= IntToStr(Suma);
end;

procedure TFormCliente.FormCreate(Sender: TObject);
begin
  SQLConnection.Open;
end;

procedure TFormCliente.LimpiarSuma(Sender: TObject);
begin
  LabelSuma.Text := '';
end;

end.
