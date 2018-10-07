unit UnitDocCnpj;

interface

uses
  UnitDocAbstrato;

type
  TDocumentoCnpj = class(TDocumentoAbstrato)
  private
  protected
  public
    procedure CalcularDigitoVerificador; override;
    procedure SetNumero(const Value: String); override;
  end;

implementation

uses
  SysUtils;

{ TDocumentoCnpj }

procedure TDocumentoCnpj.SetNumero(const Value: String);
begin
  inherited;
  SetTamanho(14);
  SetTamanhoDV(2);
  DoParseDV;
end;

procedure TDocumentoCnpj.CalcularDigitoVerificador;
var
  S: String;
  Soma, Digito1, Digito2: Integer;
begin
  inherited;
  if PodeCalcularDigitoVerificador then
  begin
    S := GetNumero;

    // Round 1
    Soma := 5 * StrToInt(Copy(S, 1, 1)) +
            4 * StrToInt(Copy(S, 2, 1)) +
            3 * StrToInt(Copy(S, 3, 1)) +
            2 * StrToInt(Copy(S, 4, 1)) +
            9 * StrToInt(Copy(S, 5, 1)) +
            8 * StrToInt(Copy(S, 6, 1)) +
            7 * StrToInt(Copy(S, 7, 1)) +
            6 * StrToInt(Copy(S, 8, 1)) +
            5 * StrToInt(Copy(S, 9, 1)) +
            4 * StrToInt(Copy(S, 10, 1)) +
            3 * StrToInt(Copy(S, 11, 1)) +
            2 * StrToInt(Copy(S, 12, 1));

    Digito1 := CalcularModulo11(Soma);

    // Round 2
    Soma := 6 * StrToInt(Copy(S, 1, 1)) +
            5 * StrToInt(Copy(S, 2, 1)) +
            4 * StrToInt(Copy(S, 3, 1)) +
            3 * StrToInt(Copy(S, 4, 1)) +
            2 * StrToInt(Copy(S, 5, 1)) +
            9 * StrToInt(Copy(S, 6, 1)) +
            8 * StrToInt(Copy(S, 7, 1)) +
            7 * StrToInt(Copy(S, 8, 1)) +
            6 * StrToInt(Copy(S, 9, 1)) +
            5 * StrToInt(Copy(S, 10, 1)) +
            4 * StrToInt(Copy(S, 11, 1)) +
            3 * StrToInt(Copy(S, 12, 1)) +
            2 * Digito1;

    Digito2 := CalcularModulo11(Soma);

    // Resultado
    SetDV_Calc(IntToStr(Digito1) + IntToStr(Digito2));
  end;
end;

end.
