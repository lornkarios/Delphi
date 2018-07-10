program MyClient;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {fmMain},
  DataUnit in 'DataUnit.pas' {dmMy: TDataModule},
  Unit1 in 'Unit1.pas' {fTovar},
  Unit2 in 'Unit2.pas' {fmNewTovar},
  Unit3 in 'Unit3.pas' {fmClient},
  Unit4 in 'Unit4.pas' {fmNewClient},
  Unit5 in 'Unit5.pas' {fmDogovor},
  OtchetUnit in 'OtchetUnit.pas' {fmOtchet},
  DiagUnit in 'DiagUnit.pas' {fmDiag};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmMy, dmMy);
  Application.CreateForm(TfTovar, fTovar);
  Application.CreateForm(TfmNewTovar, fmNewTovar);
  Application.CreateForm(TfmClient, fmClient);
  Application.CreateForm(TfmNewClient, fmNewClient);
  Application.CreateForm(TfmDogovor, fmDogovor);
  Application.CreateForm(TfmOtchet, fmOtchet);
  Application.CreateForm(TfmDiag, fmDiag);
  Application.Run;
end.
