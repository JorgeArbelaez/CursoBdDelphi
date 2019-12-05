// Ejemplo de uso de TClientDataset
unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormPrincipal = class(TForm)
    ClientDataSetAmigos: TClientDataSet;
    ToolBar: TToolBar;
    PageControl: TPageControl;
    TabSheetDetalles: TTabSheet;
    TabSheetRejilla: TTabSheet;
    ClientDataSetAmigosNombre: TStringField;
    ClientDataSetAmigosTelefono: TStringField;
    ClientDataSetAmigosEdad: TIntegerField;
    LabelNombre: TLabel;
    DBEditNombre: TDBEdit;
    DataSourceAmigos: TDataSource;
    LabelTelefono: TLabel;
    DBEditTelefono: TDBEdit;
    LabelEdad: TLabel;
    DBEditEdad: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSetAmigosEdadValidate(Sender: TField);
    procedure ClientDataSetAmigosBeforeDelete(DataSet: TDataSet);
    procedure ClientDataSetAmigosAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

const
  NombreArchivo = 'Amigos.dat';

implementation

{$R *.dfm}

procedure TFormPrincipal.ClientDataSetAmigosAfterPost(DataSet: TDataSet);
begin
  ClientDataSetAmigos.SaveToFile(NombreArchivo, dfXML);
end;

procedure TFormPrincipal.ClientDataSetAmigosBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFormPrincipal.ClientDataSetAmigosEdadValidate(Sender: TField);
begin
  if ClientDataSetAmigosEdad.Value > 100 then
  begin
    raise Exception.Create('La edad debe ser máximo 100');
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  try
    ClientDataSetAmigos.LoadFromFile(NombreArchivo);
  except
    ClientDataSetAmigos.CreateDataSet;
  end;
end;

end.
