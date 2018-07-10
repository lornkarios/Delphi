unit DiagUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, DBClient, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, DbChart, ComCtrls;

type

 TCustomer = class
    private

      CustomerName   : String;
      CustomerNumber : Integer;

    public

      property Name : String
          read CustomerName;
      property Number : Integer
          read CustomerNumber;


      constructor Create(const CustomerName   : String;
                         const CustomerNumber : Integer);
  end;
  TfmDiag = class(TForm)
    DBGrid1: TDBGrid;
    dsTovar: TDataSource;
    btnClear: TButton;
    btnAdd: TButton;
    btnDiag: TButton;
    lbDiag1: TListBox;
    lbDiag2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Image1: TImage;
    Image2: TImage;
    lbDiag3: TListBox;
    lbDiag5: TListBox;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dsTovarDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnDiagClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDiag: TfmDiag;
  s:string;
implementation

uses DataUnit, MainUnit;

constructor TCustomer.Create(const CustomerName   : String;
                             const CustomerNumber : Integer);
begin

  self.CustomerName   := CustomerName;
  self.CustomerNumber := CustomerNumber;
end;



{$R *.dfm}

procedure TfmDiag.FormActivate(Sender: TObject);
begin
 dsTovar.DataSet:=dmMy.cdsTovar;
    dtpBegin.DateTime:= now;
dtpEnd.DateTime:= now;

dmMy.cdsD_T.DeleteIndex('indxID');


    dmMy.cdsD_T.AddIndex('indxID','DogovorID;TovarID',[],'','');
    dmMy.cdsD_T.IndexFieldNames:='TovarID';


   dmMy.cdsD_T.MasterSource:=dsTovar;
   //s:= dmMy.cdsD_T.MasterFields;
  dmMy.cdsD_T.MasterFields:='ID';

end;

procedure TfmDiag.btnClearClick(Sender: TObject);
begin
  lbDiag1.Items.Clear;
    lbDiag2.Items.Clear;
     lbDiag3.Items.Clear;
     lbDiag5.Items.Clear;
end;

procedure TfmDiag.dsTovarDataChange(Sender: TObject; Field: TField);
begin
btnAdd.Enabled:=dmMy.cdsD_T.RecordCount>0;
btnClear.Enabled:=((lbDiag1.Count>0) or (lbDiag2.Count>0)) ;
btnDiag.Enabled:=((lbDiag1.Count>0) or (lbDiag2.Count>0));
end;

procedure TfmDiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin


dmMy.cdsD_T.MasterFields:='';
dmMy.cdsD_T.MasterSource:=nil;
   dsTovar.DataSet:=nil;
   dmMy.cdsD_T.DeleteIndex('indxID');
dmMy.cdsD_T.AddIndex('indxID','DogovorID;TovarID',[],'','');
dmMy.cdsD_T.IndexFieldNames:='DogovorID;TovarID';
fmMain.v:=1;
end;

procedure TfmDiag.btnAddClick(Sender: TObject);
var i,j,k,d,bol:integer; a,n1,n2:integer; b,b1:string;
bok:boolean;
begin
   dmMy.cdsD_T.First;
    for i:=1 to dmMy.cdsD_T.RecordCount do begin
    if((dmMy.cdsD_TDATE.Value>dtpBegin.DateTime)and(dmMy.cdsD_TDATE.Value<dtpEnd.DateTime))then
    begin
    bok:=true;
    for d:=0 to lbDiag3.Count-1 do
      if((dmMy.cdsD_TDATE.AsString+dmMy.cdsD_TTovarID.AsString+dmMy.cdsClientID.AsString+dmMy.cdsD_TClientID.AsString)=lbDiag3.Items[d]) then
      begin
        bok:=false;
        break;
      end;

    if(bok) then begin
    bol:=0;
       for k:= 0 to lbDiag5.Count-1 do begin

          //for j:= length(lbDiag1.Items[k]) downto 1 do
         // if( lbDiag1.Items[k][j]=' ')then  break;

           //Copy(lbDiag1.Items[k],j+1,length(lbDiag1.Items[k])-j));
            b:= lbDiag5.Items[k];//AnsiLowerCase(Copy(lbDiag1.Items[k],1,j-2));

            b1:=  AnsiLowerCase(dmMy.cdsD_TName.Value);

          if(AnsiCompareText(b1,b)=0)then begin
          lbDiag3.Items.Add(dmMy.cdsD_TDATE.AsString+dmMy.cdsD_TTovarID.AsString+dmMy.cdsClientID.AsString+dmMy.cdsD_TClientID.AsString);
                if(dmMy.cdsD_TSHIPMENT.Value=0)then begin
                a:= StrToInt(lbDiag1.Items[k]);
               a:=a+dmMy.cdsD_Tkolvo.Value;
               lbDiag1.Items[k]:=FloatToStr(a); //dmMy.cdsD_TName.AsString+'  '+FloatToStr(a);
               bol:=1;  break;
               end
               else begin
                a:= StrToInt(lbDiag2.Items[k]);
               a:=a+dmMy.cdsD_Tkolvo.Value;
               lbDiag2.Items[k]:=FloatToStr(a); //dmMy.cdsD_TName.AsString+'  '+FloatToStr(a);
               bol:=1;  break;
               end;

               end;
          end;

      if(bol=0)then begin
      if(dmMy.cdsD_TSHIPMENT.Value=0)then begin
        lbDiag1.items.Add(dmMy.cdsD_Tkolvo.AsString);//dmMy.cdsD_TName.AsString+'  '+dmMy.cdsD_Tkolvo.AsString);
        lbDiag2.items.Add('0');
      end
      else
      begin
        lbDiag2.items.Add(dmMy.cdsD_Tkolvo.AsString);//dmMy.cdsD_TName.AsString+'  '+dmMy.cdsD_Tkolvo.AsString);
        lbDiag1.items.Add('0');
      end;
    lbDiag5.items.Add(dmMy.cdsD_TName.AsString);
    lbDiag3.Items.Add(dmMy.cdsD_TDATE.AsString+dmMy.cdsD_TTovarID.AsString+dmMy.cdsClientID.AsString+dmMy.cdsD_TClientID.AsString);
    end;
    end;
     end;
    //end;


    dmMy.cdsD_T.Next;
    end;
