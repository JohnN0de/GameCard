object FormHelloKey: TFormHelloKey
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1040#1082#1090#1080#1074#1072#1094#1080#1103
  ClientHeight = 282
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 493
    Height = 282
    TabStop = False
    Align = alClient
    Alignment = taCenter
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Symbol'
    Font.Style = []
    Lines.Strings = (
      #1050' '#1042#1072#1096#1077#1084#1091' '#1089#1074#1077#1076#1077#1085#1100#1102', '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1076#1072#1082#1090#1086#1088' '
      #1088#1072#1089#1087#1088#1086#1089#1090#1088#1072#1085#1103#1077#1090#1089#1103' '#1085#1077' '#1079#1072' '#1073#1077#1089#1087#1083#1072#1090#1085#1086'.'
      #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1072#1084' '#1090#1086#1078#1077' '#1085#1091#1078#1085#1086' '#1078#1080#1090#1100' '#1080' '#1089#1074#1086#1105' '#1074#1088#1077#1084#1103' '#1079#1072' '#1073#1077#1089#1087#1083#1072#1090#1085#1086' '
      #1086#1085#1080' '#1090#1088#1072#1090#1080#1090#1100' '#1085#1077' '#1089#1086#1073#1080#1088#1072#1102#1090#1089#1103'.'
      #1042#1072#1084' '#1074#1099#1076#1072#1085' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1089#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088'. '#1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '
      #1089#1082#1086#1087#1080#1088#1091#1081#1090#1077' '#1077#1075#1086' '#1080' '#1087#1088#1080#1086#1073#1088#1077#1090#1080#1090#1077' '#1082#1083#1102#1095' '#1091' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1086#1074' '#1087#1086' '#1101#1090#1086#1084#1091' '
      #1089#1077#1088#1080#1081#1085#1086#1084#1091' '
      #1085#1086#1084#1077#1088#1091':')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    WantTabs = True
    Zoom = 100
  end
  object Edit1: TEdit
    Left = 8
    Top = 160
    Width = 478
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 201
    Width = 478
    Height = 30
    Caption = #1055#1088#1080#1086#1073#1088#1077#1089#1090#1080' '#1082#1083#1102#1095' '#1091' '#1064#1072#1088#1080#1092#1076#1078#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Sylfaen'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 139
    Top = 237
    Width = 346
    Height = 28
    Caption = #1042#1074#1077#1089#1090#1080' '#1082#1083#1102#1095
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Sylfaen'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 237
    Width = 125
    Height = 28
    Caption = #1044#1077#1084#1086'-'#1088#1077#1078#1080#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Sylfaen'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button4Click
  end
end
