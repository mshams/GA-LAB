unit UPublic;

interface

uses classes, types, math, strutils, graphics, extctrls, grids;

const
  MC = 100; // max city
  MCR = 250; // max chromo

  ColorSet: array [0 .. 9] of integer = (clCream, clOlive, clred, clSilver, clYellow, clSkyBlue,
    clLime, clFuchsia, clAqua, clLtGray);

type

  SetOfByte = set of byte;

  TShp = Tpanel;

  TPointerProbRec = Record
    PValue: PSingle;
    Index: word;
  End;

  TChr = array [0 .. MC] of byte; // chromosome type
  TPop = array [0 .. MCR] of TChr; // population type
  TCol = array [0 .. 1] of TPop; // my GA collection
  TProb = array [0 .. MCR] of Single;
  TPointerProb = array [0 .. MCR] of TPointerProbRec;
  TPos = array [0 .. MC] of TPoint;
  TOutFitness = array of Single;

  TCity = array [0 .. MC, 0 .. MC] of Single;

  TPChr = ^TChr;
  TPPop = ^TPop;
  TPCol = ^TCol;
  TPCity = ^TCity;
  TPProb = ^TProb;
  TPPos = ^TPos;

  TProblem = (Tsp, NQueen, Secret, NColor, Knapsack, Knight, Square, Sudoku, Ssp, BPP, OPP, Kpath,
    CPP, LPP);

  TSecretMsgData = Record
    SecretMsg, CodedMsg: WideString;
    len: integer;

  const
    Alphabet: WideString = ' ابپتثجچحخدذرزژسشصضطظعغفقکگلمنوهی';
  End;

  TSspData = Record
    Strings: array of WideString;
    Lengths: array of byte;
    StringsCount, Ssplen, SspMaxlen: integer;
    SuperString: WideString;

  const
    Alphabet: WideString = '0123456789abcdefghijklmnopqrstuvwxyzابپتثجچحخدذرزژسشصضطظعغفقکگلمنوهی';
  End;

  TKnightPos = Record
    Row, Col: byte;
  End;

  TNColorData = Record
    Matrix: array [0 .. 9, 0 .. 9] of boolean;
    ColorCount: byte;
  End;

  TKnapsackData = Record
    Boxes: array [0 .. MC] of Record Weigth, Value: Single end;
    MaxWeigth, MaxValue: Single;
    KnapsackSize: Single; // Size of knapsack problem
  End;

  TPackagingData = Record
    Vols: array [0 .. MC] of Single;
    PacksCount: integer;
    PackSize: Single; // Size of packages
  End;

  TSudokuData = Record
    Bools: Array [0 .. 80] of boolean;
    // Pattern: Array [0..80] of byte;
    FilledCount: integer;
    Cells: Array [0 .. 8, 0 .. 8] of byte;
  End;

  TOppData = Record
    Grid: Array [0 .. 11, 0 .. 11] of byte;
    Distance, PointsCount: byte;
    PPos, DrawPPos: Array of TKnightPos;
  End;

  TKPathData = Record
    P1, P2: TKnightPos;
    PN1, PN2, len: byte;
  End;

  TCppData = Record
    Count, GridSize: byte;
    Vals: TByteDynArray;
    XYs: array of TKnightPos;
  End;

function RandomRangeX(a, b: integer): integer;
function iif(f: boolean; Atrue, Bfalse: variant): variant;
function Between(number, min, max: variant): boolean;
procedure Swap(var i: variant; var j: variant); overload;
procedure Swap(var C: TChr; Gene1, Gene2: integer); overload;
function SingleToStr(n: Single): string;
procedure QuickSort(var a: array of TPointerProbRec; iHi: integer);
Function has(const a: TChr; p, n1, n2: integer): boolean;
Function PosA(const a: TChr; max, val: integer): integer;
procedure SaveGrid2File(Grid: TStringGrid; filepath: string);
procedure LoadGridFromFile(var Grid: TStringGrid; filepath: string);
Function GetKnightPos(n: byte): TKnightPos; overload;
Function GetKnightPos(n, BoardLen: byte): TKnightPos; overload;

