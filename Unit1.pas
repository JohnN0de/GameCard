unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.MPlayer, Registry, comObj;

type
  TForm1 = class(TForm)
    B1: TImage;
    B2: TImage;
    B3: TImage;
    B4: TImage;
    B5: TImage;
    B6: TImage;
    B7: TImage;
    B8: TImage;
    B9: TImage;
    B10: TImage;
    B11: TImage;
    B12: TImage;
    B13: TImage;
    Card: TImage;
    Slot: TImage;
    TimerDragAnimation: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    TimerScore: TTimer;
    MediaPlayerMenu: TMediaPlayer;
    MediaPlayerGame: TMediaPlayer;
    StatusBar1: TStatusBar;
    PanelUI: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Label1: TLabel;
    Button3: TButton;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure StartGame(Count: byte);
    procedure Duplicate(out First, Second: TImage);
    procedure RandomizeCards(CountToSlots: byte);
    procedure MoveCardToSlot(Card, ToSlot: TImage);
    procedure TicAnimation(Sender: TObject);
    function ImNad(Card: TImage): TImage;
    function ImPod(Card: TImage): TImage;
    function ImName(Card: TImage): String;
    procedure SetPod(Card: TImage; text: string);
    procedure SetNad(Card: TImage; text: string);
    procedure Check;
    procedure OpenCard(Card: TImage);
    function Perfomans(First, Second: TImage): Boolean;
    function PerfomansI(First, Second: TImage): Boolean;
    function isOpen(CardCk: TImage): Boolean;
    procedure CheckDeck(Card: TImage);
    procedure DeckRemove(Card: TImage);
    procedure CheckWin;
    procedure DestroyGame;
    procedure CheckActivate;
    procedure CardDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CardDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure CardStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure N1Click(Sender: TObject);
    procedure CardClick(Sender: TObject);
    procedure TimerScoreTimer(Sender: TObject);
    procedure MediaPlayerGameNotify(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure MediaPlayerMenuNotify(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    ArIm: array [0 .. 14] of TImage;
    GameCard: array [byte] of TImage;
    Slots: array [0 .. 9] of TImage;
    Moving: array [byte, 1 .. 2] of TImage;
    // SpeedMove: array[byte, 1 .. 2] of ShortInt;
    CountMove: byte;
    CardAnimation: TImage;
    MouseStartAnimation: TPoint;
    ImageStartAnimation: TPoint;
    DeckRemoved: byte;
    Score: Integer;
    CountMoves: Word;
    ActivateGame: Boolean;
    Table: Variant;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UnitMakers, UnitHello, UnitHelloKey;// UnitStartHello;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table.workbooks[1].saveas(ExtractFilePath(application.ExeName) +
    'Records.xls');
  Table.activeworkbook.Close;
  Table.application.quit;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Table := CreateOleObject('Excel.application');
  Table.displayalerts := false;
  if (FileExists('Records.xls')) then
    Table.workbooks.open(ExtractFilePath(application.ExeName) + 'Records.xls')
  else
    Table.workbooks.add;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
 //rmStartHello.ShowModal;
  CheckActivate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: byte;
begin
 // FormStartHello.ShowModal;
  MediaPlayerMenu.Play;
  for i := 0 to Form1.ComponentCount - 1 do // Внесение карт в массив
  begin
    if Components[i] is TImage then
    begin
      ArIm[i] := (Components[i] as TImage);
      ArIm[i].Visible := false;
    end;
  end;
  // StartGame(10);
end;

procedure TForm1.StartGame(Count: byte);
var
  i, j, e: byte;
begin
  MediaPlayerMenu.Stop;
  MediaPlayerGame.Play;
  MediaPlayerGame.Notify := true;
  PanelUI.Visible := false;
  e := 0;
  for j := 0 to Count - 1 do // Внесение слотов в массив
  begin
    Duplicate(Slots[j], Slot);
    Slots[j].left := 100 * j + 5;
  end;
  for j := 0 to Count - 3 do
    for i := 0 to Length(ArIm) - 3 do // Созадние копий карт
    begin
      Duplicate(GameCard[e], ArIm[i]);
      GameCard[e].Picture := Card.Picture;
      GameCard[e].left := ClientWidth - GameCard[e].Width;
      GameCard[e].Top := ClientHeight - GameCard[e].Height;
      inc(e);
    end;
  ShowMessage('Всего карт: ' + e.ToString);
  RandomizeCards(e div 2 + 2); // Расфасовывание карт
end;

procedure TForm1.DestroyGame;
var
  i: byte;
begin
  try
    for i := 0 to Length(GameCard) - 1 do
      GameCard[i].Destroy;
    for i := 0 to Length(Slots) - 1 do
      Slots[i].Destroy;
  except

  end;
end;

procedure TForm1.TicAnimation(Sender: TObject); // Движение карт
var
  i: byte;
begin
  { for i := 0 to CountMove - 1 do
    begin
    // repeat
    if Moving[i, 1].left > Moving[i, 2].left then
    Moving[i, 1].left := Moving[i, 1].left - 1
    else if Moving[i, 1].left < Moving[i, 2].left then
    Moving[i, 1].left := Moving[i, 1].left + 1;
    if Moving[i, 1].Top > Moving[i, 2].Top then
    Moving[i, 1].Top := Moving[i, 1].Top - 1
    else if Moving[i, 1].Top < Moving[i, 2].Top then
    Moving[i, 1].Top := Moving[i, 1].Top + 1;
    // Moving[i, 1].left := Moving[i, 1].left + (SpeedMove[i, 1] div 10);
    // Moving[i, 1].Top := Moving[i, 1].Top + (SpeedMove[i, 2] div 10);
    // sleep(10);
    // until (Moving[i, 1].Left = moving[i, 2].Left) and (Moving[i, 1].Top = Moving[i, 2].Top) ;
    end; }

  CardAnimation.left := ImageStartAnimation.X -
    (MouseStartAnimation.X - Mouse.CursorPos.X);
  CardAnimation.Top := ImageStartAnimation.Y -
    (MouseStartAnimation.Y - Mouse.CursorPos.Y);
end;

procedure TForm1.TimerScoreTimer(Sender: TObject);
begin
  dec(Score);
  StatusBar1.Panels[0].text := 'Кол-во очков: ' + Score.ToString;
end;

procedure TForm1.CheckActivate;
var
  regfile: TRegistry;
begin
  regfile := TRegistry.Create;
  regfile.RootKey := HKEY_CURRENT_USER;
  ActivateGame := false;
  if regfile.KeyExists('\John\Key') then
  begin
    regfile.OpenKey('\John\Key', true);
    ActivateGame := FormHelloKey.md5(regfile.ReadString('res') + 'John')
      = regfile.ReadString('ent');
  end;
  if not ActivateGame then
    FormHelloKey.ShowModal;
end;

procedure TForm1.RandomizeCards(CountToSlots: byte); // расфасовывание карт
var
  all: set of byte;
  i, r, c, DeckCard, d: byte;
  s: 0 .. 10;
  im, Temp: TImage;
begin
  // ShowMessage(CountToSlots.ToString);
  s := 0;
  c := 0;
  DeckCard := 1;
  all := [];
  for i := 0 to Length(GameCard) - 1 do // Внесение в набор всех копий карт
    if GameCard[i] <> nil then
      all := all + [i];

  while all <> [] do
  begin
    repeat
      Randomize;
      r := Random(255);
    until r in all;
    all := all - [r];
    inc(c);
    im := Slots[s];
    while (ImPod(im) <> nil) do
    begin
      im := ImPod(im);
    end;
    if c <= CountToSlots then
    begin
      MoveCardToSlot(GameCard[r], im);
      inc(s);
      if s = Length(Slots) then
        s := 0;
    end
    else
    begin
      inc(d);
      if d >= 10 then
      begin
        d := 0;
        Temp := nil;
        inc(DeckCard);
      end;
      GameCard[r].left := ClientWidth - GameCard[r].Width - 10 * DeckCard;
      GameCard[r].Top := ClientHeight - GameCard[r].Height - 50;
      GameCard[r].BringToFront;
      GameCard[r].OnClick := CardClick;
      if Temp <> nil then
        SetPod(GameCard[r], Temp.Name);
      Temp := GameCard[r];
    end;
  end;
  Check;
  TimerScore.Enabled := true;
  Score := 500;
end;

function TForm1.ImNad(Card: TImage): TImage;
begin
  Result := TImage(FindComponent(Copy(Card.Hint, 0, pos(';', Card.Hint) - 1)));
end;

function TForm1.ImPod(Card: TImage): TImage;
begin
  Result := TImage(FindComponent(Copy(Card.Hint, pos(';', Card.Hint) + 1)));
end;

function TForm1.ImName(Card: TImage): String;
begin
  if Card <> nil then
    Result := Copy(Card.Name, 2)
  else
    Result := '';
end;

procedure TForm1.SetPod(Card: TImage; text: String);
begin
  Card.Hint := Copy(Card.Hint, 0, pos(';', Card.Hint)) + text;
end;

procedure TForm1.SetNad(Card: TImage; text: string);
begin
  Card.Hint := text + Copy(Card.Hint, pos(';', Card.Hint));
end;

function TForm1.isOpen(CardCk: TImage): Boolean;
begin
  // ShowMessage(cardck.Picture.Height.ToString + ' ; ' + cardck.Width.ToString);
  Result := (CardCk.Picture.Height <> Card.Picture.Height) and
    (CardCk.Picture.Width <> Card.Picture.Width) and (ImName(CardCk) <> 'Slot');
end;

procedure TForm1.CheckDeck(Card: TImage);
var
  i: byte;
begin
  // ShowMessage(Card.Name);
  i := 0;
  while (PerfomansI(Card, ImNad(Card))) and (isOpen(ImNad(Card))) do
  begin
    Card := ImNad(Card);
    inc(i);
  end;
  if i = 12 then
    DeckRemove(Card);
end;

procedure TForm1.DeckRemove(Card: TImage);
begin
  // ShowMessage(Card.Name);
  SetPod(ImNad(Card), 'X');
  Card.left := 10 + 70 * DeckRemoved;
  Card.Top := ClientHeight - Card.Height - 50;
  While (ImPod(Card) <> nil) do
  begin
    Card := ImPod(Card);
    Card.left := 10 + 70 * DeckRemoved;
    Card.Top := ClientHeight - Card.Height - 50;
    Card.SendToBack;
  end;
  inc(DeckRemoved);
  Score := Score + 100;
  CheckWin;
  Check;
end;

procedure TForm1.CheckWin;
var
  value, str: string;
  i, c: byte;
begin
  c := 1;
  if DeckRemoved >= 8 then
  begin
     value := InputBox('Игра закончена!', 'Пожалуйста, укажите своё имя',
    'Безымянный');
    str := Table.workbooks[1].worksheets[1].cells.item[c, 1];
  while str <> '' do begin
    inc(c);
    str := Table.workbooks[1].worksheets[1].cells.item[c, 1];
  end;
  Table.workbooks[1].worksheets[1].cells.item[c, 1] := value;
  for i := 0 to 1 do
  begin
    Table.workbooks[1].worksheets[1].cells.item[c, i + 2] :=
      StatusBar1.Panels[i].text;
  end;
    TimerScore.Enabled := false;
    MediaPlayerGame.Stop;
    MediaPlayerMenu.Play;
    MediaPlayerMenu.Notify := true;
    PanelUI.Visible := true;
    DestroyGame;
  end;
end;

procedure TForm1.Check;
var
  i: byte;
  select: TImage;
begin
  for i := 0 to Length(Slots) - 1 do
  begin
    select := Slots[i];
    if ImPod(select) <> nil then
      repeat
        select := ImPod(select);
        select.DragMode := dmManual;
      until ImPod(select) = nil;
    if ImName(select) <> 'Slot' then
      select.DragMode := dmAutomatic;
    CheckDeck(select);
    if (not isOpen(select)) then
      OpenCard(select);
    // ShowMessage(BoolToStr(isOpen(select)));
    while (PerfomansI(select, ImNad(select))) and (isOpen(ImNad(select))) do
    begin
      select := ImNad(select);
      select.DragMode := dmAutomatic;
    end;
  end;

end;

function TForm1.Perfomans(First, Second: TImage): Boolean;
begin
  if ImName(Second) <> 'Slot' then
    Result := strtoint(Copy(First.Name, 3)) > strtoint(Copy(Second.Name, 3))
  else
    Result := false;
end;

function TForm1.PerfomansI(First, Second: TImage): Boolean;
begin
  if (ImName(Second) <> 'Slot') and (Second <> nil) then
    Result := strtoint(Copy(Second.Name, 3)) = strtoint(Copy(First.Name, 3)) + 1
  else
    Result := false;
end;

procedure TForm1.OpenCard(Card: TImage);
begin
  Card.Picture := TImage(FindComponent(ImName(Card))).Picture;
end;

procedure TForm1.MediaPlayerGameNotify(Sender: TObject);
begin
  if MediaPlayerGame.NotifyValue = nvSuccessful then
  begin
    MediaPlayerGame.Play;
    MediaPlayerGame.Notify := true;
  end;

end;

procedure TForm1.MediaPlayerMenuNotify(Sender: TObject);
begin
  if MediaPlayerMenu.NotifyValue = nvSuccessful then
  begin
    MediaPlayerMenu.Play;
    MediaPlayerMenu.Notify := true;
  end;
end;

procedure TForm1.MoveCardToSlot(Card, ToSlot: TImage);
begin
  if (Copy(Card.Hint, 0, pos(';', Card.Hint) - 1) <> 'X') then
    SetPod(ImNad(Card), 'X');

  ToSlot.Hint := Copy(ToSlot.Hint, 0, pos(';', ToSlot.Hint)) + Card.Name;
  Card.Hint := ToSlot.Name + Copy(Card.Hint, pos(';', Card.Hint));
  Card.left := ToSlot.left;
  Card.Top := ToSlot.Top;
  Card.BringToFront;
  if (Copy(ToSlot.Name, 2) <> 'Slot') then
    Card.Top := Card.Top + 10;
  if isOpen(ToSlot) then
    Card.Top := Card.Top + 20;
  while (ImPod(Card) <> nil) and (ImNad(ImPod(Card)) <> nil) do
  begin
    Card := ImPod(Card);
    Card.left := ImNad(Card).left;
    Card.Top := ImNad(Card).Top + 30;
    Card.BringToFront;
  end;

end;

procedure TForm1.N1Click(Sender: TObject);
begin
  StartGame(10);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Table.Visible := true;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  FormMakers.ShowModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N9Click(Sender: TObject);
var
  value, str: string;
  c, i: byte;
begin
  c := 1;
  value := InputBox('Игра закончена!', 'Пожалуйста, укажите своё имя',
    'Безымянный');
    str := Table.workbooks[1].worksheets[1].cells.item[c, 1];
  while str <> '' do begin
    inc(c);
    str := Table.workbooks[1].worksheets[1].cells.item[c, 1];
  end;
  Table.workbooks[1].worksheets[1].cells.item[c, 1] := value;
  for i := 0 to 1 do
  begin
    Table.workbooks[1].worksheets[1].cells.item[c, i + 2] :=
      StatusBar1.Panels[i].text;
  end;

end;

procedure TForm1.CardClick(Sender: TObject);
var
  i: byte;
  Temp, tmp: TImage;
begin
  for i := 0 to Length(Slots) - 1 do
  begin
    Temp := Slots[i];
    while ImPod(Temp) <> nil do
      Temp := ImPod(Temp);
    MoveCardToSlot(TImage(Sender), Temp);
    TImage(Sender).OnClick := nil;
    if ImPod(TImage(Sender)) <> nil then
    begin
      tmp := ImPod(TImage(Sender));
      SetPod(TImage(Sender), 'X');
      TImage(Sender) := tmp;
    end;

  end;
  Check;
end;

procedure TForm1.CardDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  MoveCardToSlot(TImage(Source), TImage(Sender));
  Check;
  inc(CountMoves);
  StatusBar1.Panels[1].text := 'Кол-во ходов: ' + CountMoves.ToString;
end;

procedure TForm1.CardDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if ImName(TImage(Sender)) <> 'Slot' then
    Accept := (ImPod(Sender as TImage) = nil) and
      (strtoint(Copy(TImage(Sender).Name, 3)) >
      strtoint(Copy(TImage(Source).Name, 3)))
  else
    Accept := ImPod(TImage(Sender)) = nil;
  // ShowMessage(BoolToStr(Accept));
end;

procedure TForm1.CardStartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  TImage(Sender).BringToFront;
  CardAnimation := TImage(Sender);
  MouseStartAnimation := Mouse.CursorPos;
  ImageStartAnimation.X := TImage(Sender).left;
  ImageStartAnimation.Y := TImage(Sender).Top;
  TimerDragAnimation.Enabled := true;
end;

procedure TForm1.Duplicate(out First, Second: TImage); // Создание копии карты
var
  i: byte;
  Cr: char;
begin
  Cr := 'A';
  while FindComponent(Cr + Second.Name) <> nil do
    Cr := chr(ord(Cr) + 1);
  First := TImage.Create(Self);
  First.Parent := Self;
  First.Stretch := Second.Stretch;
  First.Name := Cr + Second.Name;
  First.Picture := Second.Picture;
  First.Width := Second.Width;
  First.Height := Second.Height;
  First.Hint := 'X;X';
  First.ShowHint := true;
  First.OnDragOver := CardDragOver;
  // First.Proportional := true;
  // if Second.Name <> 'Slot' then
  First.OnDragDrop := CardDragDrop;
  // First.OnStartDrag := CardStartDrag;
  // First.DragMode := dmAutomatic;
  // First.Left := 100;
  { for j := 1 to ImagePicture.Heigth div CountCells do
    for i := 1 to ImagePicture.Width div CountCells do
    CreateImage(ImagePicture.Heigth div CountCells * j,ImagePicture.Width div CountCells * i ); }
end;

end.
