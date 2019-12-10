unit FPrincipalCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect, Datasnap.Win.SConnect;

type
  TFormPrincipalCliente = class(TForm)
    SocketConnection: TSocketConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipalCliente: TFormPrincipalCliente;

implementation

{$R *.dfm}

end.
