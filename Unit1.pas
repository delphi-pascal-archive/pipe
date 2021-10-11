unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Grid: TDrawGrid;
    Button1: TButton;
    Timer1: TTimer;
    Panel1: TPanel;
    Button2: TButton;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Map  : array [0..39,0..39] of Char;
  SX,SY,EX,EY,CX,CY,TOTAL,MAX: Integer;
  Exited : Boolean;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FormCreate(self);
  Grid.Repaint;
  Panel1.Caption := '';
  Total := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
var x,y : Integer;
begin
  Randomize;
  for x := 0 to 39 do
    for y := 0 to 39 do
      if (y = 0) or (x=0) or (x = 39) or (y=39) then
        map[x,y] := 'W' else Map[x,y] := 'F';
  SX := Random(38) + 1;
  SY := Random(38)+1;
  Randomize;
  EX := Random(38)+1;
  EY := Random(38)+1;

  CX := SX;
  CY := SY;
  Map[SX,SY] := 'S';
  Map[EX,EY] := 'E';
  Exited := false;
end;

procedure TForm1.GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var Color : TColor;
begin
  case Map[ACol,ARow] of
    'F' : Color := clSilver;
    'W' : Color := clBlack;
    'S' : Color := clRed;
    'E' : Color := clLime;
    'L' : Color := clAqua;
  end;
  Grid.Canvas.Brush.Color := Color;
  Grid.Canvas.FillRect(Grid.CellRect(ACol, ARow));
end;

procedure TForm1.GridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if Map[ACol, ARow] = 'F' then
    Map[ACol, ARow] := 'W';
  if GetKeyState(VK_CONTROL) < 0 then
    if Map[ACol, ARow] = 'W' then Map[ACol, ARow] := 'F';
end;

function Check(x,y : Integer) : Boolean;
begin
  Result := false;
  if cx > 39 then Exit;
  if cx < 0 then Exit;
  if cy > 39 then Exit;
  if cy < 0 then Exit;
  if Map[x,y] = 'E' then begin
    Result := true;
    Exited := true;
    Exit;
  end;
  if Map[x,y] <> 'F' then Exit;
  Result := true;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var NewX, NewY : Integer;
    Finded : Boolean;
begin
  Finded := false;
  if Check(CX+1, CY) then begin
    NewX := CX+1;
    NewY := CY;
    Finded := true;
  end;
  if Check(CX-1, CY) then begin
    NewX := CX-1;
    NewY := CY;
    Finded := true;
  end;
  if Check(CX, CY+1) then begin
    NewX := CX;
    NewY := CY+1;
    Finded := true;
  end;
  if Check(CX, CY-1) then begin
    NewX := CX;
    NewY := CY-1;
    Finded := true;
  end;
  if not Finded then begin
    Timer1.Enabled := false;
    ShowMessage('You Lose');

    Exit;
  end;
  Map[CX,Cy] := 'L';
  GridDrawCell(self, CX, Cy, Rect(0,0,0,0), []);
  if Exited then
    Timer1.Enabled := false;
  if Exited then
    ShowMessage('YouWin!');
  CX := NewX;
  CY := NewY;
  Inc(Total);
  Panel1.Caption := IntToStr(Total);
  if Total > Max then
    Max := Total;
  Panel2.Caption := IntToStr(Max);
end;


end.
