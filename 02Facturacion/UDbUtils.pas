unit UDbUtils;

interface

uses
  Data.DB;

type
  TDbUtils = class
  public
    class procedure CopiarFila(DatasetFuente, DatasetDestino: TDataSet);
    class procedure CopiarDataSet(DatasetFuente, DatasetDestino: TDataSet);
  end;

implementation

{ TDbUtils }

// Este procedimiento copia el registro actual del dataset fuente a un nuevo
// registro en el dataset destino.
// El procedimento asume que los dos datasets tienen la misma estructura.
class procedure TDbUtils.CopiarDataSet(DatasetFuente, DatasetDestino: TDataSet);
begin

end;

class procedure TDbUtils.CopiarFila(DatasetFuente, DatasetDestino: TDataSet);
var
  I: Integer;
  NumCampos: Integer;
begin
  NumCampos := DatasetFuente.FieldCount;
  DatasetDestino.Insert;
  try
    for I := 0 to NumCampos - 1 do
    begin
      DatasetDestino.Fields[I].Value := DatasetFuente.Fields[I].Value;
    end;
    DatasetDestino.Post;
  except
    DatasetDestino.Cancel;
    raise;
  end;
end;

end.
