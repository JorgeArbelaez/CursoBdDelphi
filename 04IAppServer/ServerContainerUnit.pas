unit ServerContainerUnit;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSHTTPCommon, Datasnap.DSHTTP,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth;

type
  TServerContainer = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    DSHTTPService: TDSHTTPService;
    DSServerClass: TDSServerClass;
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
  end;

procedure RunDSServer;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  ServerConst,
  ServerMethodsUnit;

procedure TServerContainer.DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerMethods;
end;

function BindPort(Aport: Integer): Boolean;
var
  LTestServer: IIPTestServer;
begin
  Result := True;
  try
    LTestServer := PeerFactory.CreatePeer('', IIPTestServer) as IIPTestServer;
    LTestServer.TestOpenPort(APort, nil);
  except
    Result := False;
  end;
end;

function CheckPort(Aport: Integer): Integer;
begin
  if BindPort(Aport) then
    Result := Aport
  else
    Result := 0;
end;

procedure SetPort(const Aserver: TServerContainer; const APort: string; AProtocol: DSProtocol);
var
  IsPortSet: Boolean;
begin
  IsPortSet := True;
  if not (AServer.DSServer.Started) then
  begin
    if CheckPort(APort.ToInteger) > 0 then
    begin
      case AProtocol of
        DSProtocol.TCPIP: AServer.DSTCPServerTransport.Port := APort.ToInteger;
        DSProtocol.HTTP: AServer.DSHTTPService.HttpPort := APort.ToInteger;
          
      else
        IsPortSet := False
      end;
      if IsPortSet then
        Writeln(Format(sPortSet, [APort]))
      else
        Writeln(Format(sPortNotSet, [APort]));
    end
    else
      Writeln(Format(sPortInUse, [Aport]));
  end
  else
    Writeln(sServerRunning);
  Write(cArrow);
end;

procedure StartServer(const AServer: TServerContainer);
var
  LStart: Boolean;
begin
  LStart := True;
  if not (AServer.DSServer.Started) then
  begin
    if CheckPort(AServer.DSTCPServerTransport.Port) <= 0 then
    begin
      Writeln(Format(sPortInUse, [AServer.DSTCPServerTransport.Port.ToString]));
      LStart := False;
    end;
    if CheckPort(AServer.DSHTTPService.HttpPort) <= 0 then
    begin
      Writeln(Format(sPortInUse, [AServer.DSHTTPService.HttpPort.ToString]));
      LStart := False;
    end;
  end
  else
    Writeln(sServerRunning);

  if LStart then
  begin
    Writeln(sStartingServer);
    AServer.DSServer.Start;
  end;
  Write(cArrow);
end;

procedure StopServer(const AServer: TServerContainer);
begin
  if AServer.DSServer.Started  then
  begin
    Writeln(sStoppingServer);
    AServer.DSServer.Stop;
    Writeln(sServerStopped);
  end
  else
    Writeln(sServerNotRunning);
  Write(cArrow);
end;

procedure  WriteCommands;
begin
  Writeln(sCommands);
  Write(cArrow);
end;

procedure  WriteStatus(const AServer: TServerContainer);
begin
  Writeln(sActive + AServer.DSServer.Started.ToString(TUseBoolStrs.True));
  Writeln(sTCPIPPort + AServer.DSTCPServerTransport.Port.ToString);
  Writeln(sHTTPPort + AServer.DSHTTPService.HttpPort.ToString);

  Write(cArrow);
end;

procedure RunDSServer;
var
  LModule: TServerContainer;
  LResponse: string;
begin
  LModule := TServerContainer.Create(nil);
    try
      if LModule.DSServer.Started then
        Writeln(sServerIsRunning);
      WriteCommands;
      while True do
      begin
        Readln(LResponse);
        LResponse := LowerCase(LResponse);
        if sametext(LResponse, cCommandStart) then
          StartServer(LModule)
        else if sametext(LResponse, cCommandStatus) then
          WriteStatus(LModule)
        else if sametext(LResponse, cCommandStop) then
          StopServer(LModule)
        else if LResponse.StartsWith(cCommandSetTCPIPPort) then
          SetPort(LModule, LResponse.Replace(cCommandSetTCPIPPort, '').Trim, DSProtocol.TCPIP)
        else if LResponse.StartsWith(cCommandSetHTTPPort) then
          SetPort(LModule, LResponse.Replace(cCommandSetHTTPPort, '').Trim, DSProtocol.HTTP)
        else if sametext(LResponse, cCommandHelp) then
          WriteCommands
        else if sametext(LResponse, cCommandExit) then
          if LModule.DSServer.Started then
          begin
            StopServer(LModule);
            break
          end
          else
            break
        else
        begin
          Writeln(sInvalidCommand);
          Write(cArrow);
        end;
      end;
  finally 
    LModule.Free;
  end;
end;

end.

