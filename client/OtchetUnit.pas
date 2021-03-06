unit OtchetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ComCtrls,Comobj, OLEserver, wordXP, ExtCtrls,Menus;

type
  TfmOtchet = class(TForm)
    dbgOtchet: TDBGrid;
    dsOtchet: TDataSource;
    btnAdd: TButton;
    btnClear: TButton;
    lbD_T: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    btnOtchet: TButton;
    lbIDTovar: TListBox;
    lbIDDogovor: TListBox;
    lbClientID: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dsOtchetDataChange(Sender: TObject; Field: TField);
    procedure btnOtchetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOtchet: TfmOtchet;

implementation

uses DataUnit, MainUnit;

{$R *.dfm}

procedure TfmOtchet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmMy.cdsDogovor.MasterFields:='';
    dmMy.cdsDogovor.MasterSource:=nil;
   dsOtchet.DataSet:=nil;
   dmMy.cdsDogovor.DeleteIndex('indxID');
    dmMy.cdsDogovor.AddIndex('indxID','ID',[],'','');
    dmMy.cdsDogovor.IndexFieldNames:='ID';

end;

procedure TfmOtchet.FormActivate(Sender: TObject);
begin
dtpBegin.DateTime:= now;
dtpEnd.DateTime:= now;
dmMy.cdsDogovor.DeleteIndex('indxID');


    dmMy.cdsDogovor.AddIndex('indxID','ClientID',[],'','');
    dmMy.cdsDogovor.IndexFieldNames:='ClientID';


     dsOtchet.DataSet:=dmMy.cdsClient;


     dmMy.cdsDogovor.MasterSource:=dsOtchet;
     dmMy.cdsDogovor.MasterFields:='ID';
end;

procedure TfmOtchet.btnAddClick(Sender: TObject);
{var i:integer;
begin
    dmMy.cdsD_T.First;
    for i:=1 to dmMy.cdsD_T.RecordCount do begin
    if((dmMy.cdsD_TDATE.Value>=dtpBegin.DateTime)and(dmMy.cdsD_TDATE.Value<=dtpEnd.DateTime)and(dmMy.cdsD_TSHIPMENT.Value=0))then  begin
    lbD_T.items.Add(dmMy.cdsClientName.AsString+' '+dmMy.cdsD_TName.AsString+'  '+dmMy.cdsD_Tkolvo.AsString);
    lbIDTovar.Items.Add(dmMy.cdsD_TTovarID.AsString);
    lbIDDogovor.Items.Add(dmMy.cdsD_TDogovorID.AsString);
    lbClientID.Items.Add(dmMy.cdsClientID.AsString);
    end;
    dmMy.cdsD_T.Next;
    end; }
var i,j,k,bol:integer; a:integer; b,b1:string;
begin
   dmMy.cdsD_T.First;
    for i:=1 to dmMy.cdsD_T.RecordCount do begin
    if((dmMy.cdsD_TDATE.Value>=dtpBegin.DateTime)and(dmMy.cdsD_TDATE.Value<=dtpEnd.DateTime)and(dmMy.cdsD_TSHIPMENT.Value=0))then
    begin
    bol:=0;
       for k:= 0 to lbD_T.Count-1 do begin

          for j:= length(lbD_T.Items[k]) downto 1 do
          if( lbD_T.Items[k][j]=' ')then  break;

            a:= StrToInt(Copy(lbD_T.Items[k],j+1,length(lbD_T.Items[k])-j));
            b:= AnsiLowerCase(Copy(lbD_T.Items[k],1,j-2));

            b1:=  AnsiLowerCase(dmMy.cdsD_TName.Value);

          if(AnsiCompareText(b1,b)=0)then begin

               a:=a+dmMy.cdsD_Tkolvo.Value;
               lbD_T.Items[k]:= dmMy.cdsD_TName.AsString+'  '+FloatToStr(a);
               bol:=1;  break;
          end;
      end;
      if(bol=0)then
    lbD_T.items.Add(dmMy.cdsD_TName.AsString+'  '+dmMy.cdsD_Tkolvo.AsString);
    lbIDTovar.Items.Add(dmMy.cdsD_TPrice.AsString);
    end;
   dmMy.cdsD_T.Next;
end;
 end;
procedure TfmOtchet.btnClearClick(Sender: TObject);
begin
  lbD_T.Items.Clear;
end;

procedure TfmOtchet.dsOtchetDataChange(Sender: TObject; Field: TField);
begin
 btnAdd.Enabled:=dmMy.cdsD_T.RecordCount>0;
end;

procedure TfmOtchet.btnOtchetClick(Sender: TObject);
var a,dx,colX,x,k,y,j,y1,l,i:integer;
max:single;
c:double;
cl: Tcolor;
s,b: string;
XL: variant;
begin

