unit UnitStartHello;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TFormStartHello = class(TForm)
    Timer1: TTimer;
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStartHello: TFormStartHello;
  i: byte;
implementation

{$R *.dfm}

uses Unit1;

procedure TFormStartHello.FormPaint(Sender: TObject);
var
  bitmap: Vcl.Graphics.TBitmap;
  rgn: HRGN;
begin
  bitmap := TBitmap.Create;
  bitmap.Width := screen.Width;
  bitmap.Height := screen.Height;

  bitmap.LoadFromFile
    ('C:\Users\Demo\Desktop\������\���������������� relese\Delphi\GameCard\Hello.bmp');
  //  form1.Canvas.CopyRect(rect(0,0,clientwidth, clientheight), bitmap.Canvas,rect(0,0,clientwidth, clientheight));
  Form1.Canvas.CopyRect( rect(300, 150, 812, 662),
    bitmap.Canvas, rect(0, 0, 512, 512));
  rgn := CreateRectRgn(300, 150, 812, 662);
  SetWindowRgn(Handle, rgn, true);

end;

procedure TFormStartHello.Timer1Timer(Sender: TObject);
begin
  inc(i);
  if i > 2 then
    close;
end;

end.
