unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmNewClient = class(TForm)
    lbName: TLabel;
    lbAdress: TLabel;
    edName: TEdit;
    edAdress: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewClient: TfmNewClient;

implementation

{$R *.dfm}

procedure TfmNewClient.edNameChange(Sender: TObject);
begin
btnOk.Enabled:=(edName.Text<>'')and(edAdress.Text<>'');
end;

end.
