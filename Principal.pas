unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client, System.JSON, IdHTTP, IWSystem ,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, FormPrincipal, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Samples.Gauges;

type
  TFLogin = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    BCancelar: TButton;
    bOK: TButton;
    Label1: TLabel;
    Label2: TLabel;
    pass: TEdit;
    Resp: TMemo;
    user: TComboBox;
    Image1: TImage;
    ListAux: TListBox;
    Barra: TGauge;
    Tempo: TTimer;
    Status: TLabel;
    procedure bOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure TempoTimer(Sender: TObject);
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
  self.free;         //usado somente se estiver dentro de uma form ou datamodule
  application.free;  //se o objeto application estiver disponível;
  exitprocess(0);    //por último, pra finalizar.
end;

procedure TFLogin.bOKClick(Sender: TObject);
begin
  Status.Caption:='Verificando Login';  
  Status.Visible:=true;
  Status.Repaint;
  
  Resp.Lines.Clear;
  Resp.Lines.Text:=Login(UpperCase(trim(user.Text)),trim(pass.Text));

  if length(trim(Resp.Text))<20 then 
  begin
    ShowMessage('Login Inválido!');
    Status.Visible:=false;
  end
  else 
  begin
    Barra.Visible:=true;
    Barra.Repaint;

    Tempo.Enabled:=true;

    Resp.Lines.SaveToFile(Caminho+'\id.bmc');

    // Salvando Usuarios Utilizados
    user.Items.Add(user.Text);
    ListAUx.Clear;
    ListAux.Items:=user.Items;
    ListAUx.Items.SaveToFile(Caminho+'\idu.bmc');
  end;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  Caminho:=gsAppPath;

  ListAux.Clear;

  if FileExists(Caminho+'\idu.bmc') then
  begin
    ListAUx.Items.LoadFromFile(Caminho+'\idu.bmc');
    user.Clear;
    user.Items:=ListAux.Items;
  end;

  Barra.MaxValue:=4;
  Barra.Progress:=0;
end;

procedure TFLogin.TempoTimer(Sender: TObject);
begin
  case Barra.Progress of
    0:
    begin
      Status.Caption:='Verificando Atualizações do Sistema';
    end;
    1:
    begin
      Status.Caption:='Atualizando Informações dos Músicos';
    end;
    2:
    begin
      Status.Caption:='Atualizando Dados dos Instrumentos';
    end;
    3:
    begin
      Status.Caption:='Atualizando Eventos da Banda';
    end;
    4:
    begin
      Status.Caption:='Concluindo Sincronismo';
      Status.Repaint;

      Tempo.Enabled:=false;
      FormPrincipal.FPrincipal.ShowModal;
      Principal.FLogin.Close;
      Principal.FLogin.Free;
      close;
    end;
  end;

  Status.Repaint;
  Barra.Progress:=Barra.Progress+1;
  Barra.Repaint;
end;

end.
