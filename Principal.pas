unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client, System.JSON, IdHTTP, IWSystem ,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pass: TEdit;
    bOK: TButton;
    Resp: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    user: TComboBox;
    CheckBox1: TCheckBox;
    BCancelar: TButton;
    procedure bOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
  Caminho: string;

implementation

{$R *.dfm}

function Login(login: string; pass: string): string;
var
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse : TRESTResponse;
  strImageJSON : string;

  jsob, jsonob: TJSONObject;
  JSValue: TJSONValue;
  JSONArray: TJSONArray;
  JSONArray1: TJSONArray;
  jPar: TJSONPair;

  i: integer;

  IdHTTP: TIdHTTP;
  Url: String;

begin
 // Requisita via Echo o dominio da API via PHP
  IdHTTP := TIdHTTP.Create(nil);
  url:=IdHTTP.Get('https://webcontrolempresas.com.br/webcontrol/urlApi.php');

  try
    // Metodo REST para consumir dados da API
    RESTClient1 := TRESTClient.Create(url+'/'); //url da API
    RESTRequest1 := TRESTRequest.Create(nil);
    RESTRequest1.Method := TRESTRequestMethod.rmPOST;
    RESTRequest1.Resource := 'api/v1/login';          // Camimho da API
    RESTRequest1.AddParameter('login', trim(login));  // Login
    RESTRequest1.AddParameter('senha', trim(pass));   // Pass
    RESTRequest1.Client := RESTClient1;
    RESTRequest1.Timeout:= 600000;
    RESTRequest1.Execute;
    strImageJSON := RESTRequest1.Response.Content;     // Salva o Retorno da API
  except
    ShowMessage('Erro ao acessar servidor, tente novamente!');
    exit;
  end;
  RESTRequest1.Free;

  // Coleta Dados do JSon
  JSob := TJSONObject.ParseJSONValue(strImageJSON) as TJSONObject;

  // Indica ponteiro para valor 0 (usando nome do Pair)
  JPar:= jSob.Get(0);

  // Pega Valor do Token pela Pair
  JSValue:= jSob.GetValue(jPar.JsonString.Value);

  result:=JSValue.Value;     // Token

end;

procedure TFLogin.BCancelarClick(Sender: TObject);
begin
  Application.Free;
  Application.Terminate;
end;

procedure TFLogin.bOKClick(Sender: TObject);
begin
  Resp.Lines.Clear;
  Resp.Lines.Text:=Login(UpperCase(trim(user.Text)),trim(pass.Text));

  if length(trim(Resp.Text))<20 then ShowMessage('Login Inválido!')
  else
  begin
    Resp.Lines.SaveToFile(Caminho+'\id.bmc');
  end;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  Caminho:=gsAppPath;
end;

end.
