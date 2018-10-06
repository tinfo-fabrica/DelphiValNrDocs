unit UnitDocAbstrato;

interface

type
  TDocumentoAbstrato = class
  private
    FNumero: String;
    FDV: String;
    FDV_Calc: String;
    FTamanho: Integer;
    FTamanhoDV: Integer;
    function EstaEmBranco: Boolean;
    function EstaFaltandoDigitos: Boolean;
    function EstaSobrandoDigitos: Boolean;
    function GetDigitoVerificadorEhValido: Boolean;
  protected
    procedure SetTamanho(const Value: Integer);
    procedure SetTamanhoDV(const Value: Integer);
    procedure SetDV(const Value: String);
    procedure SetDV_Calc(const Value: String);
    procedure DoParseDV;
    function PodeCalcularDigitoVerificador: Boolean;
    function CalcularModulo11(const Value: Integer): Integer;
  public
    procedure SetNumero(const Value: String); virtual;
    function GetNumero: String;
    procedure CalcularDigitoVerificador; virtual; abstract;
    function DigitoVerificadorEhValido: Boolean;
  end;

implementation

uses
  SysUtils;

{ TDocumentoAbstrato }

function TDocumentoAbstrato.CalcularModulo11(const Value: Integer): Integer;
var
  Resto, Valor: Byte;
begin
  Valor := 0;
  Resto := Value mod 11;

  if (Resto = 0) or (Resto = 1) then
    Valor := 0
  else
    Valor :=  11 - Resto;

  Result := Valor;
end;

function TDocumentoAbstrato.DigitoVerificadorEhValido: Boolean;
begin
  Result := GetDigitoVerificadorEhValido;
end;

procedure TDocumentoAbstrato.DoParseDV;
begin
  FDV := EmptyStr;

  if FTamanhoDV >= 4 then
    FDV := FDV + copy(FNumero, FTamanho - 3, 1);

  if FTamanhoDV >= 3 then
    FDV := FDV + copy(FNumero, FTamanho - 2, 1);

  if FTamanhoDV >= 2 then
    FDV := FDV + copy(FNumero, FTamanho - 1, 1);

  if FTamanhoDV >= 1 then
    FDV := FDV + copy(FNumero, FTamanho, 1);
end;

function TDocumentoAbstrato.EstaEmBranco: Boolean;
begin
  Result := (FNumero = EmptyStr);
end;

function TDocumentoAbstrato.EstaFaltandoDigitos: Boolean;
begin
  Result := Length(FNumero) < FTamanho;
end;

function TDocumentoAbstrato.EstaSobrandoDigitos: Boolean;
begin
  Result := Length(FNumero) > FTamanho;
end;

function TDocumentoAbstrato.GetDigitoVerificadorEhValido: Boolean;
begin
  Result := (FDV = FDV_Calc);
end;

function TDocumentoAbstrato.GetNumero: String;
begin
  Result := FNumero;
end;

function TDocumentoAbstrato.PodeCalcularDigitoVerificador: Boolean;
begin
  if EstaEmBranco or EstaFaltandoDigitos or EstaSobrandoDigitos then
    Result := False
  else
    Result := True;
end;

procedure TDocumentoAbstrato.SetDV(const Value: String);
begin
  FDV := Value;
end;

procedure TDocumentoAbstrato.SetDV_Calc(const Value: String);
begin
  FDV_Calc := Value;
end;

procedure TDocumentoAbstrato.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TDocumentoAbstrato.SetTamanho(const Value: Integer);
begin
  FTamanho := Value;
end;

procedure TDocumentoAbstrato.SetTamanhoDV(const Value: Integer);
begin
  FTamanhoDV := Value;
end;

end.
