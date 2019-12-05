unit FClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ToolWin, Vcl.ComCtrls;

type
  TFormClientes = class(TForm)
    LabelCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    DataSourceCliente: TDataSource;
    LabelNombre: TLabel;
    DBEditNombre: TDBEdit;
    LabelDireccion: TLabel;
    DBEditDireccion: TDBEdit;
    LabelTelefono: TLabel;
    DBEditTelefono: TDBEdit;
    LabelFoto: TLabel;
    DBImageFoto: TDBImage;
    ToolBar: TToolBar;
    DBNavigator: TDBNavigator;
    LabelCiuda: TLabel;
    DBEditCiudad: TDBEdit;
    DBLookupComboBoxCiudad: TDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

end.
