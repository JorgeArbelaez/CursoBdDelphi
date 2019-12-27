unit ModuleCiudad;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.StorageJSON, FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type

  [ResourceName('Ciudad')]
  TCiudadResource = class(TDataModule)
    FDConnection: TFDConnection;
    FDQueryCiudades: TFDQuery;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDQueryCiudad: TFDQuery;
    FDQueryCiudadID_CIUDAD: TIntegerField;
    FDQueryCiudadNOMBRE_CIUDAD: TStringField;
    FDQueryCiudadesID_CIUDAD: TIntegerField;
    FDQueryCiudadesNOMBRE_CIUDAD: TStringField;
  published

    [EndPointRequestSummary('Ejemplo', 'Listar',
      'Recupera la lista de ciudades', 'application/json', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Get(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Ejemplo', 'Consultar',
      'Recupera una ciudad a partir del código', 'application/json', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item',
      'Código de la ciudad', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PostItem', 'Creates new item', '',
      'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body',
      'A new item content', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(409, 'Item Exist', TAPIDoc.TPrimitiveType.spNull,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Post(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PutItem',
      'Updates item with specified ID', '', 'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item',
      'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body',
      'A item changes', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure PutItem(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'DeleteItem',
      'Deletes item with specified ID', '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item',
      'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull,
      TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure DeleteItem(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  private
    function JsonCiudad(FDQuery: TFDQuery): TJSONObject; overload;
    function JsonCiudad(IdCiudad: String): TJSONObject; overload;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

procedure TCiudadResource.Get(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  JsonArray: TJSONArray;
begin
  try
    GetItem(AContext, ARequest, AResponse);
  except
    JsonArray:= TJSONArray.Create;
    FDQueryCiudades.Close;
    FDQueryCiudades.Open;
    while not FDQueryCiudades.Eof do
    begin
      JsonArray.Add(JsonCiudad(FDQueryCiudades));
      FDQueryCiudades.Next;
    end;
    AResponse.Body.SetValue(JsonArray, True);
  end;
end;

procedure TCiudadResource.GetItem(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LCodigo: string;
  JSonObject: TJSONObject;
begin
  LCodigo := ARequest.Params.Values['item'];
  JSonObject:= JsonCiudad(LCodigo);
  AResponse.Body.SetValue(JSonObject, true)
end;

function TCiudadResource.JsonCiudad(IdCiudad: String): TJSONObject;
begin
  FDQueryCiudad.Close;
  FDQueryCiudad.ParamByName('id_ciudad').AsString := IdCiudad;
  FDQueryCiudad.Open;
  Result:= JsonCiudad(FDQueryCiudad);
end;

function TCiudadResource.JsonCiudad(FDQuery: TFDQuery): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('Codigo', FDQuery.FieldByName('id_ciudad').AsString);
  Result.AddPair('Nombre', FDQuery.FieldByName('nombre_ciudad').AsString);
end;

procedure TCiudadResource.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
end;

procedure TCiudadResource.PutItem(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LCodigo: string;
begin
  LCodigo := ARequest.Params.Values['item'];
end;

procedure TCiudadResource.DeleteItem(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LCodigo: string;
begin
  LCodigo := ARequest.Params.Values['item'];
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TCiudadResource));
end;

initialization

Register;

end.
