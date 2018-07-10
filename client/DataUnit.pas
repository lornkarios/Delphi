unit DataUnit;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect,Windows, Messages,  Variants,  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TdmMy = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    cdsTovar: TClientDataSet;
    cdsClient: TClientDataSet;
    cdsDogovor: TClientDataSet;
    cdsD_T: TClientDataSet;
    cdsReport: TClientDataSet;
    cdsTovarID: TIntegerField;
    cdsTovarName: TStringField;
    cdsTovarCost: TFloatField;
    cdsClientID: TIntegerField;
    cdsClientName: TStringField;
    cdsClientAdress: TStringField;
    cdsDogovorID: TIntegerField;
    cdsDogovorClientID: TIntegerField;
    cdsDogovorDate: TDateField;
    cdsDogovoroplataN: TIntegerField;
    cdsDogovorClientName: TStringField;
    cdsDogovorClientAdress: TStringField;
    cdsDogovorNal: TStringField;
    cdsDogovorTOTALSUM: TFloatField;
    cdsD_TTovarID: TIntegerField;
    cdsD_TDogovorID: TIntegerField;
    cdsD_Tkolvo: TIntegerField;
    cdsD_TDATE: TDateField;
    cdsD_TSHIPMENT: TSmallintField;
    cdsD_TName: TStringField;
    cdsD_TPrice: TFloatField;
    cdsD_TSum: TFloatField;
    cdsD_TOtgruz: TStringField;
    cdsTMP: TClientDataSet;
    cdsTMPID: TIntegerField;
    cdsTMPName: TStringField;
    cdsTMPKolvo: TIntegerField;
    cdsTMPKolvoOt: TIntegerField;
    cdsD_TClientID: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsDogovorCalcFields(DataSet: TDataSet);
    procedure cdsD_TCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMy: TdmMy;

implementation

{$R *.dfm}

procedure TdmMy.DataModuleCreate(Sender: TObject);
begin
cdsTovar.Open;
cdsClient.Open;
cdsClient.AddIndex('idx1','id',[]);
cdsClient.AddIndex('idx2','name;id',[]);
cdsClient.AddIndex('idx3','adress;id',[]);
cdsClient.IndexFieldNames:='id';

cdsDogovor.Open;
cdsD_T.Open;

cdsDogovor.AddIndex('indxID','ID',[],'','');
cdsDogovor.IndexFieldNames:='ID';
cdsD_T.AddIndex('indxID','DogovorID;TovarID',[],'','');
cdsD_T.IndexFieldNames:='DogovorID;TovarID';
cdsClient.AddIndex('indxID','ID',[],'','');
cdsClient.IndexFieldNames:='ID';
 //cdsTovar.AddIndex('indxID','ID',[],'','');
//cdsTovar.IndexFieldNames:='ID';
end;

procedure TdmMy.DataModuleDestroy(Sender: TObject);
begin
DCOMConnection1.Close;
end;

procedure TdmMy.cdsDogovorCalcFields(DataSet: TDataSet);
begin
     if cdsClient.Locate('ID',VarArrayOf([cdsDogovorClientID.Value]),[])then begin
     cdsDogovorClientName.Value:=cdsClientName.Value;
     cdsDogovorClientAdress.Value:=cdsClientAdress.Value;
     if(cdsDogovoroplataN.Value=1)then
     cdsDogovorNal.Value:='Наличный'
     else
       cdsDogovorNal.Value:='Безналичный';
     end;
end;

procedure TdmMy.cdsD_TCalcFields(DataSet: TDataSet);
begin
if(cdsD_TSHIPMENT.Value=0)then  begin
cdsD_TSum.Value:=cdsD_Tkolvo.Value*cdsD_TPrice.Value*0.3;
cdsD_TOtgruz.Value:='Положен к отгрузке'
end
else  begin
cdsD_TSum.Value:=cdsD_Tkolvo.Value*cdsD_TPrice.Value;
cdsD_TOtgruz.Value:='Отгружен';
end
end;

end.
