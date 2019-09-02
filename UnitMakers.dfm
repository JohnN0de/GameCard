object FormMakers: TFormMakers
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082'!!'
  ClientHeight = 173
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 447
    Height = 173
    ParentCustomHint = False
    TabStop = False
    Align = alClient
    Alignment = taCenter
    Color = clWhite
    Ctl3D = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Sitka Text'
    Font.Style = []
    Lines.Strings = (
      #1057#1090#1091#1076#1077#1085#1090' '#1075#1088#1091#1087#1087#1099' '#1048'-4-16:'
      #4314'('#3232#30410#3232#4314') '
      #1048#1089#1084#1086#1080#1083#1086#1074' '#1064#1072#1088#1080#1092#1076#1078#1086#1085
      #65340'('#9661#65507' \ ('#65507#9661#65507') / '#65507#9661')'#65295
      '')
    ParentCtl3D = False
    ParentFont = False
    PlainText = True
    ReadOnly = True
    TabOrder = 0
    WantReturns = False
    Zoom = 100
    ExplicitHeight = 204
  end
  object Button2: TButton
    Left = 8
    Top = 144
    Width = 435
    Height = 25
    Caption = #1057#1074#1103#1079#1072#1090#1100#1089#1103' '#1089' '#1064#1072#1088#1080#1092#1076#1078#1086#1085#1086#1084
    TabOrder = 1
    OnClick = Button2Click
  end
end