//dmMy.cdsDogovor.DeleteIndex('indxID');
 // dmMy.cdsDogovor.MasterFields:='';
   // dmMy.cdsDogovor.MasterSource:=nil;
 {
  dm.DCOMConnection1.AppServer.smQueryDelete;
  dm.cdsQuery2.Close;

  dm.DCOMConnection1.AppServer.smQueryNew(
  'select * from report2('''+DateToStr(DateTimePicker1.Date)+''','''+
   DateToStr(DateTimePicker2.Date) + ''')');

   dm.DCOMConnection1.AppServer.smQueryNew('where out_id in(');
   if lbIDTovar.Count > 0 then
    begin
      for i := 1 to lbIDTovar.Count - 1 do
         dm.DCOMConnection1.AppServer.smQueryNew(lbID.Items[i] + ',');
      dm.DCOMConnection1.AppServer.smQueryNew(lbID.Items[lbID.Count - 1]);
    end;
    dm.DCOMConnection1.AppServer.smQueryNew(')');

    dm.cdsQuery2.Open;
   // if dm.cdsQuery.RecordCount <> 0 then
    //begin
    dm.cdsQuery2.Last;
    DataSource1.DataSet := dm.cdsQuery2;
    dm.cdsQuery2.First;
    max := 0;
    dm.cdsQuery2.Refresh;
  dm.cdsQuery2.FieldByName('OUT_ID').DisplayLabel := '�';
  dm.cdsQuery2.FieldByName('OUT_NAME').DisplayLabel := '������������';
  dm.cdsQuery2.FieldByName('OUT_INKOLVO').DisplayLabel := '���-�� ������ �������';
  dm.cdsQuery2.FieldByName('OUT_OUTKOLVO').DisplayLabel := '���-�� ����� �������';
     }
  XL := CreateOleObject('Excel.Application');
  XL.Visible := true;
  XL.WorkBooks.Add;
  XL.Selection.Font.Size := 12;

  // ���� �������� ��������
  XL.WorkBooks[1].WorkSheets[1].Name := '������ ���������� � ��������';
  //for l := 1 to 15 do
    XL.WorkBooks[1].WorkSheets[1].Rows[1].HorizontalAlignment := 3;

   // Style for first row
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Bold := True;
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Color := clBlack;
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Size := 16;
  XL.WorkBooks[1].WorkSheets[1].Rows[1].Font.Name := 'Times New Roman';

  //Style for second row
  XL.WorkBooks[1].WorkSheets[1].Rows[2].Font.Bold := True;
  XL.WorkBooks[1].WorkSheets[1].Rows[3].Font.Bold := True;
  //XL.WorkBooks[1].WorkSheets[1].Cells[4,1].Font.Bold := True;

  XL.WorkBooks[1].WorkSheets[1].Columns[1].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[2].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[3].ColumnWidth := 20;
   XL.WorkBooks[1].WorkSheets[1].Columns[4].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[5].ColumnWidth := 20;
  XL.WorkBooks[1].WorkSheets[1].Columns[6].ColumnWidth := 20;

  XL.WorkBooks[1].WorkSheets[1].Cells[1, 1] := '�������� ���������';
  XL.WorkBooks[1].WorkSheets[1].Range['A1:E1'].Merge;

  XL.WorkBooks[1].WorkSheets[1].Cells[2,1] := '����������';
  XL.WorkBooks[1].WorkSheets[1].Range['A2:E2'].Merge;

  XL.WorkBooks[1].WorkSheets[1].Cells[3,1] := ('������������ ������');
  //XL.WorkBooks[1].WorkSheets[1].Cells[3,2] := ('����');
  //XL.WorkBooks[1].WorkSheets[1].Cells[3,3] := ('����');
  XL.WorkBooks[1].WorkSheets[1].Cells[3,2] := ('���-��');
  XL.WorkBooks[1].WorkSheets[1].Cells[3,3] := ('�����');
  //XL.WorkBooks[1].WorkSheets[1].Cells[3,6] := ('��� �������');


  //for j:=1 to lbD_T.

  //dmMy.cdsClient.First;i:=0;
  //for x:= 1 to lbD_T.Count do begin


            //dmMy.cdsD_T.First;
            //for l:=1 to dmMy.cdsD_T.RecordCount  do begin
                    //for y:= 0 to lbD_T.Count-1 do
                    //if((dmMy.cdsD_TTovarID.Value=StrToInt(lbIDTovar.Items[y]))and(dmMy.cdsD_TDogovorID.Value=StrToInt(lbIDDogovor.Items[y])))then begin

                    for k:= 0 to lbD_T.Count-1 do begin

          for j:= length(lbD_T.Items[k]) downto 1 do
          if( lbD_T.Items[k][j]=' ')then  break;

            a:= StrToInt(Copy(lbD_T.Items[k],j+1,length(lbD_T.Items[k])-j));
            c:= StrToFloat(lbIDTovar.Items[k]);
            b:= Copy(lbD_T.Items[k],1,j-2);
                        XL.WorkBooks[1].WorkSheets[1].Cells[k+5,1] := b;
                        //XL.WorkBooks[1].WorkSheets[1].Cells[i+5,2] := (dmMy.cdsD_TDATE.AsString);
                       // XL.WorkBooks[1].WorkSheets[1].Cells[i+5,3] := (dmMy.cdsD_TPrice.AsFloat);
                        XL.WorkBooks[1].WorkSheets[1].Cells[k+5,2] := a;
                        XL.WorkBooks[1].WorkSheets[1].Cells[k+5,3] := c*a;
                        // XL.WorkBooks[1].WorkSheets[1].Cells[i+5,6] := (dmMy.cdsClientName.AsString);
                        //i:=i+1;
                   // end;
               // dmMy.cdsD_T.next;
           // end;



    // dmMy.cdsClient.Next;
  end;




  //��������� ��������� �����
// XL.WorkBooks[1].WorkSheets[1].Range['A1:F1'+
 //IntToStr(dm.cdsQuery2.RecordCount + 3 )].Borders.LineStyle := 1;


//dmMy.cdsDogovor.AddIndex('indxID','ClientID',[],'','');
    //dmMy.cdsDogovor.IndexFieldNames:='ClientID';
end;

end.
