unit FormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Grids;

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
    MonthCalendar1: TMonthCalendar;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.free;         //usado somente se estiver dentro de uma form ou datamodule
  application.free;  //se o objeto application estiver disponível;
  exitprocess(0);    //por último, pra finalizar.

end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  Pags.ActivePageIndex:=0;
end;

procedure TFPrincipal.Image12Click(Sender: TObject);
begin
  PagMusicos.ActivePageIndex:=1;
end;

procedure TFPrincipal.Image13Click(Sender: TObject);
begin
  PagMusicos.ActivePageIndex:=0;
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

end.
