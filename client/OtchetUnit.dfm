object fmOtchet: TfmOtchet
  Left = 312
  Top = 81
  Width = 569
  Height = 540
  Caption = #1054#1090#1095#1105#1090' '#1074' Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 296
    Top = 280
    Width = 10
    Height = 13
    Caption = 'C:'
  end
  object Label2: TLabel
    Left = 288
    Top = 304
    Width = 17
    Height = 13
    Caption = #1055#1086':'
  end
  object dbgOtchet: TDBGrid
    Left = 0
    Top = 0
    Width = 553
    Height = 241
    Align = alTop
    DataSource = dsOtchet
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnAdd: TButton
    Left = 104
    Top = 264
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnClear: TButton
    Left = 16
    Top = 264
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 2
    OnClick = btnClearClick
  end
  object lbD_T: TListBox
    Left = 16
    Top = 344
    Width = 505
    Height = 121
    ItemHeight = 13
    TabOrder = 3
  end
  object dtpBegin: TDateTimePicker
    Left = 336
    Top = 272
    Width = 186
    Height = 21
    Date = 43254.608632037040000000
    Time = 43254.608632037040000000
    TabOrder = 4
  end
  object dtpEnd: TDateTimePicker
    Left = 336
    Top = 304
    Width = 186
    Height = 21
    Date = 43254.608706111110000000
    Time = 43254.608706111110000000
    TabOrder = 5
  end
  object btnOtchet: TButton
    Left = 80
    Top = 296
    Width = 121
    Height = 41
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 6
    OnClick = btnOtchetClick
  end
  object lbIDTovar: TListBox
    Left = 40
    Top = 376
    Width = 105
    Height = 49
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object lbIDDogovor: TListBox
    Left = 280
    Top = 376
    Width = 105
    Height = 49
    ItemHeight = 13
    TabOrder = 8
    Visible = False
  end
  object lbClientID: TListBox
    Left = 184
    Top = 376
    Width = 81
    Height = 49
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
  object dsOtchet: TDataSource
    OnDataChange = dsOtchetDataChange
    Left = 192
    Top = 248
  end
end