end;

procedure TfmDiag.btnDiagClick(Sender: TObject);

var dx,colX,x,y,y1,y2,i,kol,kolRows,n:integer;
rasX:real;

max,sum:single;
cl: Tcolor;
s: string;
begin
  Image1.Picture := nil;
  Image2.Picture := nil;
  //dm.DCOMConnection1.AppServer.smQueryClear;
  //dm.cdsQuery.Close;

  //dm.DCOMConnection1.AppServer.smQueryAdd(
  //'select * from report1('''+DateToStr(DateTimePicker1.Date)+''','''+
  // DateToStr(DateTimePicker2.Date) + ''')');

  // dm.DCOMConnection1.AppServer.smQueryAdd('where out_id in(');
   //if lbID.Count > 0 then
    //begin
    //  for i := 0 to lbID.Count - 2 do
    //     dm.DCOMConnection1.AppServer.smQueryAdd(lbID.Items[i] + ',');
    //     dm.DCOMConnection1.AppServer.smQueryAdd(lbID.Items[lbID.Count - 1]);
    //end;

   // ShowMessage(IntToStr(DBGrid2.DataSource.DataSet.RecordCount));

    //dm.DCOMConnection1.AppServer.smQueryAdd(')');
    //dm.cdsQuery.Open;
    //dm.cdsQuery.Last;
    //DataSource1.DataSet := dm.cdsQuery;
    //dm.cdsQuery.First;
    max := 0;kol:=0;
    for i:=0 to lbDiag5.Count-1 do
   // while not dm.cdsQuery.Eof do
    begin
     if max < StrToInt(lbDiag1.Items[i]) then
       max :=  StrToInt(lbDiag1.Items[i]);
        if max < StrToInt(lbDiag2.Items[i]) then
       max :=  StrToInt(lbDiag2.Items[i]);
      inc(kol);

    end;

    dx := 40;
    n:=lbDiag1.Count;
    colx := (Image1.ClientWidth - 2 * dx - n * dx)div (2 * n);  // Ширина

    Image1.Canvas.Pen.Width := 3;
    Image1.Canvas.MoveTo(dx - Image1.Canvas.Pen.Width,dx);
    Image1.Canvas.LineTo(dx - Image1.Canvas.Pen.Width,Image1.ClientHeight-dx+image1.Canvas.Pen.Width div 2);
    Image1.Canvas.LineTo(Image1.clientWidth-dx,Image1.ClientHeight-dx+image1.Canvas.Pen.Width div 2);
    image1.Canvas.Pen.Width := 1;

    x := dx;

    {dm.cdsProducts.First;
    while not dm.cdsProducts.Eof do
    begin
      inc(kol);
      dm.cdsProducts.Next;
    end;     } kol:=lbDiag5.Count;
    // УСтановка расстояния между объектами
    rasX := (Image1.clientWidth-2 * dx) / (kol * 1.2);

    image1.Canvas.Pen.Width := 1;
    //dm.cdsProducts.First;
   { for i:=0 to lbDiag5.Count-1 do
    begin
      //Белый цвет текста
      Image1.Canvas.Brush.Color := clWhite;
      s :=  lbDiag5.Items[i];
      Image1.canvas.TextOut(round(x+rasX),Image1.ClientHeight - 12,s);
      Image1.Canvas.Brush.Color := clBlack;
      Image1.Canvas.MoveTo(round(x+rasX),Image1.ClientHeight - 12);
      Image1.Canvas.LineTo(round(x+rasX),0);
      x := x + round(rasx);

    end;    }


   { for i:=0 to lbDiag5.Count-1 do
    begin
      Image1.Canvas.Brush.Color := clWhite;
      s :=  lbDiag5.Items[i];//dm.cdsQuery.FieldByName('out_name').AsString;
      Image1.canvas.TextOut(round(x+rasX),Image1.ClientHeight - 12,s);
      Image1.Canvas.Brush.Color := clBlack;
      Image1.Canvas.MoveTo(round(x+rasX),Image1.ClientHeight - 12);
      Image1.Canvas.LineTo(round(x+rasX),0);
      x := x + round(rasx);

    end; }

    x := dx; // x - текущий левый угол
    y1 := dx;
    y := Image1.ClientHeight - dx;

     image1.Canvas.Pen.Width := 2;
   // dm.cdsQuery.First;
    //while not dm.cdsQuery.Eof do
    for i:=0 to lbDiag5.Count-1  do
    begin
      Image1.Canvas.MoveTo(x,y) ;
      y:=dx+ round((Image1.ClientHeight - 2*dx) *
      (max - strToInt(lbDiag1.Items[i]))/max);
      y2:= dx+ round((Image1.ClientHeight - 2*dx) *
      (max - strToInt(lbDiag2.Items[i]))/max);
     { Image1.Canvas.MoveTo(x,y);
      y := dx + round((Image1.ClientHeight - 2*dx) *
      (max - strToInt(lbDiag1.Items[i]))/max);//Расчитали высоту
      }
      //Начинаем рисовать
      Randomize;
      cl := rgb(random(256),random(256),random(256));

      Image1.Canvas.Brush.Color := cl;
      //Image1.Canvas.LineTo(x,y);
      Image1.Canvas.MoveTo(x,y);{
       //2

       //x := x + colX; //   }
          x := round(x + rasX/2);
       Image1.Canvas.Brush.Color := clWhite;
       s := lbDiag1.Items[i];
       image1.canvas.TextOut(x - image1.Canvas.TextWidth(s), y - image1.Canvas.TextHeight(s),s);

     // y := dx + round((Image1.ClientHeight - 2*dx) *  //
     //(max - dm.cdsQuery.FieldByName('OUT_outKOLVO').AsFloat)/max);//Расчитали высоту //
     // x := x + colx;     }
      Image1.Canvas.Brush.Color := cl;

      Image1.Canvas.Rectangle(x,Image1.ClientHeight-dx,x+colX,y);
        x := round(x + rasX/2);
       Image1.Canvas.Rectangle(x,Image1.ClientHeight-dx,x+colX,y2);
       Image1.Canvas.Brush.Color := clWhite;
       s := lbDiag2.Items[i];
       image1.canvas.TextOut(x - image1.Canvas.TextWidth(s), y2 - image1.Canvas.TextHeight(s),s);
      Image2.Canvas.Font.Color := cl;
      Image2.Canvas.TextOut(dx,y1,lbDiag5.Items[i]);

      y1 := y1 + 2 + Image2.Canvas.TextHeight(
          lbDiag5.Items[i]);


    end;
end;

{var i,j,k,l:integer;

begin

 for i:=0 to lbDiag1.Count-1 do begin
    for j:= length(lbDiag1.Items[i]) downto 1 do
      if( lbDiag1.Items[i][j]=' ')then break;

 chartDiag.Series[0].Add( StrToFloat(Copy(lbDiag1.Items[i],j+1,length(lbDiag1.Items[i])-j)));
    end;

     for i:=0 to lbDiag2.Count-1 do begin
    for j:= length(lbDiag2.Items[i]) downto 1 do
      if( lbDiag2.Items[i][j]=' ')then break;

 chartDiag.Series[1].Add( StrToFloat(Copy(lbDiag2.Items[i],j+1,length(lbDiag2.Items[i])-j)));
 //chartDiag.Series[0].Labels.Add(Copy(lbDiag2.Items[k],1,j-2));
 //chartDiag.Series[0].Labels[i].Value:= ;
    end; }


end.
