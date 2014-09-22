object Form1: TForm1
  Left = 275
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Text POV toy - text writer program through serial COM port RS232'
  ClientHeight = 204
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    000001000200101010000000040028010000260000002020100000000400E802
    00004E0100002800000010000000200000000100040000000000800000000000
    0000000000001000000010000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    00000000000000000000000000000000000AA00000000000000AA00000000000
    0000000000000990AA0990AA09900990AA0990AA099000000000000000000AA0
    000000000AA00AA0000000000AA0000000000000000000000000000000000000
    0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FE7F
    0000FE7F0000FFFF00009249000092490000FFFF00009FF900009FF90000FFFF
    0000FFFF0000FFFF0000FFFF0000280000002000000040000000010004000000
    0000000200000000000000000000100000001000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000009900000000009900000000000000000099000
    00000009900000000000000000000000000060000000000AA0990AA0990AA099
    0AA0990AA699000AA0990AA0990AA0990AA0990AA09900000000000000000000
    000000000060000000AA099000000000099000000000000000AA099000000000
    0990000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFE7FE7FFFE7FE7FFFFFF7FE4924920E4924924FFFF
    FFFDFC9FF9FFFC9FF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ComLed1: TComLed
    Left = 8
    Top = 96
    Width = 25
    Height = 25
    ComPort = ComPort1
    LedSignal = lsConn
    Kind = lkYellowLight
  end
  object ComLed2: TComLed
    Left = 8
    Top = 120
    Width = 25
    Height = 25
    ComPort = ComPort1
    LedSignal = lsDSR
    Kind = lkGreenLight
  end
  object Label1: TLabel
    Left = 232
    Top = 48
    Width = 12
    Height = 13
    Caption = '50'
  end
  object Label2: TLabel
    Left = 264
    Top = 16
    Width = 86
    Height = 13
    Caption = 'Text for rendering:'
  end
  object Label3: TLabel
    Left = 88
    Top = 164
    Width = 27
    Height = 16
    Caption = 'Port:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 24
    Width = 209
    Height = 13
    Caption = 'Relative time stroking a single line of the text'
  end
  object Label5: TLabel
    Left = 40
    Top = 102
    Width = 203
    Height = 13
    Caption = '<- selected serial COM port was connected'
  end
  object Label6: TLabel
    Left = 40
    Top = 126
    Width = 211
    Height = 13
    Caption = '<- POV device is attached to serial COM port'
  end
  object Label7: TLabel
    Left = 520
    Top = 176
    Width = 202
    Height = 13
    Caption = 'If you need help, please write to this email: '
  end
  object Label8: TLabel
    Left = 720
    Top = 176
    Width = 117
    Height = 17
    Caption = 'blikacka@gmail.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label8Click
    OnMouseEnter = Label8MouseEnter
    OnMouseLeave = Label8MouseLeave
  end
  object Button1: TButton
    Left = 328
    Top = 168
    Width = 97
    Height = 25
    Caption = 'Write text to POV'
    Enabled = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object RichEdit1: TRichEdit
    Left = 272
    Top = 32
    Width = 233
    Height = 121
    Lines.Strings = (
      'RichEdit1')
    MaxLength = 125
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button3: TButton
    Left = 184
    Top = 160
    Width = 81
    Height = 25
    Caption = 'Connect to port'
    TabOrder = 2
    OnClick = Button3Click
  end
  object TrackBar1: TTrackBar
    Left = 16
    Top = 40
    Width = 209
    Height = 45
    Max = 255
    Min = 1
    Position = 50
    TabOrder = 3
    OnChange = TrackBar1Change
  end
  object RadioGroup1: TRadioGroup
    Left = 512
    Top = 24
    Width = 337
    Height = 129
    Caption = 'Change of text color mode'
    TabOrder = 4
  end
  object RadioButton1: TRadioButton
    Left = 536
    Top = 40
    Width = 129
    Height = 17
    Caption = 'For each word + waves'
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 536
    Top = 56
    Width = 113
    Height = 17
    Caption = 'For each letter'
    TabOrder = 6
  end
  object RadioButton3: TRadioButton
    Left = 536
    Top = 72
    Width = 129
    Height = 17
    Caption = 'For each part of letter'
    TabOrder = 7
  end
  object RadioButton4: TRadioButton
    Left = 536
    Top = 88
    Width = 113
    Height = 17
    Caption = 'Only red'
    TabOrder = 8
  end
  object RadioButton5: TRadioButton
    Left = 536
    Top = 104
    Width = 113
    Height = 17
    Caption = 'Only green'
    TabOrder = 9
  end
  object RadioButton6: TRadioButton
    Left = 672
    Top = 40
    Width = 129
    Height = 17
    Caption = 'Each new line of text'
    TabOrder = 10
  end
  object RadioButton7: TRadioButton
    Left = 672
    Top = 56
    Width = 161
    Height = 17
    Caption = 'Each new line of text + waves'
    TabOrder = 11
  end
  object RadioButton8: TRadioButton
    Left = 672
    Top = 72
    Width = 153
    Height = 17
    Caption = 'Random change anywhere'
    TabOrder = 12
  end
  object RadioButton9: TRadioButton
    Left = 672
    Top = 88
    Width = 169
    Height = 17
    Caption = 'Random change for each letter'
    TabOrder = 13
  end
  object RadioButton10: TRadioButton
    Left = 672
    Top = 104
    Width = 153
    Height = 17
    Caption = 'Negation + alternating colors'
    TabOrder = 14
  end
  object RadioButton11: TRadioButton
    Left = 536
    Top = 128
    Width = 297
    Height = 17
    Caption = 'Random change of text color mode for each line'
    TabOrder = 15
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 160
    Width = 57
    Height = 21
    ItemHeight = 13
    TabOrder = 16
    OnChange = ComboBox1Change
  end
  object Button2: TButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Search ports'
    TabOrder = 17
    OnClick = Button2Click
  end
  object ComPort1: TComPort
    BaudRate = br300
    Port = 'COM2'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Timeouts.ReadTotalMultiplier = 10000
    Timeouts.ReadTotalConstant = 10000
    Timeouts.WriteTotalMultiplier = 10000
    Timeouts.WriteTotalConstant = 10000
    SyncMethod = smNone
    OnDSRChange = ComPort1DSRChange
    Left = 464
    Top = 168
  end
end
