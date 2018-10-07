program DelphiValNrDocs;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitDocAbstrato in 'UnitDocAbstrato.pas',
  UnitDocCpf in 'UnitDocCpf.pas',
  UnitDocCnpj in 'UnitDocCnpj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
