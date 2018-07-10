unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmNewTovar = class(TForm)
    lbName: TLabel;
    lbCost: TLabel;
    edName: TEdit;
    edCost: TEdit;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure edCostKeyPress(Sender: TObject; var Key: Char);
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewTovar: TfmNewTovar;

implementation

{$R *.dfm}

procedure TfmNewTovar.FormActivate(Sender: TObject);
var i:integer;
begin
for i:=0 to ComponentCount -1 do
if Components[i] is TEdit then
  (Components[i] as TEdit).Text:='';
  btnOK.Enabled:=False;
end;

procedure TfmNewTovar.edCostKeyPress(Sender: TObject; var Key: Char);
begin
if((Key<'0')or(Key>'9'))and(Key<>#8)then
begin
  if(Key<>DecimalSeparator)or(pos(DecimalSeparator,edCost.Text)>0)then
    Key:=#0;
end;
end;

procedure TfmNewTovar.edNameChange(Sender: TObject);
var i:integer;
begin
btnOK.Enabled:=True;
for i:=0 to ComponentCount-1 do
if Components[i] is TEdit then
  btnOK.Enabled:=btnOK.Enabled and((Components[i] as TEdit).Text<>'');
end;

end.
