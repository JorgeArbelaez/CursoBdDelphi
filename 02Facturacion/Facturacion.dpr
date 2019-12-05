program Facturacion;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal},
  FClientes in 'FClientes.pas' {FormClientes},
  MPrincipal in 'MPrincipal.pas' {DataModulePrincipal: TDataModule},
  FCiudades in 'FCiudades.pas' {FormCiudades},
  FFactura in 'FFactura.pas' {FormFactura},
  MFactura in 'MFactura.pas' {DataModuleFactura: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModulePrincipal, DataModulePrincipal);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDataModuleFactura, DataModuleFactura);
  Application.Run;
end.
