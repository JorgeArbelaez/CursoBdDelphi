unit FCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.ToolWin, Vcl.ComCtrls, Datasnap.DBClient, Datasnap.DSConnect;

type
  TFormCliente = class(TForm)
    SQLConnection: TSQLConnection;
    DSProviderConnectionCiudad: TDSProviderConnection;
    ClientDataSetCiudad: TClientDataSet;
    ClientDataSetCiudadID_CIUDAD: TIntegerField;
    ClientDataSetCiudadNOMBRE_CIUDAD: TStringField;
    DataSourceCiudad: TDataSource;
    ToolBar: TToolBar;
    DBNavigator: TDBNavigator;
    DBGrid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSetCiudadAfterPostDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

{$R *.dfm}

procedure TFormCliente.ClientDataSetCiudadAfterPostDelete(DataSet: TDataSet);
begin
  ClientDataSetCiudad.ApplyUpdates(0);
end;

procedure TFormCliente.FormCreate(Sender: TObject);
begin
  ClientDataSetCiudad.Open;
end;

end.
