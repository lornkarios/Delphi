object fmNewClient: TfmNewClient
  Left = 192
  Top = 125
  Width = 399
  Height = 246
  Caption = #1044#1072#1085#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 64
    Top = 56
    Width = 22
    Height = 13
    Caption = #1048#1084#1103
  end
  object lbAdress: TLabel
    Left = 64
    Top = 96
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object edName: TEdit
    Left = 192
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edName'
    OnChange = edNameChange
  end
  object edAdress: TEdit
    Left = 192
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edAdress'
    OnChange = edNameChange
  end
  object btnOK: TBitBtn
    Left = 240
    Top = 168
    Width = 121
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
    TabOrder = 2
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 80
    Top = 168
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
end
