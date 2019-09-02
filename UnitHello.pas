unit UnitHello;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, registry;

type
  TFormHello = class(TForm)
    Edit1: TEdit;
    RichEdit1: TRichEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHello: TFormHello;

implementation

{$R *.dfm}

uses Unit1, UnitHelloKey;

procedure TFormHello.Button1Click(Sender: TObject);
var
  regfile: TRegistry;
begin
  regfile := TRegistry.Create;
  regfile.RootKey := HKEY_CURRENT_USER;
  regfile.OpenKey('\John\Key', false);
  //regfile.OpenKey('\EUDI\john\ent', true);
  regfile.WriteString('ent', Edit1.Text);

 // ShowMessage(regfile.ReadString('res'));
  if not(Edit1.Text = formHelloKey.md5(regfile.ReadString('res') + 'John')) then
    RichEdit1.Lines[1] := 'Неверный ключ!'
  else
  begin
    FormHello.Close;
   // form1.FormShow(self);
  end;
  regfile.Free;
end;

end.
