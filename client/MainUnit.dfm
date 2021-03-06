object fmMain: TfmMain
  Left = 231
  Top = 466
  Width = 1247
  Height = 542
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDogovor: TPanel
    Left = 0
    Top = 0
    Width = 1231
    Height = 170
    Align = alTop
    TabOrder = 0
    object pnlDogovorModify: TPanel
      Left = 1
      Top = 109
      Width = 1229
      Height = 60
      Align = alBottom
      BevelWidth = 5
      BorderWidth = 5
      TabOrder = 0
      object btnNewDogovor: TButton
        Left = 584
        Top = 24
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
        TabOrder = 0
        OnClick = btnNewDogovorClick
      end
      object btnDeleteDogovor: TButton
        Left = 784
        Top = 24
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
        TabOrder = 1
        OnClick = btnDeleteDogovorClick
      end
    end
    object dbgDogovor: TDBGrid
      Left = 1
      Top = 1
      Width = 1229
      Height = 108
      Align = alClient
      DataSource = dsDogovor
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object pnlD_T: TPanel
    Left = 0
    Top = 170
    Width = 1231
    Height = 313
    Align = alClient
    TabOrder = 1
    object pnlD_TModify: TPanel
      Left = 1
      Top = 212
      Width = 1229
      Height = 100
      Align = alBottom
      BevelOuter = bvLowered
      BevelWidth = 5
      TabOrder = 0
      object lbTovar: TLabel
        Left = 32
        Top = 16
        Width = 3
        Height = 13
      end
      object btnAddTovar: TButton
        Left = 752
        Top = 24
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
        Enabled = False
        TabOrder = 0
        OnClick = btnAddTovarClick
      end
      object btnDeleteTovar: TButton
        Left = 752
        Top = 56
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1086#1074#1072#1088
        Enabled = False
        TabOrder = 1
        OnClick = btnDeleteTovarClick
      end
      object btnTovarSelect: TButton
        Left = 64
        Top = 56
        Width = 75
        Height = 25
        Caption = #1058#1086#1074#1072#1088
        TabOrder = 2
        OnClick = btnTovarSelectClick
      end
      object gbNumbers: TGroupBox
        Left = 376
        Top = 16
        Width = 345
        Height = 73
        Caption = #1059#1082#1072#1078#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
        TabOrder = 3
        Visible = False
        object lbKolvo: TLabel
          Left = 24
          Top = 24
          Width = 59
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        end
        object lbDate: TLabel
          Left = 32
          Top = 48
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object edQuantity: TEdit
          Left = 112
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'edQuantity'
          OnChange = edQuantityChange
        end
        object dtpD_T: TDateTimePicker
          Left = 112
          Top = 48
          Width = 186
          Height = 21
          Date = 43254.412335092590000000
          Time = 43254.412335092590000000
          TabOrder = 1
        end
      end
      object gbOtgruz: TGroupBox
        Left = 1008
        Top = 8
        Width = 217
        Height = 89
        Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091' '#1086#1090#1075#1088#1091#1079#1072
        TabOrder = 4
        Visible = False
        object dtpOtgruz: TDateTimePicker
          Left = 16
          Top = 16
          Width = 186
          Height = 21
          Date = 43254.463440081020000000
          Time = 43254.463440081020000000
          TabOrder = 0
        end
        object btnOtgruz: TButton
          Left = 56
          Top = 48
          Width = 75
          Height = 33
          Caption = #1054#1090#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
    object dbgD_T: TDBGrid
      Left = 1
      Top = 1
      Width = 1229
      Height = 211
      Align = alClient
      DataSource = dsD_T
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 80
    Top = 16
    object miData: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object miClient: TMenuItem
        Caption = #1050#1083#1080#1077#1085#1090#1099
        OnClick = miClientClick
      end
      object miTovar: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1099
        OnClick = miTovarClick
      end
    end
    object miReport: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100
      object miReport1: TMenuItem
        Caption = #1054#1090#1095#1105#1090#1085#1086#1089#1090#1100' Word'
        OnClick = miReport1Click
      end
      object miReport2: TMenuItem
        Caption = #1054#1090#1095#1105#1090#1085#1086#1089#1090#1100' Excel'
        OnClick = miReport2Click
      end
      object miDiag: TMenuItem
        Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
        OnClick = miDiagClick
      end
    end
    object miClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = miCloseClick
    end
  end
  object dsDogovor: TDataSource
    OnDataChange = dsDogovorDataChange
    Left = 216
    Top = 24
  end
  object dsD_T: TDataSource
    OnDataChange = dsD_TDataChange
    Left = 224
    Top = 242
  end
end
