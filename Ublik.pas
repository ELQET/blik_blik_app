unit Ublik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, StdCtrls, CPortCtl, ComCtrls, ExtCtrls, ShellApi;

type
  TForm1 = class(TForm)
    ComPort1: TComPort;
    Button1: TButton;
    ComLed1: TComLed;
    ComLed2: TComLed;
    RichEdit1: TRichEdit;
    Button3: TButton;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure TrackBar1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComPort1DSRChange(Sender: TObject; OnOff: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label8MouseEnter(Sender: TObject);
    procedure Label8MouseLeave(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var s,seltext:string; i:integer; b:byte;  ports:TStringList; chyba : boolean;

procedure TForm1.FormShow(Sender: TObject);
begin
Richedit1.Text := 'Hello world!';
chyba := true;
try
 ports := TStringList.Create;
 EnumComPorts(ports);
 ComboBox1.Items.AddStrings(ports);
 if ComboBox1.Items.Count > 0 then
begin
 ComboBox1.ItemIndex := 0;
 chyba := false;
end;
 except
  MessageBox(0, PChar('I have not found a suitable serial COM port on your computer!!! If this PC is the laptot, so be sure that the USB converter to serial COM port is properly connected to the laptop. ' ), 'Could not find the serial COM port!', MB_OK or MB_ICONINFORMATION);
   ComboBox1.Items.Add('n/a');
   ComboBox1.Text := 'n/a';
   chyba := true;
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
  if RadioButton1.Checked then b:=0;
    if RadioButton2.Checked then b:=1;
      if RadioButton3.Checked then b:=2;
        if RadioButton4.Checked then b:=3;
          if RadioButton5.Checked then b:=4;
            if RadioButton6.Checked then b:=5;
              if RadioButton7.Checked then b:=6;
                if RadioButton8.Checked then b:=7;
                  if RadioButton9.Checked then b:=8;
                    if RadioButton10.Checked then b:=9;
                      if RadioButton11.Checked then b:=10;
    s:='';
    for i:=1 to Length(RichEdit1.Text) do begin
      if (Ord(RichEdit1.Text[i]) = 13) or ( Ord(RichEdit1.Text[i]) >= 32 ) then
      begin
        s := s + RichEdit1.Text[i];
      end;
    end;
try
 ComPort1.WriteStr(Char(128) + Char(254) + Char(TrackBar1.Position) + Char(b) + s +Char(255));
 except
 MessageBox(0, PChar('Unable to connect through port '+ ComboBox1.Items[ComboBox1.ItemIndex] + '. This serial COM port is occupied by another program or it is not the serial COM port! Please choose a different port.' ), 'Chyba!', MB_OK or MB_ICONERROR);
  chyba := true;
  seltext := ComboBox1.Items[ComboBox1.ItemIndex];
 end;
 end;


 procedure TForm1.TrackBar1Change(Sender: TObject);
begin
Label1.Caption := IntToStr(TrackBar1.Position);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if not chyba then
  if not ComPort1.Connected then  begin
ComPort1.Port := ComboBox1.Items[ComboBox1.ItemIndex];
try
ComPort1.Open;
Comport1.SetRTS(true);
    //Button1.Enabled := true;
    Button3.Caption := 'Odpoji';
    ComboBox1.Enabled := false;
     Button2.Enabled := false;
except
  MessageBox(0, PChar('Unable to connect through port '+ ComboBox1.Items[ComboBox1.ItemIndex] + '. This serial COM port is occupied by another program or it is not the serial COM port! Please choose a different port.' ), 'Error!', MB_OK or MB_ICONERROR);
  chyba := true;
  seltext := ComboBox1.Items[ComboBox1.ItemIndex];
end;
 end
 else begin
 try
    ComPort1.Close;
 ComboBox1.Enabled := true;
      except
   MessageBox(0, PChar('Serial COM port was suddenly disconnected. It is possible that you came up converter from USB to serial port rather than you completed this program. ' ), 'Error!', MB_OK or MB_ICONERROR);
   ComboBox1.Enabled := true;
       Button2.Enabled := true;
  end;
    //Button1.Enabled := false;
        Button3.Caption := 'Pripoji';
            Button2.Enabled := true;
   end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
 if not ( seltext = ComboBox1.Items[ComboBox1.ItemIndex]) then chyba := false;
end;

procedure TForm1.ComPort1DSRChange(Sender: TObject; OnOff: Boolean);
begin
 if OnOff then Button1.Enabled := true
 else Button1.Enabled := false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ports.Free;
  try
  if ComPort1.Connected then ComPort1.Close;
  except
   MessageBox(0, PChar('Serial COM port was suddenly disconnected. It is possible that you came up converter from USB to serial port rather than you completed this program. ' ), 'Error!', MB_OK or MB_ICONERROR);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var tt:string; k:integer;
begin
 chyba := true;
 ComboBox1.Items.Clear;
try
 ports := TStringList.Create;
 EnumComPorts(ports);
 ComboBox1.Items.AddStrings(ports);
 if ComboBox1.Items.Count > 0 then
begin
 ComboBox1.ItemIndex := 0;
 chyba := false;
 tt:='';
 for k:=0 to (ports.Count-1) do tt := tt  + ports.Strings[k] + ', ';
 MessageBox(0, PChar(tt), 'Found the serial COM ports!', MB_OK or MB_ICONINFORMATION);
end;
 except
  MessageBox(0, PChar('I have not found a suitable serial COM port on your computer!!! If this PC is the laptot, so be sure that the USB converter to serial COM port is properly connected to the laptop. ' ), 'Could not find the serial COM port!', MB_OK or MB_ICONINFORMATION);
   ComboBox1.Items.Add('n/a');
   ComboBox1.Text := 'n/a';
   chyba := true;
 end;
end;


procedure TForm1.Label8Click(Sender: TObject);
var em_subject, em_body, em_mail : string;
begin
  //Label19.Font.Color := clRed;
 em_subject := 'Text POV - question about the device';
  em_body := 'Hi, ';

  em_mail := 'mailto:blikacka@gmail.com?subject=' +
    em_subject + '&body=' + em_body ;

  ShellExecute(Handle,'open',PChar(em_mail), nil, nil, SW_SHOWNORMAL) ;

end;
procedure TForm1.Label8MouseEnter(Sender: TObject);
begin
 Label8.Font.Color := clNavy;
end;

procedure TForm1.Label8MouseLeave(Sender: TObject);
begin
 Label8.Font.Color := clActiveCaption;
end;

end.
