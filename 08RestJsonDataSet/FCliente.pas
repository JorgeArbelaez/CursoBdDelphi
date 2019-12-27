unit FCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FMX.ListView, FMX.StdCtrls, FMX.Controls.Presentation, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.FireDACJSONReflect, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON;

type
  TFormCliente = class(TForm)
    FDMemTable: TFDMemTable;
    ToolBar: TToolBar;
    ButtonConsultar: TButton;
    ListViewCiudades: TListView;
    FDMemTableID_CIUDAD: TIntegerField;
    FDMemTableNOMBRE_CIUDAD: TStringField;
    BindingsList: TBindingsList;
    BindSourceDB: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDStanStorageBinLink: TFDStanStorageBinLink;
    procedure ButtonConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCliente: TFormCliente;

implementation

{$R *.fmx}

uses ClientModuleUnit;

procedure TFormCliente.ButtonConsultarClick(Sender: TObject);
var
  Datos: TFDJsonDataSets;
begin
  Datos:= ClientModule.ServerMethodsClient.ConsultarCiudades;
  FDMemTable.Close;
  FDMemTable.AppendData(TFDJSONDataSetsReader.GetListValue(Datos, 0));
  FDMemTable.Open;
end;

end.
