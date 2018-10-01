program DelphiValNrDocs;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
