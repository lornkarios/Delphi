unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, Grids, DBGrids, ExtCtrls,Comobj, OLEserver, wordXP, ComCtrls;


type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    miData: TMenuItem;
    miReport: TMenuItem;
    miClose: TMenuItem;
    miClient: TMenuItem;
    miTovar: TMenuItem;
    miReport1: TMenuItem;
    miReport2: TMenuItem;
    pnlDogovor: TPanel;
    pnlD_T: TPanel;
    pnlDogovorModify: TPanel;
    dbgDogovor: TDBGrid;
    pnlD_TModify: TPanel;
    dbgD_T: TDBGrid;
    btnNewDogovor: TButton;
    btnDeleteDogovor: TButton;
    dsDogovor: TDataSource;
    dsD_T: TDataSource;
    btnAddTovar: TButton;
    btnDeleteTovar: TButton;
    lbTovar: TLabel;
    btnTovarSelect: TButton;
    gbNumbers: TGroupBox;
    lbKolvo: TLabel;
    edQuantity: TEdit;
    lbDate: TLabel;
    dtpD_T: TDateTimePicker;
    gbOtgruz: TGroupBox;
    dtpOtgruz: TDateTimePicker;
    btnOtgruz: TButton;
    miDiag: TMenuItem;
    procedure miTovarClick(Sender: TObject);
    procedure miClientClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewDogovorClick(Sender: TObject);
    procedure btnDeleteDogovorClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTovarSelectClick(Sender: TObject);
    procedure edQuantityChange(Sender: TObject);
    procedure btnAddTovarClick(Sender: TObject);
    procedure btnDeleteTovarClick(Sender: TObject);
    procedure dsD_TDataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure miReport1Click(Sender: TObject);
    procedure miReport2Click(Sender: TObject);
    procedure miDiagClick(Sender: TObject);
    procedure dsDogovorDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    TovarID:integer;
    TovarCost:double;
  public
  v:integer;
    { Public declarations }
  end;

var
  fmMain: TfmMain;
      MSW,XL,Table:variant;

implementation

uses Unit1, Unit3, DataUnit, Unit5, OtchetUnit, DiagUnit;

{$R *.dfm}

procedure TfmMain.miTovarClick(Sender: TObject);
begin
  fTovar.ShowModal;
end;

procedure TfmMain.miClientClick(Sender: TObject);
begin
  fmClient.ShowModal;
  dmMy.cdsDogovor.Refresh;
  dmMy.cdsD_T.Refresh;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  pnlDogovor.Height:=fmMain.ClientHeight div 2;
  dsDogovor.DataSet:=dmMy.cdsDogovor;
  dsD_T.DataSet:=dmMy.cdsD_T;

  dmMy.cdsD_T.MasterSource:=dsDogovor;
  dmMy.cdsD_T.MasterFields:='ID';
  dtpD_T.DateTime:= now;
  dtpOtgruz.DateTime:= now;
  btnDeleteDogovor.Enabled:=dmMy.cdsDogovor.RecordCount>0;
  pnlD_TModify.Visible:=btnDeleteDogovor.Enabled;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dmMy.cdsD_T.MasterFields:='';
    dmMy.cdsD_T.MasterSource:=nil;


    dsDogovor.DataSet:=nil;
    dsD_T.DataSet:=nil;
end;

procedure TfmMain.btnNewDogovorClick(Sender: TObject);
var a:integer;
begin
fmDogovor.ShowModal;
if fmDogovor.ModalResult=mrOk then
begin
if(fmDogovor.rbNal.Checked)then
a:=1
else
a:=0;
fmClient.ShowModal;
if dmMy.cdsClient.RecordCount>0 then begin
 try

dmMy.DCOMConnection1.AppServer.smUpdateDogovor(0,dmMy.cdsClientID.Value,
fmDogovor.dtpDate.DateTime,a,0);
except
   MessageDlg('Ошибка записи в БД',mtError,[mbOk],0);
end;

