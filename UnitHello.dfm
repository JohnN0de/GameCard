object FormHello: TFormHello
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1047#1076#1088#1072#1074#1089#1090#1074#1091#1081#1090#1077'!'
  ClientHeight = 136
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 392
    Height = 136
    Align = alClient
    Alignment = taCenter
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Symbol'
    Font.Style = []
    Lines.Strings = (
      #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1074#1074#1077#1076#1080#1090#1077' '#1089#1074#1086#1081' '#1082#1083#1102#1095'.'
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    WantTabs = True
    Zoom = 100
  end
  object Edit1: TEdit
    Left = 8
    Top = 56
    Width = 379
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Sylfaen'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 92
    Width = 379
    Height = 37
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Sitka Text'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
end
