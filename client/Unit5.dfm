object fmDogovor: TfmDogovor
  Left = 644
  Top = 228
  Width = 615
  Height = 217
  Caption = #1044#1086#1075#1086#1074#1086#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDate: TLabel
    Left = 72
    Top = 48
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object dtpDate: TDateTimePicker
    Left = 112
    Top = 48
    Width = 186
    Height = 21
    Date = 43252.849661458330000000
    Time = 43252.849661458330000000
    TabOrder = 0
  end
  object rbNal: TRadioButton
    Left = 360
    Top = 40
    Width = 113
    Height = 17
    Caption = #1053#1072#1083#1080#1095#1085#1099#1077
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object rbBeznal: TRadioButton
    Left = 360
    Top = 72
    Width = 113
    Height = 17
    Caption = #1041#1077#1079#1085#1072#1083#1080#1095#1085#1099#1081
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 360
    Top = 128
    Width = 129
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
    TabOrder = 3
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 96
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    Kind = bkCancel
  end
end
