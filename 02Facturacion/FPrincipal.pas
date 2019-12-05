unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    MainMenu: TMainMenu;
    MenuItemArchivo: TMenuItem;
    MenuItemSalir: TMenuItem;
    MenuItemMaestros: TMenuItem;
    MenuItemClientes: TMenuItem;
    MenuItemCiudades: TMenuItem;
    MenuItemFacturas: TMenuItem;
    MenuItemCrear: TMenuItem;
    MenuItemConsultar: TMenuItem;
    MenuItemSeparadorFactura: TMenuItem;
    procedure MenuItemSalirClick(Sender: TObject);
    procedure MenuItemClientesClick(Sender: TObject);
    procedure MenuItemCiudadesClick(Sender: TObject);
    procedure MenuItemCrearClick(Sender: TObject);
    procedure MenuItemFacturasClick(Sender: TObject);
  private
    { Private declarations }
    procedure MenuItemMostrarFactura(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses
  FClientes, FCiudades, FFactura;

procedure TFormPrincipal.MenuItemCiudadesClick(Sender: TObject);
var
  FormCiudades: TFormCiudades;
begin
  FormCiudades := TFormCiudades.Create(Self);
  try
    FormCiudades.ShowModal;
  finally
    FormCiudades.Free;
  end;
end;

procedure TFormPrincipal.MenuItemClientesClick(Sender: TObject);
var
  FormClientes: TFormClientes;
begin
  FormClientes := TFormClientes.Create(Self);
  try
    FormClientes.ShowModal;
  finally
    FormClientes.Free;
  end;
end;

procedure TFormPrincipal.MenuItemCrearClick(Sender: TObject);
var
  FormFactura: TFormFactura;
begin
  FormFactura:= TFormFactura.Create(Self);
  FormFactura.CrearNueva;
  FormFactura.Show;
end;

procedure TFormPrincipal.MenuItemFacturasClick(Sender: TObject);
var
  I: Integer;
  Form: TForm;
  MenuItem: TMenuItem;
begin
  for I := 3 to MenuItemFacturas.Count - 1 do
  begin
    MenuItemFacturas.Items[3].Free;
  end;
  for I := 0 to Screen.FormCount - 1 do
  begin
    Form:= Screen.Forms[I];
    if Form is TFormFactura then
    begin
      MenuItem:= TMenuItem.Create(Self);
      MenuItem.Caption:= Form.Caption;
      MenuItem.OnClick:= MenuItemMostrarFactura;
      MenuItemFacturas.Add(MenuItem);
    end;
  end;
end;

procedure TFormPrincipal.MenuItemMostrarFactura(Sender: TObject);
var
  MenuItem: TMenuItem;
  Titulo: String;
  I: Integer;
  Form: TForm;
begin
  MenuItem:= Sender as TMenuItem;
  Titulo:= MenuItem.Caption;
  Titulo:= Titulo.Replace('&', '');
  for I := 0 to Screen.FormCount - 1 do
  begin
    Form:= Screen.Forms[I];
    if Form.Caption = Titulo then
    begin
      Form.BringToFront;
      Break;
    end;
  end;
end;

procedure TFormPrincipal.MenuItemSalirClick(Sender: TObject);
begin
  Close;
end;

end.
