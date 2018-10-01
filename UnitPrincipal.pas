unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
  private
    function GetNrDoc: String;
    procedure SetNrDoc(const Value: String);
  public
    property NrDoc: String read GetNrDoc write SetNrDoc;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

{ TFormPrincipal }

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  NrDoc := EmptyStr;
end;

function TFormPrincipal.GetNrDoc: String;
begin
  Result := Edit1.Text;
end;

procedure TFormPrincipal.SetNrDoc(const Value: String);
begin
  Edit1.Text := Value;
end;

end.
