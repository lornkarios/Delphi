object fTovar: TfTovar
  Left = 211
  Top = 185
  Width = 1044
  Height = 539
  Caption = #1058#1086#1074#1072#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1028
    Height = 480
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 40
    object miAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = miAddClick
    end
    object miDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = miDeleteClick
    end
    object miClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = miCloseClick
    end
  end
  object DataSource1: TDataSource
    Left = 152
    Top = 72
  end
end
