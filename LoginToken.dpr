program LoginToken;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FLogin},
  FormPrincipal in 'FormPrincipal.pas' {FPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
