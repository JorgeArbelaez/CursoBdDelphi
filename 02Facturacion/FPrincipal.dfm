object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Facturaci'#243'n'
  ClientHeight = 352
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 240
    Top = 80
    object MenuItemArchivo: TMenuItem
      Caption = '&Archivo'
      object MenuItemSalir: TMenuItem
        Caption = '&Salir'
        OnClick = MenuItemSalirClick
      end
    end
    object MenuItemMaestros: TMenuItem
      Caption = '&Maestros'
      object MenuItemClientes: TMenuItem
        Caption = '&Clientes'
        OnClick = MenuItemClientesClick
      end
      object MenuItemCiudades: TMenuItem
        Caption = 'Ciu&dades'
        OnClick = MenuItemCiudadesClick
      end
    end
    object MenuItemFacturas: TMenuItem
      Caption = 'Facturas'
      OnClick = MenuItemFacturasClick
      object MenuItemCrear: TMenuItem
        Caption = 'Crear'
        OnClick = MenuItemCrearClick
      end
      object MenuItemConsultar: TMenuItem
        Caption = 'Consultar'
      end
      object MenuItemSeparadorFactura: TMenuItem
        Caption = '-'
      end
    end
  end
end