implementation

function Between(number, min, max: variant): boolean;
begin
  result := (number >= min) and (number <= max);
end;

function GetKnightPos(n: byte): TKnightPos; overload;
begin
  result.Row := n Div 8;
  result.Col := n Mod 8;
end;

function GetKnightPos(n, BoardLen: byte): TKnightPos; overload;
begin
  n := n - 1;
  result.Row := n Div BoardLen + 1;
  result.Col := n Mod BoardLen + 1;
end;

Function PosA(const a: TChr; max, val: integer): integer; // pos in array
var
  i: integer;
begin
  result := -1;
  for i := 0 to max do
    if a[i] = val then
    begin
      result := i;
      break;
    end;
end;

Function has(const a: TChr; p, n1, n2: integer): boolean;
var
  i: integer;
begin
  result := false;
  for i := n1 to n2 do
    if a[i] = p then
    begin
      result := true;
      break;
    end;
end;

procedure QuickSort(var a: array of TPointerProbRec; iHi: integer);
  procedure QuickSort(var a: array of TPointerProbRec; iLo, iHi: integer);
  var
    Lo, Hi: integer;
    Mid: Single;
    t: TPointerProbRec;
  begin
    Lo := iLo;
    Hi := iHi;

    Mid := a[(Lo + Hi) div 2].PValue^;
    repeat
      while a[Lo].PValue^ < Mid do
        Inc(Lo);
      while a[Hi].PValue^ > Mid do
        Dec(Hi);
      if Lo <= Hi then
      begin
        t := a[Lo];
        a[Lo] := a[Hi];
        a[Hi] := t;
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then
      QuickSort(a, iLo, Hi);
    if Lo < iHi then
      QuickSort(a, Lo, iHi);
  end;

begin
  QuickSort(a, Low(a), iHi);
end;

function SingleToStr(n: Single): string;
begin
  result := '';
  Str(RoundTo(n, -4): 0: 3, result);
  result := leftstr(result, 8);
end;

function RandomRange(const AFrom, ATo: integer): integer;
begin
  if AFrom > ATo then
    result := Random(AFrom - ATo) + ATo
  else
    result := Random(ATo - AFrom) + AFrom;
end;

function RandomRangeX(a, b: integer): integer;
begin
  // randomize;   //a<=X<=b
  result := RandomRange(a, b + 1);
end;

function iif(f: boolean; Atrue, Bfalse: variant): variant;
begin
  if f = true then
    result := Atrue
  else
    result := Bfalse;
end;

procedure Swap(var i: variant; var j: variant); overload;
var
  tmp: variant;
begin
  tmp := i;
  i := j;
  j := tmp;
end;

procedure Swap(var C: TChr; Gene1, Gene2: integer); overload; // swap 2 value
var
  tmp: variant; // EX: swap(cr[1,n,b],cr[1,n,c]);
begin
  tmp := C[Gene1];
  C[Gene1] := C[Gene2];
  C[Gene2] := tmp;
end;

procedure SaveGrid2File(Grid: TStringGrid; filepath: string);
var
  list: TStrings;
  i: integer;
begin

  list := TStringList.Create;
  try
    for i := 0 to Grid.RowCount - 1 do
      list.AddStrings(Grid.Rows[i]);
    list.SaveToFile(filepath);
  finally
    list.Free;
  end;

end;

procedure LoadGridFromFile(var Grid: TStringGrid; filepath: string);
var
  list: TStrings;
  i, j: integer;
begin

  list := TStringList.Create;
  try
    list.LoadFromFile(filepath);

    for i := 0 to Grid.RowCount - 1 do
      for j := 0 to Grid.RowCount - 1 do
        Grid.Cells[j, i] := list.Strings[i * Grid.RowCount + j];
  finally
    list.Free;
  end;
end;

end.
