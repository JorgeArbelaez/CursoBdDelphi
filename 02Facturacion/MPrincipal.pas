unit MPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.AppEvnts, Vcl.Dialogs;

type
  TDataModulePrincipal = class(TDataModule)
    FDConnection: TFDConnection;
    FDTableCliente: TFDTable;
    FDTableClienteID_CLIENTE: TFDAutoIncField;
    FDTableClienteNOMBRE_CLIENTE: TStringField;
    FDTableClienteDIRECCION: TStringField;
    FDTableClienteTELEFONO: TStringField;
    FDTableClienteFOTO: TBlobField;
    FDTableCiudad: TFDTable;
    FDTableCiudadID_CIUDAD: TIntegerField;
    FDTableCiudadNOMBRE_CIUDAD: TStringField;
    FDTableClienteID_CIUDAD: TIntegerField;
    FDTableClienteNomCiudad: TStringField;
    ApplicationEvents: TApplicationEvents;
    procedure DataModuleCreate(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulePrincipal: TDataModulePrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModulePrincipal.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
  if (E is EMSSQLNativeException) and (Pos('FK_CLI_CIU', E.Message) > 0) then
  begin
    ShowMessage('La ciudad no existe');
  end
  else
  begin
    ShowMessage(E.Message);
  end;
end;

procedure TDataModulePrincipal.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Open;
  FDTableCiudad.Open;
  FDTableCliente.Open;
end;

end.