dmMy.cdsDogovor.Refresh;
end;
end;
btnDeleteDogovor.Enabled:=dmMy.cdsDogovor.RecordCount>0;
pnlD_TModify.Visible:=btnDeleteDogovor.Enabled;
end;

procedure TfmMain.btnDeleteDogovorClick(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить накладную № '+dmMy.cdsDogovorID.AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
dmMy.DCOMConnection1.AppServer.smDeleteDogovor(dmMy.cdsDogovorID.Value);
dmMy.cdsDogovor.Refresh;
btnDeleteDogovor.Enabled:=dmMy.cdsDogovor.RecordCount>0;
pnlD_TModify.Visible:=btnDeleteDogovor.Enabled;
end;
end;
procedure TfmMain.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
TovarID:=0;

end;

procedure TfmMain.btnTovarSelectClick(Sender: TObject);
begin
fTovar.ShowModal;
TovarID:=0;
lbTovar.Caption:='';
if dmMy.cdsTovar.RecordCount>0 then
begin
  TovarID:= dmMy.cdsTovarID.Value;
  TovarCost:=dmMy.cdsTovarCost.Value;
  lbTovar.Caption:=dmMy.cdsTovarName.AsString;
end;
gbNumbers.Visible:=TovarID>0;
edQuantity.Text:='';
btnAddTovar.Enabled:=false;
end;

procedure TfmMain.edQuantityChange(Sender: TObject);
begin
try
StrToFloat(edQuantity.Text);
btnAddTovar.Enabled:=True;
except
btnAddTovar.Enabled:=False;
end;
end;

procedure TfmMain.btnAddTovarClick(Sender: TObject);
begin
dmMy.DCOMConnection1.AppServer.smUpdateD_T(TovarID,dmMy.cdsDogovorID.Value,StrToFloat(edQuantity.Text),dtpD_T.DateTime,0);
dmMy.cdsDogovor.Refresh;
dmMy.cdsD_T.Refresh;
end;

procedure TfmMain.btnDeleteTovarClick(Sender: TObject);
begin
 if MessageDlg('Удалить товар '+dmMy.cdsD_TName.AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
  dmMy.DCOMConnection1.AppServer.smDeleteD_T(dmMy.cdsD_TTovarID.Value,dmMy.cdsD_TDogovorID.Value);
  dmMy.cdsD_T.Refresh;
  dmMy.cdsDogovor.Refresh;
 end;
end;



procedure TfmMain.dsD_TDataChange(Sender: TObject; Field: TField);
begin
 btnOtgruz.Enabled:=((dmMy.cdsD_T.RecordCount>0) and (dmMy.cdsD_TSHIPMENT.Value=0));
  btnDeleteTovar.Enabled:=dmMy.cdsD_T.RecordCount>0;
  gbOtgruz.Visible:= ((dmMy.cdsD_T.RecordCount>0) and (dmMy.cdsD_TSHIPMENT.Value=0));
   if(v=1)then begin dmMy.cdsD_T.MasterSource:=dsDogovor;
  dmMy.cdsD_T.MasterFields:='ID';
  v:=0;
  end;
end;

procedure TfmMain.Button1Click(Sender: TObject);
begin
   dmMy.DCOMConnection1.AppServer.smUpdateD_T(dmMy.cdsD_TTovarID.Value,dmMy.cdsD_TDogovorID.Value,dmMy.cdsD_Tkolvo.Value,dtpOtgruz.DateTime,1);
dmMy.cdsDogovor.Refresh;
dmMy.cdsD_T.Refresh;
end;

procedure TfmMain.miReport1Click(Sender: TObject);
var i,l:integer;
begin
dmMy.cdsDogovor.First;
MSW := CreateOleObject('Word.Application');
 MSW.Visible := true;
 MSW.Documents.Add;
 MSW.Selection.Font.Size := 12;
 MSW.Selection.ParagraphFormat.Alignment := wdAlignParagraphLeft;
for i:=1 to dmMy.cdsDogovor.RecordCount do begin
//if ( dm.cdsNakl.FieldByName('nukl_type').value = 1 ) then
//begin



 MSW.ActiveDocument.Range.InsertAfter('Договор номер: ' + dmMy.cdsDogovorID.AsString+char(10)+'Дата: ' + dmMy.cdsDogovorDate.AsString+char(10)+'Имя клиента: '+dmMy.cdsDogovorClientName.AsString+char(10)+'Адрес клиента: '+dmMy.cdsDogovorClientAdress.AsString);

 MsW.Selection.EndKey (6);

 //Создание таблицы

  MsW.ActiveDocument.Tables.Add(MsW.ActiveDocument.Range(MSW.Selection.End,MSW.Selection.End),
  dbgD_T.DataSource.DataSet.RecordCount + 1, 6);
  //По местоположению курсора


  MSW.ActiveDocument.Tables.Item(i).Select;
  MSW.ActiveDocument.Tables.Item(i).Rows.Item(1).Select;//1ая строка
  MSW.ActiveDocument.Tables.Item(i).Cell(1,1).Range.Text := 'Название товара';
  MSW.ActiveDocument.Tables.Item(i).Cell(1,2).Range.Text := 'Дата';
  MSW.ActiveDocument.Tables.Item(i).Cell(1,3).Range.Text := 'Цена';
  MSW.ActiveDocument.Tables.Item(i).Cell(1,4).Range.Text := 'Количество';
  MSW.ActiveDocument.Tables.Item(i).Cell(1,5).Range.Text := 'Сумма';
  MSW.ActiveDocument.Tables.Item(i).Cell(1,6).Range.Text := 'Отгружено/Не отгружено';

  Table:=MSW.ActiveDocument.Tables.Item(i);
  Table.Style:='Сетка таблицы';


  dmMy.cdsD_T.First;
  for l:=0 to dmMy.cdsD_T.RecordCount - 1 do
  begin
    Table.Cell(l+2,1).Range.InsertBefore(dmMy.cdsD_TName.AsString);
    Table.Cell(l+2,2).Range.InsertBefore(dmMy.cdsD_TDATE.AsString);
    Table.Cell(l+2,3).Range.InsertBefore(dmMy.cdsD_TPrice.AsString);
    Table.Cell(l+2,4).Range.InsertBefore(dmMy.cdsD_Tkolvo.AsString);
    Table.Cell(l+2,5).Range.InsertBefore(dmMy.cdsD_TSum.AsString);
    Table.Cell(l+2,6).Range.InsertBefore(dmMy.cdsD_TOtgruz.AsString);
    dmMy.cdsD_T.next;
  end;
   MSW.ActiveDocument.Range.InsertAfter(char(10)+char(13)+'Сумма: '+dmMy.cdsDogovorTOTALSUM.AsString+char(10)+char(13));
 // Table.Rows.Item(1).Select;
 // msw.selection.Font.bold := 1;

 // Table.Rows.Item(3).Select;
 // msw.selection.Font.bold := 1;
 // msw.selection.Font.Size := 15;

 // MSW.ActiveDocument.Range.InsertAfter('  ');
    //table.cell(1,7).Merge(table.cell(2,10));

  MSW.ActiveDocument.SaveAs('ex.doc');
   dmMy.cdsDogovor.Next;
 end;

end;

procedure TfmMain.miReport2Click(Sender: TObject);
begin
fmOtchet.ShowModal;
end;

procedure TfmMain.miDiagClick(Sender: TObject);
begin
fmDiag.ShowModal;
dmMy.cdsD_T.MasterSource:=dsDogovor;
  dmMy.cdsD_T.MasterFields:='ID';
end;

procedure TfmMain.dsDogovorDataChange(Sender: TObject; Field: TField);
begin
if(v=1)then begin dmMy.cdsD_T.MasterSource:=dsDogovor;
  dmMy.cdsD_T.MasterFields:='ID';
  v:=0;
  end;
end;

end.
