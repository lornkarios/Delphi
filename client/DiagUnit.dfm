object fmDiag: TfmDiag
  Left = 176
  Top = 506
  Width = 1188
  Height = 597
  Caption = #1056#1080#1089#1086#1074#1072#1085#1080#1077' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 328
    Width = 10
    Height = 13
    Caption = 'C:'
  end
  object Label2: TLabel
    Left = 152
    Top = 352
    Width = 17
    Height = 13
    Caption = #1055#1086':'
  end
  object Image1: TImage
    Left = 424
    Top = -8
    Width = 561
    Height = 529
  end
  object Image2: TImage
    Left = 984
    Top = -8
    Width = 177
    Height = 529
  end
  object Label3: TLabel
    Left = 632
    Top = 536
    Width = 225
    Height = 13
    Caption = #1057#1083#1077#1074#1072' '#1079#1072#1082#1086#1085#1090#1088#1072#1082#1090#1086#1074#1072#1085#1085#1086'/'#1089#1087#1088#1072#1074#1072' '#1086#1090#1075#1088#1091#1078#1077#1085#1086
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 409
    Height = 273
    DataSource = dsTovar
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnClear: TButton
    Left = 16
    Top = 288
    Width = 113
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    Enabled = False
    TabOrder = 1
    OnClick = btnClearClick
  end
  object btnAdd: TButton
    Left = 240
    Top = 288
    Width = 129
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
    Enabled = False
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnDiag: TButton
    Left = 240
    Top = 376
    Width = 129
    Height = 25
    Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
    Enabled = False
    TabOrder = 3
    OnClick = btnDiagClick
  end
  object lbDiag1: TListBox
    Left = 160
    Top = 408
    Width = 129
    Height = 129
    ItemHeight = 13
    TabOrder = 4
  end
  object lbDiag2: TListBox
    Left = 296
    Top = 408
    Width = 113
    Height = 129
    ItemHeight = 13
    TabOrder = 5
  end
  object dtpBegin: TDateTimePicker
    Left = 200
    Top = 320
    Width = 186
    Height = 21
    Date = 43254.608632037040000000
    Time = 43254.608632037040000000
    TabOrder = 6
  end
  object dtpEnd: TDateTimePicker
    Left = 200
    Top = 352
    Width = 186
    Height = 21
    Date = 43254.608706111110000000
    Time = 43254.608706111110000000
    TabOrder = 7
  end
  object lbDiag3: TListBox
    Left = 152
    Top = 432
    Width = 145
    Height = 49
    ItemHeight = 13
    TabOrder = 8
    Visible = False
  end
  object lbDiag5: TListBox
    Left = 16
    Top = 408
    Width = 137
    Height = 129
    ItemHeight = 13
    TabOrder = 9
  end
  object dsTovar: TDataSource
    OnDataChange = dsTovarDataChange
    Left = 128
    Top = 320
  end
end
