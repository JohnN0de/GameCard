object FormStartHello: TFormStartHello
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormStartHello'
  ClientHeight = 469
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 560
    Top = 80
  end
end
