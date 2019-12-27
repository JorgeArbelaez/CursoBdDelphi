program RestJsonCliente;

uses
  System.StartUpCopy,
  FMX.Forms,
  FCliente in 'FCliente.pas' {FormCliente},
  ClientClassesUnit in 'ClientClassesUnit.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCliente, FormCliente);
  Application.CreateForm(TClientModule, ClientModule);
  Application.Run;
end.
