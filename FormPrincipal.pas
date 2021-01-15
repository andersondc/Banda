unit FormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, DateUtils, StrUtils,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Grids, System.JSON, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.WinXCalendars;

type
  TFPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Pags: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    PagMusicos: TPageControl;
    ListMus: TTabSheet;
    CadMus: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    PagEventos: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    Anotações: TTabSheet;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Label5: TLabel;
    BCancelar: TButton;
    bOK: TButton;
    StringGrid1: TStringGrid;
    Panel7: TPanel;
    Edit5: TEdit;
    Panel8: TPanel;
    Image12: TImage;
    Image13: TImage;
    Label6: TLabel;
    Image11: TImage;
    Image14: TImage;
    TabSheet10: TTabSheet;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    PageControl1: TPageControl;
    TabSheet11: TTabSheet;
    StringGrid2: TStringGrid;
    Panel9: TPanel;
    Label7: TLabel;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Edit6: TEdit;
    TabSheet12: TTabSheet;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel10: TPanel;
    Image23: TImage;
    Image24: TImage;
    Label13: TLabel;
    ComboBox3: TComboBox;
    Label9: TLabel;
    ComboBox4: TComboBox;
    StringGrid3: TStringGrid;
    Panel11: TPanel;
    Image22: TImage;
    Image25: TImage;
    Image26: TImage;
    DateTimePicker1: TDateTimePicker;
    Label10: TLabel;
    Button3: TButton;
    FundoTit1: TImage;
    Tit1: TLabel;
    FundoTit2: TImage;
    Tit2: TLabel;
    FundoTitE: TImage;
    titE: TLabel;
    GroupBox2: TGroupBox;
    ListAux: TListBox;
    ListFer: TComboBox;
    Panel12: TPanel;
    Label11: TLabel;
    LegFer: TLabel;
    Label14: TLabel;
    TitFer: TLabel;
    Label16: TLabel;
    DescFer: TLabel;
    Button7: TButton;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    PAguarde: TPanel;
    Label12: TLabel;
    Status: TLabel;
    CalendarView1: TCalendarView;
    ListAux2: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ListFerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

procedure TFPrincipal.Button7Click(Sender: TObject);
var
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse : TRESTResponse;
  strImageJSON : string;

  i: integer;

  Url: String;

  ini: integer;
  fim: integer;
  auxTexto: string;
begin
  PAguarde.Top:=trunc((Screen.Height/2)-(PAguarde.Height/2));
  PAguarde.Left:=trunc((Screen.Width/2)-(PAguarde.Width/2));
  Status.Caption:='Recuperando Dados da Web...';
  Status.Repaint;
  PAguarde.Visible:=true;
  PAguarde.Repaint;

  url:='dadosbr.github.io/';

  try
    // Metodo REST para consumir dados da API
    RESTClient1 := TRESTClient.Create(url); //url da API
    RESTRequest1 := TRESTRequest.Create(nil);
    RESTRequest1.Method := TRESTRequestMethod.rmGET;
    //rmPOST;
    RESTRequest1.Resource := 'feriados/nacionais.json';          // Camimho da API
    RESTRequest1.Client := RESTClient1;
    RESTRequest1.Timeout:= 600000;
    RESTRequest1.Execute;
    strImageJSON := RESTRequest1.Response.Content;     // Salva o Retorno da API
  finally
    RESTRequest1.Free;
  end;

  ListAux2.Clear;
  ListAux2.Items.Text:=strImageJSON;

  ListAux.Clear;

  for i:=0 to ListAux2.Items.Count-1 do
  begin
    ListAux.Items.Add(trim(ListAux2.Items.Strings[i]));
  end;

  ListAux.ItemIndex:=0;

  for i:=0 to ListAux.Items.Count-1 do
  begin
    if LeftStr(trim(ListAux.Items.Strings[i]),7)='"date":' then
    begin
      if RightStr(trim(ListAux.Items.Strings[i]),3)<>'"",' then
      begin
        auxTexto:=LeftStr(RightStr(trim(ListAux.Items.Strings[i]),7),5);
        ListFer.Items.Add(auxTexto);
      end;
    end;
  end;

  PAguarde.Visible:=false;
  ListFer.SetFocus;

end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.free;         //usado somente se estiver dentro de uma form ou datamodule
  application.free;  //se o objeto application estiver disponível;
  exitprocess(0);    //por último, pra finalizar.
end;

procedure TFPrincipal.FormResize(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to 3 do
  begin
    Tit1.Left:=FundoTit1.Width-Tit1.Width-10;
    Tit1.Top:=2;

    Tit2.Left:=FundoTit1.Width-Tit2.Width-10;
    Tit2.Top:=2;

    TitE.Left:=Panel6.Width-TitE.Width-10;
    TitE.Top:=2;
  end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  Pags.ActivePageIndex:=0;
end;

procedure TFPrincipal.Image11Click(Sender: TObject);
begin
  Pags.ActivePageIndex:=6;
end;

procedure TFPrincipal.Image12Click(Sender: TObject);
begin
  PagMusicos.ActivePageIndex:=1;
end;

procedure TFPrincipal.Image13Click(Sender: TObject);
begin
  PagMusicos.ActivePageIndex:=0;
end;

procedure TFPrincipal.Image14Click(Sender: TObject);
begin
  Pags.ActivePageIndex:=0;
end;

procedure TFPrincipal.Image1Click(Sender: TObject);
begin
  Pags.ActivePageIndex:=1;
end;

procedure TFPrincipal.Image2Click(Sender: TObject);
begin
  Pags.ActivePageIndex:=2;
end;

procedure TFPrincipal.Image3Click(Sender: TObject);
begin
  Pags.ActivePageIndex:=4;
end;

procedure TFPrincipal.Image4Click(Sender: TObject);
begin
  Pags.ActivePageIndex:=3;
end;

procedure TFPrincipal.Image5Click(Sender: TObject);
begin
  Pags.ActivePageIndex:=5;
end;

procedure TFPrincipal.Image6Click(Sender: TObject);
begin
  PagEventos.ActivePageIndex:=0;
end;

procedure TFPrincipal.Image7Click(Sender: TObject);
begin
  PagEventos.ActivePageIndex:=1;
end;

procedure TFPrincipal.Image8Click(Sender: TObject);
begin
  PagEventos.ActivePageIndex:=3;
end;

procedure TFPrincipal.Image9Click(Sender: TObject);
begin
  PagEventos.ActivePageIndex:=2;
end;

procedure TFPrincipal.ListFerClick(Sender: TObject);
var
  indice: integer;
  indiceData: integer;
begin
  indice:=ListFer.ItemIndex;
  indiceData:=ListAux.Items.
  //.IndexOf('"date":"'+trim(ListFer.Items.Strings[indice])+'",');

  ShowMessage(indiceData.ToString);
//  TitFer.Caption:=trim(ListAux.Items.Strings[indiceData+1]);
//  DescFer.Caption:=trim(ListAux.Items.Strings[indiceData+2]);
end;

end.
