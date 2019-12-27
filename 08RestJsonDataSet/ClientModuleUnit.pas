unit ClientModuleUnit;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit, Datasnap.DSClientRest;

type
  TClientModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethodsClient: TServerMethodsClient;
    function GetServerMethodsClient: TServerMethodsClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethodsClient: TServerMethodsClient read GetServerMethodsClient write FServerMethodsClient;

end;

var
  ClientModule: TClientModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule.Destroy;
begin
  FServerMethodsClient.Free;
  inherited;
end;

function TClientModule.GetServerMethodsClient: TServerMethodsClient;
begin
  if FServerMethodsClient = nil then
    FServerMethodsClient:= TServerMethodsClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerMethodsClient;
end;

end.
