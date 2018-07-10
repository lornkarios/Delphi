unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfmDogovor = class(TForm)
    lbDate: TLabel;
    dtpDate: TDateTimePicker;
    rbNal: TRadioButton;
    rbBeznal: TRadioButton;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDogovor: TfmDogovor;

implementation

uses Unit3, DataUnit;

{$R *.dfm}





procedure TfmDogovor.FormActivate(Sender: TObject);
begin
dtpDate.DateTime:= now;
end;

end.
