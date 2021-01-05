program LoginToken;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFLogin, FLogin);
  Application.Run;
end.
