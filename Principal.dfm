object FLogin: TFLogin
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Login'
  ClientHeight = 244
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 498
    Height = 244
    Align = alClient
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 457
    ExplicitHeight = 211
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 22
      Caption = 'Usu'#225'rio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 59
      Height = 22
      Caption = 'Senha:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object pass: TEdit
      Left = 24
      Top = 93
      Width = 241
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
    end
    object bOK: TButton
      Left = 190
      Top = 160
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = bOKClick
    end
    object Resp: TMemo
      Left = 0
      Top = 213
      Width = 97
      Height = 172
      TabOrder = 2
      Visible = False
    end
    object user: TComboBox
      Left = 24
      Top = 37
      Width = 241
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 168
      Top = 128
      Width = 97
      Height = 17
      Caption = 'Lembrar senha'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object BCancelar: TButton
      Left = 62
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = BCancelarClick
    end
  end
  object RESTClient1: TRESTClient
    Params = <>
    Left = 448
    Top = 24
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 448
    Top = 72
  end
  object RESTResponse1: TRESTResponse
    Left = 448
    Top = 128
  end
end
