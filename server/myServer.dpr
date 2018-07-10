program myServer;

uses
  Forms,
  myServer_TLB in 'myServer_TLB.pas',
  Unit1 in 'Unit1.pas' {MyServerCl: TRemoteDataModule} {MyServerCl: CoClass},
  Server in 'Server.pas' {Form2};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
