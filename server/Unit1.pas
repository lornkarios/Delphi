unit Unit1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, myServer_TLB, StdVcl, Provider, IBTable, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBStoredProc;

type
  TMyD = class(TRemoteDataModule, IMyServerCl)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    ibtTovar: TIBTable;
    ibtClient: TIBTable;
    ibtDogovor: TIBTable;
    ibtD_T: TIBTable;
    dspTovar: TDataSetProvider;
    dspClient: TDataSetProvider;
    dspDogovor: TDataSetProvider;
    dspD_T: TDataSetProvider;
    dspQuery: TDataSetProvider;
    ibspUpdTov: TIBStoredProc;
    ibspDelTov: TIBStoredProc;
    ibspUpdCl: TIBStoredProc;
    ibspDelCl: TIBStoredProc;
    ibspUpdDog: TIBStoredProc;
    ibspDelDog: TIBStoredProc;
    ibspUpdD_T: TIBStoredProc;
    ibspDelD_T: TIBStoredProc;
    ibtClientID: TIntegerField;
    ibtClientName: TIBStringField;
    ibtClientAdress: TIBStringField;
    ibtTMP: TIBTable;
    dspTMP: TDataSetProvider;
    ibspUpdTMP: TIBStoredProc;
    ibspDelTMP: TIBStoredProc;
    ibtTMPID: TIntegerField;
    ibtTMPName: TIBStringField;
    ibtTMPKolvo: TIntegerField;
    ibtTMPKOLVOO: TSmallintField;
    ibtTovarID: TIntegerField;
    ibtTovarName: TIBStringField;
    ibtDogovorID: TIntegerField;
    ibtDogovorClientID: TIntegerField;
    ibtDogovorDate: TDateField;
    ibtDogovorTOTALSUM: TFloatField;
    ibtDogovorOPLATA: TFloatField;
    ibtD_TTovarID: TIntegerField;
    ibtD_TDogovorID: TIntegerField;
    ibtD_Tkolvo: TIntegerField;
    ibtD_TDATE: TDateField;
    ibtD_TOPLATA: TFloatField;
    ibtD_TPRICE: TFloatField;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure smUpdateTovar(ID: Integer; const Name: WideString); safecall;
    procedure smDeleteTovar(ID: Integer); safecall;
    procedure smUpdateClient(ID: Integer; const Name, Adress: WideString);
      safecall;
    procedure smDeleteClient(ID: Integer); safecall;
    procedure smUpdateDogovor(ID, ClientID: Integer; Date: TDateTime; totalsum,
      oplata: Double); safecall;
    procedure smDeleteDogovor(ID: Integer); safecall;

    procedure smDeleteD_T(TovarID, DogovorID: Integer); safecall;
    procedure smUpdateD_T(TovarID, DogovorID, kolvo: Integer; Date: TDateTime;
      OPLATA, PRICE: Double); safecall;
    procedure smSQLAddString(const s: WideString); safecall;
    procedure smSQLClear; safecall;
    procedure smSQLExecute; safecall;
    procedure smDeleteTMP(ID: Integer); safecall;
    procedure smUpdateTMP(ID: Integer; const Name: WideString; kolvo,
      kolvoo: Integer); safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TMyD.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TMyD.smUpdateTovar(ID: Integer; const Name: WideString);
begin
  if ibspUpdTov.Transaction.InTransaction then ibspUpdTov.Transaction.Commit;
  ibspUpdTov.Params[0].Value:=ID;
  ibspUpdTov.Params[1].Value:=Name;
  ibspUpdTov.ExecProc;
  if ibspUpdTov.Transaction.InTransaction then
  ibspUpdTov.Transaction.Commit;
end;

procedure TMyD.smDeleteTovar(ID: Integer);
begin
   if ibspDelTov.Transaction.InTransaction then ibspDelTov.Transaction.Commit;
  ibspDelTov.Params[0].Value:=ID;
  ibspDelTov.ExecProc;
  if ibspDelTov.Transaction.InTransaction then
  ibspDelTov.Transaction.Commit;
end;

procedure TMyD.smUpdateClient(ID: Integer; const Name,
  Adress: WideString);
begin
  if ibspUpdCl.Transaction.InTransaction then ibspUpdCl.Transaction.Commit;
  ibspUpdCl.Params[0].Value:=ID;
  ibspUpdCl.Params[1].Value:=Name;
  ibspUpdCl.Params[2].Value:=Adress;
  ibspUpdCl.ExecProc;
  if ibspUpdCl.Transaction.InTransaction then
  ibspUpdCl.Transaction.Commit;
