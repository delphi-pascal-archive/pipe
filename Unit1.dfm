object Form1: TForm1
  Left = 235
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pipe'
  ClientHeight = 721
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object Grid: TDrawGrid
    Left = 7
    Top = -5
    Width = 690
    Height = 686
    Color = clSilver
    ColCount = 40
    DefaultColWidth = 16
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 40
    FixedRows = 0
    TabOrder = 0
    OnDrawCell = GridDrawCell
    OnSelectCell = GridSelectCell
  end
  object Button1: TButton
    Left = 592
    Top = 688
    Width = 105
    Height = 25
    Caption = #1057#1090#1072#1088#1090'!'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 688
    Width = 233
    Height = 25
    TabOrder = 2
  end
  object Button2: TButton
    Left = 472
    Top = 688
    Width = 113
    Height = 25
    Caption = #1045#1097#1077'!'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Panel2: TPanel
    Left = 248
    Top = 688
    Width = 217
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 208
    Top = 120
  end
end
