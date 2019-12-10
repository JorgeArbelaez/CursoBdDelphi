program ServidorDataSnap;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {ServerMethods: TDataModule},
  ServerContainerUnit in 'ServerContainerUnit.pas' {ServerContainer: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.Run;
end.

