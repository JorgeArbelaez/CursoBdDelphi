program ClienteDataSnap;

uses
  Vcl.Forms,
  FPrincipalCliente in 'FPrincipalCliente.pas' {FormPrincipalCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipalCliente, FormPrincipalCliente);
  Application.Run;
end.
