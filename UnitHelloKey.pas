unit UnitHelloKey;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.jpeg, ClipBrd, IdGlobal, IdHash, IdHashMessageDigest,
  Vcl.StdCtrls, Vcl.ComCtrls, shellapi, registry;

type
  TFormHelloKey = class(TForm)
    RichEdit1: TRichEdit;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    function md5(s: string): string;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHelloKey: TFormHelloKey;
  Uid: TGuid;
  key, Result: String;

implementation

{$R *.dfm}

uses UnitHello;


function TFormHelloKey.md5(s: string): string;
begin
  Result := '';
  with TIdHashMessageDigest5.Create do
    try
      Result := AnsiLowerCase(HashStringAsHex(s));
    finally
      Free;
    end;
end;

procedure TFormHelloKey.Button1Click(Sender: TObject);
begin
  Edit1.CopyToClipboard;
  ShellExecute(Handle, 'open', PChar('https://vk.com/hahanov'), nil, nil,
    SW_SHOWNORMAL);
end;

procedure TFormHelloKey.Button2Click(Sender: TObject);
begin
  Edit1.CopyToClipboard;
  ShellExecute(Handle, 'open', PChar('https://vk.com/id291474970'), nil, nil,
    SW_SHOWNORMAL);
end;

procedure TFormHelloKey.Button3Click(Sender: TObject);
begin
formhello.showmodal;
  FormHelloKey.Close;
end;

procedure TFormHelloKey.Button4Click(Sender: TObject);
begin
FormHelloKey.Close;
end;

procedure TFormHelloKey.FormCreate(Sender: TObject);
var
  regfile: TRegistry;
begin
  regfile := TRegistry.Create;
  regfile.RootKey := HKEY_CURRENT_USER;

  if not regfile.KeyExists('\John\Key') then
  begin
    CreateGUID(Uid);
    Result := GUIDToString(Uid);
    key := md5(Result + 'John');
    regfile.OpenKey('\John\Key', true);
    regfile.WriteString('res', Result);
    //regfile.OpenKey('\EUDI\john\ent', true);
  end;

  regfile.OpenKey('\John\Key', true);
  Edit1.Text := regfile.ReadString('res');
  regfile.Free;
end;

end.
