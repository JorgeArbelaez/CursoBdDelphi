unit FCiudades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin;

type
  TFormCiudades = class(TForm)
    ToolBar: TToolBar;
    PageControl: TPageControl;
    DBNavigator: TDBNavigator;
    TabSheetDetalles: TTabSheet;
    TabSheetRejilla: TTabSheet;
    LabelCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    DataSourceCiudad: TDataSource;
    LabelNombre: TLabel;
    DBEditNombre: TDBEdit;
    DBGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
