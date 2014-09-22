program blik_blik;

uses
  Forms,
  Ublik in 'Ublik.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Blik blik';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
