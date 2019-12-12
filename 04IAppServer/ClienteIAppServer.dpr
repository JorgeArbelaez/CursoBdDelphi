program ClienteIAppServer;

uses
  Vcl.Forms,
  FCliente in 'FCliente.pas' {FormCliente},
  ServerMethodsClient in 'ServerMethodsClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCliente, FormCliente);
  Application.Run;
end.