end;

procedure TMyD.smDeleteClient(ID: Integer);
begin
   if ibspDelCl.Transaction.InTransaction then ibspDelCl.Transaction.Commit;
  ibspDelCl.Params[0].Value:=ID;
  ibspDelCl.ExecProc;
  if ibspDelCl.Transaction.InTransaction then
  ibspDelCl.Transaction.Commit;
end;

procedure TMyD.smUpdateDogovor(ID, ClientID: Integer;
  Date: TDateTime; totalsum, oplata: Double);
begin
    if ibspUpdDog.Transaction.InTransaction then ibspUpdDog.Transaction.Commit;
  ibspUpdDog.Params[0].Value:=ID;
  ibspUpdDog.Params[1].Value:=ClientID;
  ibspUpdDog.Params[2].Value:=Date;

  ibspUpdDog.Params[3].Value:=totalsum;
    ibspUpdDog.Params[4].Value:=oplata;
  ibspUpdDog.ExecProc;
  if ibspUpdDog.Transaction.InTransaction then
  ibspUpdDog.Transaction.Commit;
end;

procedure TMyD.smDeleteDogovor(ID: Integer);
begin
   if ibspDelDog.Transaction.InTransaction then ibspDelDog.Transaction.Commit;
  ibspDelDog.Params[0].Value:=ID;
  ibspDelDog.ExecProc;
  if ibspDelDog.Transaction.InTransaction then
  ibspDelDog.Transaction.Commit;
end;



procedure TMyD.smDeleteD_T(TovarID, DogovorID: Integer);
begin
     if ibspDelD_T.Transaction.InTransaction then ibspDelD_T.Transaction.Commit;
  ibspDelD_T.Params[0].Value:=TovarID;
  ibspDelD_T.Params[1].Value:=DogovorID;
  ibspDelD_T.ExecProc;
  if ibspDelD_T.Transaction.InTransaction then
  ibspDelD_T.Transaction.Commit;
end;

procedure TMyD.smUpdateD_T(TovarID, DogovorID, kolvo: Integer;
  Date: TDateTime; OPLATA, PRICE: Double);
begin
   if ibspUpdD_T.Transaction.InTransaction then ibspUpdD_T.Transaction.Commit;
  ibspUpdD_T.Params[0].Value:=TovarID;
  ibspUpdD_T.Params[1].Value:=DogovorID;
  ibspUpdD_T.Params[2].Value:=kolvo;
  ibspUpdD_T.Params[3].Value:=Date;
  ibspUpdD_T.Params[4].Value:=oplata;
    ibspUpdD_T.Params[5].Value:=PRICE;
  ibspUpdD_T.ExecProc;
  if ibspUpdD_T.Transaction.InTransaction then
  ibspUpdD_T.Transaction.Commit;
end;






procedure TMyD.smSQLAddString(const s: WideString);
begin

    IBQuery1.SQL.Add(s);
end;

procedure TMyD.smSQLClear;
begin
     if IBQuery1.Transaction.InTransaction then
    IBQuery1.Transaction.Commit;
    IBQuery1.Close;
    IBQuery1.SQL.Clear;
end;

procedure TMyD.smSQLExecute;
begin
    IBQuery1.Open;
    if IBQuery1.Transaction.InTransaction then
      IBQuery1.Transaction.Commit;
end;

procedure TMyD.smDeleteTMP(ID: Integer);
begin
  if ibspDelTMP.Transaction.InTransaction then  ibspDelTMP.Transaction.Commit;
   ibspDelTMP.Params[0].Value:=ID;
   ibspDelTMP.ExecProc;
  if  ibspDelTMP.Transaction.InTransaction then
   ibspDelTMP.Transaction.Commit;
end;

procedure TMyD.smUpdateTMP(ID: Integer; const Name: WideString;
  kolvo, kolvoo: Integer);
begin
        if ibspUpdTMP.Transaction.InTransaction then ibspUpdTMP.Transaction.Commit;
  ibspUpdTMP.Params[0].Value:=ID;
  ibspUpdTMP.Params[1].Value:=Name;
   ibspUpdTMP.Params[2].Value:=Kolvo;
   ibspUpdTMP.Params[3].Value:=Kolvoo;
  ibspUpdTMP.ExecProc;
  if ibspUpdTMP.Transaction.InTransaction then
  ibspUpdTMP.Transaction.Commit;
end;

initialization
  TComponentFactory.Create(ComServer, TMyD,
    Class_MyServerCl, ciMultiInstance, tmApartment);
end.
