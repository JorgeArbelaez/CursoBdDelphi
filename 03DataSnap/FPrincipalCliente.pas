unit FPrincipalCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect, Datasnap.Win.SConnect, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Data.SqlExpr, Vcl.StdCtrls,
  UServerMethodsClient;

type
  TFormPrincipalCliente = class(TForm)
    LabelCadena: TLabel;
    EditCadena: TEdit;
    ButtonEcho: TButton;
    ButtonReversar: TButton;
    procedure ButtonEchoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonReversarClick(Sender: TObject);
  published
    SQLConnection: TSQLConnection;
  private
    { Private declarations }
    Proxy: TServerMethodsClient;
  public
    { Public declarations }
  end;

var
  FormPrincipalCliente: TFormPrincipalCliente;

implementation

{$R *.dfm}

procedure TFormPrincipalCliente.ButtonEchoClick(Sender: TObject);
begin
  ShowMessage(Proxy.EchoString(EditCadena.Text));
end;

procedure TFormPrincipalCliente.ButtonReversarClick(Sender: TObject);
var
  MiProxy: TServerMethodsClient;
begin
  try
    SQLConnection.Close;
  except
  end;
  SQLConnection.Open;
  MiProxy:= TServerMethodsClient.Create(SQLConnection.DBXConnection);
  try
    ShowMessage(MiProxy.ReverseString(EditCadena.Text));
  finally
    MiProxy.Free;
  end;
end;

procedure TFormPrincipalCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Proxy.Free;
  SQLConnection.Close;
end;

procedure TFormPrincipalCliente.FormCreate(Sender: TObject);
begin
  SQLConnection.Open;
  Proxy := TServerMethodsClient.Create(SQLConnection.DBXConnection);
end;

end.
