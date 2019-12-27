program RestDataSnap;
{$APPTYPE GUI}

{$R *.dres}

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormServidor in 'FormServidor.pas' {FormPrincipal},
  ServerMethods in 'ServerMethods.pas' {ServerMethods1: TDataModule},
  ServerContainer in 'ServerContainer.pas' {ServerContainer1: TDataModule},
  WebModulePrincipal in 'WebModulePrincipal.pas' {WebModuleServidor: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
