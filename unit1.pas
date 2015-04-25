unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

var dx,dy,sx,sy,xmin,xmax,ymin,ymax,radius:integer;

procedure clear();
begin
  Form1.Image1.Canvas.Pen.Color:= clwhite;
  Form1.Image1.Canvas.Brush.Color:= clwhite;
  Form1.Image1.Canvas.Rectangle(Form1.Image1.ClientRect);
  Form1.Image1.Canvas.Pen.Color:= clblack;
  Form1.Image1.Canvas.Brush.Color:= clwhite;

end;

procedure createTerc();
begin
  Form1.Image1.Canvas.Brush.Color:= clwhite;
end;

procedure elips(x,y,r:integer);
begin

  Form1.Image1.Canvas.Ellipse(x-r,y-r,x+r,y+r);
end;

procedure setUpValues();
begin
  Randomize;
  dx    := 1+ random(5);
  dy    := dx;
  radius:= 15 + random(10);
  xmin  := radius;
  xmax  := Form1.Image1.Canvas.Width - radius;
  ymin  := radius;
  ymax  := Form1.Image1.Canvas.Height - radius;
  sx    := xmin + random(xmax - radius);
  sy    := ymin + random(ymax - radius);
end;

procedure getNewValues();
begin
  if ((sx + dx) >= xmax) then dx:= -dx;
  if ((sx + dx) <= xmin) then dx:= -dx;
  if ((sy + dy) >= ymax) then dy:= -dy;
  if ((sy + dy) <= ymin) then dy:= -dy;
  sx += dx;
  sy += dy;
end;

procedure flowingCircle();
begin
  clear();
  getNewValues();
  elips(sx,sy,radius);
end;

///==========================================================================\\\
///==========================================================================\\\
///==========================================================================\\\

procedure TForm1.Button1Click(Sender: TObject); //start/stop maniamation
begin
  if (Form1.Timer1.Enabled = true) then Form1.Timer1.Enabled:= false
                                   else Form1.Timer1.Enabled:= true;
end;

procedure TForm1.Button2Click(Sender: TObject); //setInterval
var x:integer;
begin
  x:= StrToIntDef(Form1.Edit1.Text, (15 + random(40)));
  Form1.Timer1.Interval:=x;
end;

procedure TForm1.Button3Click(Sender: TObject); // set posun
var x:integer;
begin
  Randomize;
  x := StrToIntDef(Form1.Edit2.Text, 1+ random(5));
  dx:=x;
  dy:=x;
end;

procedure TForm1.Button4Click(Sender: TObject); // RANDOM BRUSH COLOR === TODO
begin
  Randomize;
  Form1.Image1.Canvas.Brush.Color:= 1+ random(256*256*256);
end;

procedure TForm1.FormCreate(Sender: TObject); // SETUPPPPP
begin
  Form1.Timer1.Enabled:= false;
  Form1.Timer1.Interval:= 20;
  clear();
  setUpValues();
end;

procedure TForm1.Timer1Timer(Sender: TObject); // WHOU TIMER
begin
  flowingCircle();
end;

end.


















