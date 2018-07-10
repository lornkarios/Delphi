unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, Menus;

type
  TfTovar = class(TForm)
    MainMenu1: TMainMenu;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    miClose: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCloseClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTovar: TfTovar;

implementation

uses DataUnit, Unit2;

{$R *.dfm}

procedure TfTovar.FormActivate(Sender: TObject);
begin
   DataSource1.DataSet:=dmMy.cdsTovar;

end;

procedure TfTovar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DataSource1.DataSet:=nil;
end;

procedure TfTovar.miCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfTovar.miAddClick(Sender: TObject);
begin
fmNewTovar.ShowModal;
 if fmNewTovar.ModalResult=mrOk then
  begin
  try
  dmMy.DCOMConnection1.AppServer.smUpdateTovar(
  0,
  fmNewTovar.edName.Text,
  StrToFloat(fmNewTovar.edCost.Text)
  );
  except
  MessageDlg('Ошибка записи в БД',mtError,[mbOK],0)
  end;
  dmMy.cdsTovar.Refresh;
end;
end;
procedure TfTovar.miDeleteClick(Sender: TObject);
begin
if(dmMy.cdsTovar.RecordCount>0)and(MessageDlg('Удалить товар '+dmMy.cdsTovarName.AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes)  then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteTovar(dmMy.cdsTovarID.Value);
    dmMy.cdsTovar.Refresh;
  end;
end;

end.
