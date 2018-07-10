unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB,StdCtrls, Menus;

type
  TfmClient = class(TForm)
    MainMenu1: TMainMenu;
    miNew: TMenuItem;
    miChange: TMenuItem;
    miDelete: TMenuItem;
    miClose: TMenuItem;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miNewClick(Sender: TObject);
    procedure miChangeClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmClient: TfmClient;

implementation

uses DataUnit, Unit4, DBClient;

{$R *.dfm}

procedure TfmClient.FormActivate(Sender: TObject);
var i:integer;
a:tcomponent;
b:tcomponent;
begin

  DataSource1.DataSet:=dmMy.cdsClient;
  dmMy.cdsClient.IndexFieldNames:='Adress;ID';
end;

procedure TfmClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet:=nil;
end;

procedure TfmClient.miNewClick(Sender: TObject);
var i:integer;
begin
  with fmNewClient do
  begin
  for i:=0 to ComponentCount -1 do
  if Components[i] is TEdit then
  (Components[i] as TEdit).Text:='';
  ShowModal;
  if ModalResult=mrOk then
  begin
  try
  dmMy.DCOMConnection1.AppServer.smUpdateClient(0,edName.Text,edAdress.Text);
  except
  MessageDlg('Ошибка записи данных в БД',mtError,[mbOk],0)
  end;
  dmMy.cdsClient.Refresh;
  end;
  end;
end;

procedure TfmClient.miChangeClick(Sender: TObject);
begin
   with fmNewClient do
  begin
  edName.Text:=dmMy.cdsClientName.Value;
  edAdress.Text:=dmMy.cdsClientAdress.Value;
  ShowModal;
  if ModalResult=mrOk then
  begin
  try
  dmMy.DCOMConnection1.AppServer.smUpdateClient(dmMy.cdsClientID.Value,edName.Text,edAdress.Text);
  except
  MessageDlg('Ошибка записи данных в БД',mtError,[mbOk],0)
  end;
  dmMy.cdsClient.Refresh;
  end;
  end;
end;

procedure TfmClient.miDeleteClick(Sender: TObject);
begin
  if(dmMy.cdsClient.RecordCount>0)and(MessageDlg('Удалить клиента '+dmMy.cdsClientName.AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes)  then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteClient(dmMy.cdsClientID.Value);
    dmMy.cdsClient.Refresh;
  end;
end;

procedure TfmClient.miCloseClick(Sender: TObject);
begin
Close;
end;

end.
