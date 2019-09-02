unit UnitMakers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, ShellAPI;

type
  TFormMakers = class(TForm)
    RichEdit1: TRichEdit;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakers: TFormMakers;

implementation

{$R *.dfm}

procedure TFormMakers.Button2Click(Sender: TObject);
begin
ShellExecute(0, 'open', 'https://vk.com/id291474970', '', '', SW_SHOWNORMAL);
end;

procedure TFormMakers.FormShow(Sender: TObject);
var i : integer;
begin
end;

end.
