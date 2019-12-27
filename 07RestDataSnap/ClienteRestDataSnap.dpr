program ClienteRestDataSnap;

uses
  System.StartUpCopy,
  FMX.Forms,
  FCliente in 'FCliente.pas' {FormCliente},
  ServerMethodsClient in 'ServerMethodsClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCliente, FormCliente);
  Application.Run;
end.
