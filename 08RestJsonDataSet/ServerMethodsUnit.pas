unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON,
  Data.FireDACJSONReflect;

type
{$METHODINFO ON}
  TServerMethods = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDQueryCiudad: TFDQuery;
    FDQueryCiudadID_CIUDAD: TIntegerField;
    FDQueryCiudadNOMBRE_CIUDAD: TStringField;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDStanStorageBinLink: TFDStanStorageBinLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function ConsultarCiudades: TFDJSONDataSets;
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

function TServerMethods.ConsultarCiudades: TFDJSONDataSets;
begin
  Result:= TFDJSONDataSets.Create;
  FDQueryCiudad.Open;
  try
    TFDJSONDataSetsWriter.ListAdd(Result, FDQueryCiudad);
  finally
    FDQueryCiudad.Close;
  end;
end;

procedure TServerMethods.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Open;
end;

function TServerMethods.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

