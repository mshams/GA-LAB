unit UGAthread;

interface

uses
  Classes, Windows, SysUtils, graphics, UPublic, stdctrls, math, strutils, comctrls;

type

  TGAthread = class(TThread)
  private
    GenerNumber: integer;
    { Private declarations }
  protected
    GUIlabel: TStatuspanel;
    GUIi: integer;

    procedure Execute; override;

    Procedure InitPopulationTsp;
    Procedure InitPopulationNColor;
    Procedure InitPopulationKnapsack;
    Procedure InitPopulationSecret;
    Procedure InitPopulationSquare;
    Procedure InitPopulationSudoku;
    Procedure InitPopulationSsp;
    Procedure InitPopulationBpp;
    Procedure InitPopulationOpp;
    Procedure InitPopulationCpp;

    Procedure MakeFitnesses;
    Function Fitness(const C: TChr): Single;

    procedure PenaltyTsp(var Result: Single; const C: TChr);
    procedure PenaltySecret(var Result: Single; const C: TChr);
    procedure PenaltyNQueen(var Result: Single; const C: TChr);
    procedure PenaltyKnight(var Result: Single; const C: TChr);
    procedure PenaltyKnapsack(var Result: Single; const C: TChr);
    procedure PenaltyNColor(var Result: Single; const C: TChr);
    procedure PenaltySquare(var Result: Single; const C: TChr);
    procedure PenaltySudoku(var Result: Single; const C: TChr);
    procedure PenaltySsp(var Result: Single; const C: TChr);
    procedure PenaltyBpp(var Result: Single; const C: TChr);
    procedure PenaltyOpp(var Result: Single; const C: TChr);
    procedure PenaltyKpp(var Result: Single; const C: TChr);
    procedure PenaltyCpp(var Result: Single; const C: TChr);
    procedure PenaltyLpp(var Result: Single; const C: TChr);

    Procedure Selection;
    Procedure Mutation;
    Function Convergency: boolean;
    Procedure Elitism;
    Procedure FindElite;

    Function SelRoulette(NoThis: integer): integer; // roulette wheel
    Procedure SelRankLinear(var a, b: integer);
    Procedure SelRankExponential(var a, b: integer; Sp: Single = 1.5);
    Procedure SelRankBiased1(var a, b: integer; Sp: Single = 1.5);
    Procedure SelRankBiased2(var a, b: integer; Sp: Single = 1.5);
    Procedure SelRankNonLinear(var a, b: integer; Sp: Single = 0.9);
    Procedure SelScalingLinear(var a, b: integer; factor: integer = 2);
    Procedure SelScalingExp(var a, b: integer);
    Procedure SelTruncation(var a, b: integer; Tr: integer = 15);
    Procedure SelBoltzman(var a, b: integer);
    Function SelTournamentRnd(Size: integer; Pta: Single): integer;
    Function SelTournamentUniq(Size: integer): integer;
    Function MiniRoullete(TotalRank: Single): integer;

    Procedure Cross1pt(const a, b: TChr; var c1, c2: TChr; n: integer = -1);
    Procedure Cross2pt(const a, b: TChr; var c1, c2: TChr);
    Procedure CrossUniform(const a, b: TChr; var c1, c2: TChr);
    Procedure Crossover2(const a, b: TChr; var c1, c2: TChr; Mode: byte = 1); // Single crossover
    Procedure CrossGST(a, b, t: integer); // smart crossover
    Procedure CrossGSX(const a, b: TChr; var c1, c2: TChr);
    Procedure CrossGreedy1pt(a, b: TChr; var c1, c2: TChr);
    Procedure CrossGreedy2(const a, b: TChr; var c1, c2: TChr);
    Procedure CrossPMX(const a, b: TChr; var c1, c2: TChr);

    Procedure Mutation2optFull(var Ch: TChr);
    Procedure Mutation2optRnd(var Ch: TChr);
    Procedure MutationKnighCycle(var Ch: TChr);
    Procedure MutationRndVal(var Ch: TChr);
    Procedure MutationFlip(var Ch: TChr);
    Procedure MutationInversion(var Ch: TChr);
    Procedure MutationSwap(var Ch: TChr);
    Procedure MutationGreedyLop(var Ch: TChr);

    procedure GUISetLabels;
    Procedure GUItxtupdate(l: TStatuspanel; i: integer);

    Procedure GUIDrawSolutionTsp;
    Procedure GUIDrawSolutionNColor;
    Procedure GUIDrawSolutionSecret;
    Procedure GUIDrawSolutionNQueen;
    Procedure GUIDrawSolutionKnight;
    Procedure GUIDrawSolutionKnapsack;
    Procedure GUIDrawSolutionSquare;
    Procedure GUIDrawSolutionSudoku;
    Procedure GUIDrawSolutionSsp;
    Procedure GUIDrawSolutionBpp;
    Procedure GUIDrawSolutionOpp;
    Procedure GUIDrawSolutionKpp;
    Procedure GUIDrawSolutionCpp;
    Procedure GUIDrawSolutionLpp;

    Procedure GUIReturn;

    Function Repeatation(const C: TChr; x: integer): integer;
    Function isTrueChromo(C: TChr): boolean; // is it a true solution
    Function GetDistance(const C: TChr): Single;

  public
    GenerCount: integer; // generations loop
    GeneCount: integer; // cities count
    Midle: integer; // ccity div 2
    ChromoCount: integer; // chromosomes count

    Problem: TProblem; // type of the problem to be solved

    P, Ranks: TProb;
    cr: Tcol;
    TotalFit, MaxFit: Single; // max Fitness in each generation
    pm, Ps, Pcnv, SelectionParam1, SelectionParam2: real; // p mutation  p selection
    BestChromoIdx, WorstChromoIdx: integer;
    ChkbeterMut, chkFitness, enMutation: boolean;

    TypeSelection, TypeCross, TypeRandom: byte;

    TypeMutation: array [0 .. 9] of boolean;

    constructor Create(CreateSuspended: boolean);
    procedure GUIprogress;
  end;

implementation

uses frmMain;

constructor TGAthread.Create(CreateSuspended: boolean);
begin
  inherited Create(CreateSuspended);
  GenerCount := 100; // generations loop
  // urg:=false;
  GeneCount := -1; // cities count
  ChromoCount := MCR; // chromosomes count
  ZeroMemory(@cr, sizeof(cr));
  BestChromoIdx := -1;
  // ZeroMemory(@city,sizeof(city));
  ZeroMemory(@P, sizeof(P));
end;

Procedure TGAthread.GUIReturn;
var
  k: integer;
  st: string;
begin
  with gfrm do
  begin
    Memo.Lines.Add('Final Fitnesses:');

    MakeFitnesses;

    for k := 0 to ChromoCount do
    begin
      st := '';
      Memo.Lines.Add(inttostr(k) + ': ' + SingleToStr(P[k]));
    end;

    FindElite;
    Memo.Lines.Add('Best Fitnesses:');
    Memo.Lines.Add(SingleToStr(P[BestChromoIdx]));

    GBoxEnable(true);

    // copy best Chromo to unit1 soloution
    Solution := cr[1, 0];
    solved := true;
    btnGo.Caption := 'GO!';

    if gfrm.chkAddresult.Checked then
      gfrm.btnChartAdd.Click;
  end;
end;

Function TGAthread.Repeatation(const C: TChr; x: integer): integer;
var
  i, lop: integer;
begin
  lop := 0;
  for i := 0 to GeneCount do
    if C[i] = x then
      lop := lop + 1;
  Result := iif(lop <= 0, 0, lop - 1);
end;

Function TGAthread.isTrueChromo(C: TChr): boolean; // is it a true solution
var
  i: integer;
begin
  Result := true;
  for i := 0 to GeneCount do // check no repeat
    if Repeatation(C, i) > 0 then
    begin
      Result := false;
      exit;
    end;
end;

Function TGAthread.Fitness(const C: TChr): Single;
begin
  // Notice that output is not yet divided to AVG

  case Problem of
    Tsp:
      PenaltyTsp(Result, C);
    NQueen:
      PenaltyNQueen(Result, C);
    Secret:
      PenaltySecret(Result, C);
    NColor:
      PenaltyNColor(Result, C);
    Knapsack:
      PenaltyKnapsack(Result, C);
    Knight:
      PenaltyKnight(Result, C);
    Square:
      PenaltySquare(Result, C);
    Sudoku:
      PenaltySudoku(Result, C);
    ssp:
      PenaltySsp(Result, C);
    bpp:
      PenaltyBpp(Result, C);
    Opp:
      PenaltyOpp(Result, C);
    Kpath:
      PenaltyKpp(Result, C);
    Cpp:
      PenaltyCpp(Result, C);
    Lpp:
      PenaltyLpp(Result, C);
  end;

end;

Procedure TGAthread.MakeFitnesses;
// Make Px
var
  i: integer; // tmp:single;
begin
  TotalFit := 0;
  for i := 0 to ChromoCount do
  begin
    P[i] := 1 / Fitness(cr[0, i]);
    TotalFit := TotalFit + P[i];
  end;

  // tmp:=0;
  for i := 0 to ChromoCount do
    if P[i] <> 0 then
    begin
      P[i] := P[i] / TotalFit;
      // tmp:=tmp+p[i];
    end;
  TotalFit := 1;
  // TotalFit:=tmp; //Pi was changed so, TotalFit must recalculated
  // Note: if  p[i]:=p[i]/TotalFit; used, TotalFit=1
  // if  p[i]:=TotalFit/p[i]; used, TotalFit=1  must recalculated
end;

Procedure TGAthread.FindElite; // Find best chromosome in this generation
var
  i: integer;
  MaxFit, WorstFit: Single;
begin
  BestChromoIdx := 0;
  WorstChromoIdx := 0;

  MaxFit := P[0];
  WorstFit := P[0];

  for i := 0 to ChromoCount do
  begin
    if MaxFit < P[i] then
    begin
      BestChromoIdx := i;
      MaxFit := P[i];
    end;

    if WorstFit > P[i] then
    begin
      WorstChromoIdx := i;
      WorstFit := P[i];
    end;
  end;
  // result:=BestChromoIdx;
end;

Procedure TGAthread.Elitism; // add best chromosome to next generation manually
begin
  FindElite;
  cr[1, 0] := cr[0, BestChromoIdx];
  // cr[1, ChromoCount] := cr[0, WorstChromoIdx];
  // Mutation2opt(cr[1,99]);
end;

procedure TGAthread.SelRankExponential(var a, b: integer; Sp: Single = 1.5);
var
  Fits: TPointerProb;
  i: integer;
  TotalRank: Single;
begin

  for i := 0 to ChromoCount do // Fill Fits with fitness values and theire indexes
  begin
    Fits[i].PValue := @P[i];
    Fits[i].Index := i;
  end;
  QuickSort(Fits, ChromoCount);

  // C := 0.9;
  Ranks[0] := 0;
  TotalRank := 0;

  for i := 1 to ChromoCount do
  begin
    Ranks[i] := Ranks[i - 1] + (Sp - 1) / (power(Sp, ChromoCount) - 1) * power(Sp, ChromoCount - i);
    TotalRank := TotalRank + Ranks[i];
  end;

  // Now we will make Roulette in Ranks
  a := Fits[MiniRoullete(TotalRank)].Index;
  b := Fits[MiniRoullete(TotalRank)].Index;
end;

procedure TGAthread.SelRankLinear(var a, b: integer);
var
  Fits: TPointerProb;
  i: integer;
  TotalRank: Single;
begin

  for i := 0 to ChromoCount do // Fill Fits with fitness values and ther indexes
  begin
    Fits[i].PValue := @P[i];
    Fits[i].Index := i;
  end;
  QuickSort(Fits, ChromoCount);

  Ranks[0] := (ChromoCount + 1) / ((ChromoCount + 1) * (ChromoCount + 2) / 2);
  TotalRank := Ranks[0];

  for i := 1 to ChromoCount do
  begin
    Ranks[i] := Ranks[i - 1] + (ChromoCount + 1 - i) / ((ChromoCount + 1) * (ChromoCount + 2) / 2);
    TotalRank := TotalRank + Ranks[i];
  end;

  // Now we will make Roulette in Ranks
  a := Fits[MiniRoullete(TotalRank)].Index;
  b := Fits[MiniRoullete(TotalRank)].Index;
end;

procedure TGAthread.SelRankNonLinear(var a, b: integer; Sp: Single);
var
  Fits: TPointerProb;
  i: integer;
  TotalRank: Single;
begin

  // Fill Fits with fitness values and ther indexes
  for i := 0 to ChromoCount do
  begin
    Fits[i].PValue := @P[i];
    Fits[i].Index := i;
  end;
  QuickSort(Fits, ChromoCount);

  Ranks[0] := ((Sp - 1) * power(Sp, ChromoCount)) / (power(Sp, ChromoCount) - 1);
  TotalRank := Ranks[0];

  for i := 1 to ChromoCount do
  begin
    Ranks[i] := Ranks[i - 1] + ((Sp - 1) * power(Sp, ChromoCount - i)) /
      (power(Sp, ChromoCount) - 1);
    TotalRank := TotalRank + Ranks[i];
  end;

  // Now we will make Roulette in Ranks
  a := Fits[MiniRoullete(TotalRank)].Index;
  b := Fits[MiniRoullete(TotalRank)].Index;

end;

procedure TGAthread.SelScalingExp(var a, b: integer);
var
  i: integer;
  TotalRank: Single;
begin

  TotalRank := 0;
  for i := 0 to ChromoCount do
  begin
    Ranks[i] := P[i] * P[i]; // sqrt(1+P[i]); //
    TotalRank := TotalRank + Ranks[i];
  end;

  // Now we will make Roulette in Ranks
  a := MiniRoullete(TotalRank);
  b := MiniRoullete(TotalRank);

end;

procedure TGAthread.SelScalingLinear(var a, b: integer; factor: integer = 2);
var
  Fits: TPointerProb;
  i: integer;
  TotalRank, Avg, min, max, pa, pb: Single;
begin

  Avg := 0;
  TotalRank := 0;
  // factor := 9;

  for i := 0 to ChromoCount do // Fill Fits with fitness values and theire indexes
  begin
    Fits[i].PValue := @P[i];
    Avg := Avg + P[i];
    Fits[i].Index := i;
  end;
  QuickSort(Fits, ChromoCount);

  Avg := Avg / (ChromoCount + 1);
  min := Fits[0].PValue^;
  max := Fits[ChromoCount].PValue^;

  if (min > (factor * Avg - max) / (factor - 1)) then
  begin
    pa := Avg / (Avg - min);
    pb := -min * Avg / (Avg - min);
  end
  else
  begin
    pa := (factor - 1) * Avg / (max - Avg);
    pb := Avg * (max - factor * Avg) / (max - Avg);
  end;

  for i := 0 to ChromoCount do
  begin
    Ranks[i] := pa * Fits[i].PValue^ + pb;
    TotalRank := TotalRank + Ranks[i];
  end;

  // Now we will make Roulette in Ranks
  a := Fits[MiniRoullete(TotalRank)].Index;
  b := Fits[MiniRoullete(TotalRank)].Index;
end;

procedure TGAthread.SelRankBiased1(var a, b: integer; Sp: Single = 1.5);
var
  Fits: TPointerProb;
  i: integer;
  TotalRank: Single;
begin

  for i := 0 to ChromoCount do // Fill Fits with fitness values and ther indexes
  begin
    Fits[i].PValue := @P[i];
    Fits[i].Index := i;
  end;
  QuickSort(Fits, ChromoCount);

  TotalRank := 0;
  for i := 0 to ChromoCount do
  begin
    // Ranks[i]:= (2-Param)/(ChromoCount+1)+2*i*(Param-1)/((ChromoCount+1)*ChromoCount);
    Ranks[i] := (2 - Sp) + 2 * (i - 1) * (Sp - 1) / ChromoCount;
    TotalRank := TotalRank + Ranks[i];
  end;

  // Now we will make Roulette in Ranks
  a := Fits[MiniRoullete(TotalRank)].Index;
  b := Fits[MiniRoullete(TotalRank)].Index;
end;

procedure TGAthread.SelRankBiased2(var a, b: integer; Sp: Single);
var
  Fits: TPointerProb;
  i: integer;
  TotalRank: Single;
begin

  for i := 0 to ChromoCount do // Fill Fits with fitness values and ther indexes
  begin
    Fits[i].PValue := @P[i];
    Fits[i].Index := i;
  end;
  QuickSort(Fits, ChromoCount);

  TotalRank := 0;
  for i := 0 to ChromoCount do
  begin
    Ranks[i] := (2 - Sp) / ChromoCount + (2 * i * (Sp - 1)) / (ChromoCount * (ChromoCount - 1));
    TotalRank := TotalRank + Ranks[i];
  end;

  // Now we will make Roulette in Ranks
  a := Fits[MiniRoullete(TotalRank)].Index;
  b := Fits[MiniRoullete(TotalRank)].Index;

end;

Function TGAthread.SelRoulette(NoThis: integer): integer; // roulette wheel
var
  sum: Single;
  i: integer;
begin
  // TotalFit:=0;
  // for i:=0 to ChromoCount do TotalFit:=TotalFit+p[i];
  // if NoThis>=0 then TotalFit:=TotalFit;
  repeat
    if NoThis >= 0 then
      sum := random * (TotalFit - P[NoThis])
    else
      sum := random * TotalFit;

    i := 0;
    while ((sum >= 0) and (i <= ChromoCount)) do
    begin
      if i = NoThis then
        i := i + 1;
      sum := sum - P[i];
      i := i + 1;
    end;
    Result := i - 1;
  until (Result <> NoThis);
end;

function TGAthread.SelTournamentRnd(Size: integer; Pta: Single): integer;
var
  i, idx, x: integer;
  pool: Set of byte;
  r: Single;

begin
  pool := [];
  idx := RandomRangeX(0, ChromoCount); // A random Chromo
  Include(pool, idx);

  // get random probability to choose BEST or WORST
  r := random(1);

  for i := 1 to Size do
  begin
    x := RandomRangeX(0, ChromoCount);
    Include(pool, x);

    // noticing to r, select BEST or WORST
    // Pta = Probability of accepting BEST chromo of pool
    if ((r < Pta) and (P[x] > P[idx])) or ((r > Pta) and (P[x] < P[idx])) then
      idx := x;
  end;

  Result := idx;
end;

function TGAthread.SelTournamentUniq(Size: integer): integer;
var
  i, idx, x: integer;
  pool: Set of byte;
begin
  // Tournament with Unique random chromos
  pool := [];
  idx := RandomRangeX(0, ChromoCount); // A random Chromo
  // SetLength(pool,1);
  Include(pool, idx);

  // Select Chromosomes and extract best
  for i := 1 to Size do
  begin
    x := RandomRangeX(0, ChromoCount);
    if x in pool then
      repeat
        x := (x + 1) mod (ChromoCount + 1);
      until not(x in pool);

      // SetLength(pool,Length(pool)+1);
      Include(pool, x);
    if P[x] > P[idx] then
      idx := x;
  end;
  Result := idx;
end;

procedure TGAthread.SelTruncation(var a, b: integer; Tr: integer);
var
  Fits: TPointerProb;
  i: integer;
begin

  for i := 0 to ChromoCount do // Fill Fits with fitness values and ther indexes
  begin
    Fits[i].PValue := @P[i];
    Fits[i].Index := i;
  end;
  QuickSort(Fits, ChromoCount); // Sort fitnesses

  i := Floor(Tr / 100 * ChromoCount);

  // Now we will make Roulette in Ranks
  a := Fits[ChromoCount - RandomRangeX(0, i)].Index;
  b := Fits[ChromoCount - RandomRangeX(0, i)].Index;

end;

Procedure TGAthread.Cross1pt(const a: TChr; const b: TChr; var c1: TChr; var c2: TChr;
  n: integer = -1); // simple crossover
var
  j: byte;
begin
  if n = -1 then
    n := RandomRangeX(0, GeneCount);
  for j := 0 to n do
  begin
    c1[j] := a[j];
    c2[j] := b[j];
  end;
  for j := n + 1 to GeneCount do
  begin
    c1[j] := b[j];
    c2[j] := a[j];
  end;
end;

procedure TGAthread.Cross2pt(const a, b: TChr; var c1, c2: TChr);
var
  j, x, y, tmp: byte;
begin
  x := RandomRangeX(0, GeneCount);
  y := RandomRangeX(0, GeneCount);
  if x > y then
  begin
    tmp := x;
    x := y;
    y := tmp;
  end;

  for j := 0 to x do
  begin
    c1[j] := a[j];
    c2[j] := b[j];
  end;
  for j := x + 1 to y do
  begin
    c2[j] := a[j];
    c1[j] := b[j];
  end;
  for j := y + 1 to GeneCount do
  begin
    c1[j] := a[j];
    c2[j] := b[j];
  end;
end;

Procedure TGAthread.Crossover2(const a: TChr; const b: TChr; var c1: TChr; var c2: TChr;
  Mode: byte = 1); // Single crossover
var
  pp, q, i, n: integer;
  crossed: boolean;
  pab, x: real; // Mode=1 [if]   Mode=2 [fitness]   Mode=3 [both]
begin
  pp := RandomRangeX(0, GeneCount);
  q := GeneCount + pp;
  crossed := false;
  for i := pp to q do
  begin
    n := i mod (GeneCount + 1);
    if ((Mode mod 2 = 1) and (a[n] = b[n])) then
    begin
      Cross1pt(a, b, c1, c2, n);
      crossed := true;
      break;
    end;
  end;

  if (not crossed) then
  begin
    pab := Fitness(a) + Fitness(b);
    // randomize;
    x := random(round(pab));
    if x < Fitness(b) then
    begin
      c1 := a;
      c2 := a;
    end
    else
    begin
      c1 := b;
      c2 := b;
    end;
  end;
end;

Procedure TGAthread.CrossGreedy2(const a: TChr; const b: TChr; var c1: TChr; var c2: TChr);
var
  i, j, id1, id2, endLoop, Gene: integer;
  schema, tmp: array of integer;
  lc, rc: boolean; // left/right continue
begin

  Gene := RandomRangeX(0, GeneCount);
  endLoop := GeneCount + Gene;

  SetLength(schema, GeneCount + 1);

  // ZeroMemory(schema,ccity+1);
  Gene := Gene - 1;

  repeat
    Gene := (Gene + 1) mod (GeneCount + 1); // select a gene value
    id1 := -1;
    id2 := -1;

    // find gene in A[] choromo
    for i := 0 to GeneCount do
      if a[i] = Gene then
      begin
        id1 := i;
        break;
      end;

    // Gene not found! try another gene
    if id1 = -1 then
    begin
      continue;
      MessageBeep(1);
      // as "I Dont Know Why?" delphi wrappes alone CONTINUE
      // so i add a fake "MessageBeep(1);" (never runed) after them
    end;

    // find gene in B[] choromo
    for i := GeneCount downto 0 do
      if b[i] = Gene then
      begin
        id2 := i;
        break;
      end;

    // Gene not found! try another gene
    if id2 = -1 then
    begin
      continue;
      MessageBeep(1);
    end;

    // if id2>id1 then swap(id1,id2); //max ->id1
    lc := true;
    rc := true;
    c1[Midle] := Gene;
    schema[Gene] := -1;

    for i := 1 to Midle do
    begin
      if lc then
        if (id1 - i >= 0) and (schema[a[id1 - i]] = 0) then
        begin
          c1[Midle - i] := a[id1 - i];
          schema[a[id1 - i]] := -1;
        end
        else
        begin
          lc := false;
          id1 := Midle - i;
        end;
      if rc then
        if (id2 + i <= GeneCount) and (schema[b[id2 + i]] = 0) then
        begin
          c1[Midle + i] := b[id2 + i];
          schema[b[id2 + i]] := -1;
        end
        else
        begin
          rc := false;
          id2 := Midle + i;
        end;
      if (lc = false) and (rc = false) then
        break;
    end;

    j := 0;

    if (not lc) or (not rc) then
    begin
      SetLength(tmp, GeneCount + 1);
      for i := GeneCount downto 0 do
      begin
        Gene := RandomRangeX(0, GeneCount);
        for endLoop := Gene to Gene + GeneCount do
          if tmp[endLoop mod (GeneCount + 1)] = 0 then
          begin
            tmp[endLoop mod (GeneCount + 1)] := i;
            break;
          end;
      end;

      if not lc then
        for i := 0 to id1 do
        begin
          while schema[tmp[j]] = -1 do
            j := j + 1;
          schema[tmp[j]] := -1;
          c1[i] := tmp[j];
        end;
      if not rc then
        for i := id2 to GeneCount do
        begin
          while schema[tmp[j]] = -1 do
            j := j + 1;
          schema[tmp[j]] := -1;
          c1[i] := tmp[j];
        end;
    end;
    c2 := c1;
    break;
  until Gene > endLoop;

  tmp := nil;
  schema := nil;
end;

Procedure TGAthread.CrossPMX(const a, b: TChr; var c1, c2: TChr);
var
  j, i, n1, n2, P: integer;
begin
  n1 := RandomRangeX(1, GeneCount - 1);
  n2 := RandomRangeX(n1 + 1, GeneCount);

  // n1:=randomrangex(0,GeneCount);
  // n2:=randomrangex(0,GeneCount);
  // if n1>n2 then begin tmp:=n1; n1:=n2; n2:=tmp; end;

  for j := n1 to n2 do
  begin
    c1[j] := b[j];
    c2[j] := a[j];
  end;

  for j := n2 + 1 to GeneCount + n1 - 1 do
  begin
    P := j mod (GeneCount + 1);

    if has(a, a[P], n1, n2) then
    begin
      for i := 0 to GeneCount do
        if not has(a, b[i], 0, GeneCount) then
        begin
          c1[P] := b[i];
          break
        end;
    end
    else
      c1[P] := a[P];

    if has(b, b[P], n1, n2) then
    begin
      for i := 0 to GeneCount do
        if not has(b, a[i], 0, GeneCount) then
        begin
          c2[P] := a[i];
          break
        end;
    end
    else
      c2[P] := b[P];

  end;
end;

procedure TGAthread.CrossUniform(const a, b: TChr; var c1, c2: TChr);
var
  j: byte; // No need to mask
begin
  for j := 0 to GeneCount do
    if random(2) < 1 then
    begin
      c1[j] := a[j];
      c2[j] := b[j];
    end
    else
    begin
      c2[j] := a[j];
      c1[j] := b[j];
    end;
end;

function TGAthread.GetDistance(const C: TChr): Single;
var
  i: integer;
begin
  Result := 0;
  try
    for i := 0 to GeneCount - 1 do
    begin
      Result := Result + city[C[i], C[i + 1]];
    end;
  finally
    Result := Result + city[C[GeneCount], C[0]];
  end;
end;

Procedure TGAthread.CrossGreedy1pt(a, b: TChr; var c1, c2: TChr);
var
  P, q: real;
begin
  repeat
    q := Fitness(a) + Fitness(b);
    Cross1pt(a, b, c1, c2);
    P := Fitness(c1) + Fitness(c2);
    if P >= q then
    begin
      c1 := a;
      c2 := b;
      break;
    end;
    a := c1;
    b := c2;
  until false;
end;

procedure TGAthread.GUISetLabels;
begin
  GUIlabel.text := LeftStr(GUIlabel.text, 12) + inttostr(GUIi);
end;

Procedure TGAthread.GUItxtupdate(l: TStatuspanel; i: integer);
begin
  GUIlabel := l;
  GUIi := i;
  Synchronize(GUISetLabels);
end;

Procedure TGAthread.CrossGST(a, b, t: integer); // smart crossover
var
  i, j, k: integer;
begin
  for i := 0 to GeneCount do
    for j := GeneCount downto 0 do
      if cr[0, a, i] = cr[0, b, j] then
      begin
        for k := 0 to GeneCount do
          if k <= i then
            cr[1, t, k] := cr[0, a, k]
          else
            cr[1, t, k] := cr[0, b, (j + k - i) mod (GeneCount + 1)];
        for k := 0 to GeneCount do
          if k <= j then
            cr[1, t + 1, k] := cr[0, b, k]
          else
            cr[1, t + 1, k] := cr[0, a, (i + k - j) mod (GeneCount + 1)];
        exit;
      end;
end;

procedure TGAthread.CrossGSX(const a, b: TChr; var c1, c2: TChr);
var
  x, y, k: integer;
  n: byte;
  P, q: boolean;
  g, h: string;
begin // Can makes True chromos, with random initial pop methid
  n := RandomRangeX(0, GeneCount);
  P := true;
  q := true;
  x := posA(a, GeneCount, n);
  y := posA(b, GeneCount, n);
  g := chr(n);
  h := chr(n);

  repeat
    x := (x - 1);
    if x < 0 then
      x := GeneCount;
    y := (y + 1) mod (GeneCount + 1);

    if P then
      if posEx(chr(a[x]), g) = 0 then
      begin
        g := chr(a[x]) + g;
        h := h + chr(a[x]);
      end
      else
        P := false;

    if q then
      if posEx(chr(b[y]), g) = 0 then
      begin
        g := g + chr(b[y]);
        h := chr(b[y]) + h;
      end
      else
        q := false;

  until not(P or q);

  if length(g) < GeneCount + 1 then
    for k := 0 to GeneCount do
      if posEx(chr(k), g) = 0 then
      begin
        g := g + chr(k);
        h := h + chr(k);
      end;

  for k := 0 to GeneCount do
  begin
    c1[k] := ord(g[k + 1]);
    c2[k] := ord(h[k + 1]);
  end;
end;

Procedure TGAthread.Mutation2optFull(var Ch: TChr); // mutation of 2opt
var
  a, b, C, d: integer;
  P: real;
  tmp: TChr;
begin
  tmp := Ch;
  P := Fitness(tmp);
  // for a:=0 to GeneCount-3 do
  // for b:=a+1 to GeneCount-2 do
  // for c:=b+1 to GeneCount-1 do
  // for d:=c+1 to GeneCount do
  // if (city[tmp[a],tmp[c]]>city[tmp[a],tmp[b]])and(city[tmp[b],tmp[d]]>city[tmp[c],tmp[d]]) then continue
  // else
  // if city[tmp[a],tmp[b]]+city[tmp[c],tmp[d]]>city[tmp[a],tmp[c]]+city[tmp[b],tmp[d]] then
  // Swap(tmp,b,c);

  for a := 0 to GeneCount - 3 do
    for b := a + 1 to GeneCount - 2 do
      for C := b + 1 to GeneCount - 1 do
        for d := C + 1 to GeneCount do
          if (city[tmp[a], tmp[C]] < city[tmp[a], tmp[b]]) and (city[tmp[b], tmp[d]] < city[tmp[C],
            tmp[d]]) then // exit//continue
            // else
            // if city[tmp[a],tmp[b]]+city[tmp[c],tmp[d]]>city[tmp[a],tmp[c]]+city[tmp[b],tmp[d]] then
            Swap(tmp, b, C);

  if ((ChkbeterMut) and (P > Fitness(tmp))) or (not ChkbeterMut) then
    Ch := tmp;
end;

procedure TGAthread.Mutation2optRnd(var Ch: TChr);
var
  i, j: integer;
  P: real;
  tmp: TChr;
begin
  tmp := Ch;
  P := Fitness(tmp);

  for i := 0 to GeneCount - 3 do
    if (city[tmp[i], tmp[i + 2]] < city[tmp[i], tmp[i + 1]]) and
      (city[tmp[i + 1], tmp[i + 3]] < city[tmp[i + 2], tmp[i + 3]]) then
      Swap(tmp, i + 1, i + 2);

  for i := 0 to GeneCount - 2 do
    for j := i + 1 to GeneCount - 1 do
      if (city[tmp[i], tmp[j]] < city[tmp[i], tmp[i + 1]]) and
        (city[tmp[i + 1], tmp[j + 1]] < city[tmp[j], tmp[j + 1]]) then
        Swap(tmp, i + 1, j);

  if ((ChkbeterMut) and (P > Fitness(tmp))) or (not ChkbeterMut) then
    Ch := tmp;
end;

procedure TGAthread.MutationFlip(var Ch: TChr);
var
  i: integer;
  P: real;
  tmp: TChr;
begin
  tmp := Ch;
  i := RandomRangeX(0, GeneCount);
  P := Fitness(tmp);
  tmp[i] := GeneCount - tmp[i];
  if ((ChkbeterMut) and (P > Fitness(tmp))) or (not ChkbeterMut) then
    Ch := tmp;
end;

Procedure TGAthread.MutationGreedyLop(var Ch: TChr);
var
  P: real;
  tmp, tmp2: TChr;
begin
  tmp := Ch;
  repeat
    tmp2 := tmp;
    P := Fitness(tmp);
    MutationRndVal(tmp);
  until (P <= Fitness(tmp));
  Ch := tmp2;
end;

procedure TGAthread.MutationInversion(var Ch: TChr);
var
  i, j, k: integer;
  P: real;
  tmp: TChr;
begin
  tmp := Ch;

  // i must be lower than j
  i := RandomRangeX(0, GeneCount);
  j := RandomRangeX(i, GeneCount);

  P := Fitness(tmp);
  tmp[i] := j;

  // invert selected slice of chromosome
  for k := i to j do
    Swap(tmp, k, j - k + i);

  if ((ChkbeterMut) and (P > Fitness(tmp))) or (not ChkbeterMut) then
    Ch := tmp;
end;

procedure TGAthread.MutationKnighCycle(var Ch: TChr);
var
  i, j, k: integer;
  P: real;
  tmp: TChr;
  k1, k2: TKnightPos;
begin
  tmp := Ch;
  P := Fitness(tmp);

  // From a random Gene from Tour, to final Gene
  j := randomrange(0, GeneCount div 3 * 2);

  for i := j to GeneCount - 2 do
  begin
    k1 := GetKnightPos(tmp[i]);
    k2 := GetKnightPos(tmp[i + 1]);

    // if Genes i and i+1 arent legal adjacent, find a legal one from remaining Genes from Tour
    if not(((abs(k1.Row - k2.Row) = 2) and (abs(k1.Col - k2.Col) = 1)) or
        ((abs(k1.Row - k2.Row) = 1) and (abs(k1.Col - k2.Col) = 2))) then
      for k := i + 2 to GeneCount do
      begin

        k2 := GetKnightPos(tmp[k]);

        // If finded gene makes a legal move
        if (((abs(k1.Row - k2.Row) = 2) and (abs(k1.Col - k2.Col) = 1)) or
            ((abs(k1.Row - k2.Row) = 1) and (abs(k1.Col - k2.Col) = 2))) then
        begin
          Swap(tmp, i + 1, k);
          break;
        end;

      end;
  end;

  if ((ChkbeterMut) and (P > Fitness(tmp))) or (not ChkbeterMut) then
    Ch := tmp;
end;

procedure TGAthread.MutationRndVal(var Ch: TChr);
var
  i, j: integer;
  P: real;
  tmp: TChr;
begin
  tmp := Ch;
  i := RandomRangeX(0, GeneCount);
  j := RandomRangeX(0, GeneCount);
  P := Fitness(tmp);
  tmp[i] := j;
  if ((ChkbeterMut) and (P > Fitness(tmp))) or (not ChkbeterMut) then
    Ch := tmp;
end;

procedure TGAthread.MutationSwap(var Ch: TChr);
var
  i, j: integer;
  P: real;
  tmp: TChr;
begin
  tmp := Ch;
  i := RandomRangeX(0, GeneCount);
  j := RandomRangeX(0, GeneCount);
  P := Fitness(tmp);
  Swap(tmp, i, j);
  if ((ChkbeterMut) and (P > Fitness(tmp))) or (not ChkbeterMut) then
    Ch := tmp;
end;

procedure TGAthread.SelBoltzman(var a, b: integer);
var
  TotalRank: Single;
  i: integer;
begin

  TotalRank := 0;
  for i := 0 to ChromoCount do
  begin
    Ranks[i] := Exp((P[i] - 1) * (GenerNumber / GenerCount * 2));
    TotalRank := TotalRank + Ranks[i];
  end;

  a := MiniRoullete(TotalRank);
  b := MiniRoullete(TotalRank);
end;

Procedure TGAthread.Selection;
var
  i, a, b, h: integer;
  tc: byte;
begin
  if TypeCross = 0 then // if "None" selected as crossover method
  begin
    for i := 1 to ChromoCount do
      cr[1, i] := cr[0, i];
    exit;
  end;

  h := Trunc(Ps * ChromoCount);

  for i := 1 to h do
    // cause of 2 cross for each pair chromos that selected EX: [ABBAAB] or [BAABBA]
    if ((i mod 2 <> 0) or (i = 0)) then // Count of selections
    begin

      case TypeSelection of
        0:
          begin
            a := SelRoulette(-1);
            b := SelRoulette(a);
          end;

        1:
          begin
            a := SelTournamentRnd(Trunc(SelectionParam1), SelectionParam2);
            b := SelTournamentRnd(Trunc(SelectionParam1), SelectionParam2);
          end;

        2:
          begin
            a := SelTournamentUniq(Trunc(SelectionParam1));
            b := SelTournamentUniq(Trunc(SelectionParam1));
          end;

        3:
          SelRankLinear(a, b);

        4:
          SelRankExponential(a, b, SelectionParam1);

        5:
          SelRankBiased1(a, b, SelectionParam1);

        6:
          SelRankBiased2(a, b, SelectionParam1);

        7:
          SelRankNonLinear(a, b, SelectionParam1);

        8:
          SelBoltzman(a, b);

        9:
          SelScalingLinear(a, b, Trunc(SelectionParam1));

        10:
          SelScalingExp(a, b);

        11:
          SelTruncation(a, b, Trunc(SelectionParam1));

      else
        begin
          a := SelRoulette(-1);
          b := SelRoulette(a);
        end;
      end;

      if TypeCross = 1 then
        tc := RandomRangeX(1, 10)
      else
        tc := TypeCross;

      Case tc of
        2:
          Cross1pt(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1]);
        3:
          Cross2pt(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1]);
        4:
          CrossUniform(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1]);
        5:
          CrossGST(a, b, i);
        6:
          CrossGSX(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1]);
        7:
          CrossGreedy1pt(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1]);
        8:
          CrossGreedy2(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1]);
        9:
          CrossPMX(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1]);
      else
        Crossover2(cr[0, a], cr[0, b], cr[1, i], cr[1, i + 1], TypeCross);
      end;
    end;

  for i := h + 1 to ChromoCount do
    cr[1, i] := cr[0, i]; // for chromosomes of old generation

end;

Procedure TGAthread.Mutation;
var
  i, h: integer;
begin
  if random < pm then
  begin
    h := Trunc(Ps * ChromoCount);
    for i := 1 to h do
    begin
      if TypeMutation[0] then
        MutationRndVal(cr[1, i]);
      if TypeMutation[1] then
        MutationFlip(cr[1, i]);
      if TypeMutation[2] then
        MutationSwap(cr[1, i]);
      if TypeMutation[3] then
        MutationInversion(cr[1, i]);
      if TypeMutation[4] then
        MutationGreedyLop(cr[1, i]);
      if TypeMutation[5] then
        Mutation2optRnd(cr[1, i]);
      if TypeMutation[6] then
        Mutation2optFull(cr[1, i]);
      if TypeMutation[7] then
        MutationKnighCycle(cr[1, i]);
    end;
  end;
end;

procedure TGAthread.InitPopulationBpp;
var
  i, j: integer;
begin
  if terminated then
    exit;

  // Set initial values of packaging problem
  // Gene values= number of packs
  // Gene inedx= index of boxes

  for i := 0 to ChromoCount do
    for j := 0 to GeneCount do
      cr[0, i, j] := RandomRangeX(0, Packag.PacksCount - 1);

end;

procedure TGAthread.InitPopulationCpp;
var
  i, j: integer;
begin
  if terminated then
    exit;

  // Set initial values of Corral puzzle problem
  // Gene values must be between [0 .. Vals*2-1]

  for i := 0 to ChromoCount do
    for j := 0 to GeneCount do
      cr[0, i, j] := RandomRangeX(0, CppData.Vals[j] * 2 - 1);

end;

procedure TGAthread.InitPopulationKnapsack;
var
  i, j: integer;
begin
  if terminated then
    exit;

  // Set initial values of knapsack
  // 0= in sack        1= not in sack

  for i := 0 to ChromoCount do
    for j := 0 to GeneCount do
      cr[0, i, j] := RandomRangeX(0, 1)

end;

procedure TGAthread.InitPopulationNColor;
var
  i, j: integer;
begin

  if terminated then
    exit;

  for i := 0 to ChromoCount do
    for j := 0 to GeneCount do
      cr[0, i, j] := RandomRangeX(0, NCol.ColorCount);

end;

procedure TGAthread.InitPopulationOpp;
var
  i, j: integer;
begin
  if terminated then
    exit;

  for i := 0 to ChromoCount do
    for j := 0 to GeneCount do
      cr[0, i, j] := RandomRangeX(0, 143);
end;

procedure TGAthread.InitPopulationSecret;
var
  i, j, k, cp: integer;
begin

  // All chars = 33  0=Space, 1..32=Alphabet
  if terminated then
    exit;

  for i := 0 to ChromoCount do
    // if random genes selected
    if TypeRandom = 0 then
      for j := 0 to GeneCount do
        cr[0, i, j] := RandomRangeX(0, GeneCount)
      else
        for j := GeneCount downto 0 do
        begin

          cp := RandomRangeX(0, GeneCount);

          for k := cp to cp + GeneCount do
            if cr[0, i, k mod (GeneCount + 1)] = 0 then
            begin
              cr[0, i, k mod (GeneCount + 1)] := j;
              break;
            end;

        end;

end;

procedure TGAthread.InitPopulationSquare;
// Make Chromosome
var
  i, j, k, cp: integer;
begin
  for i := 0 to ChromoCount do
    for j := GeneCount downto 0 do
    begin
      cp := RandomRangeX(1, GeneCount + 1);
      for k := cp to cp + GeneCount do
        if cr[0, i, k mod (GeneCount + 1)] = 0 then
        begin
          cr[0, i, k mod (GeneCount + 1)] := j + 1;
          break;
        end;
    end;
end;

procedure TGAthread.InitPopulationSsp;
var
  i, j: integer;
begin
  for i := 0 to ChromoCount do
    for j := 0 to GeneCount do
      cr[0, i, j] := RandomRangeX(0, SSpdata.SspMaxlen);
end;

procedure TGAthread.InitPopulationSudoku;
var
  i, j: integer;
begin
  for i := 0 to ChromoCount do
    for j := 0 to GeneCount do
      cr[0, i, j] := RandomRangeX(1, 9);
end;

Procedure TGAthread.InitPopulationTsp;
// Make Chromosome
var
  i, j, k, cp: integer;
begin
  if terminated then
    exit;

  for i := 0 to ChromoCount do
    if TypeRandom = 0 then
      // if random genes selected
      for j := 0 to GeneCount do
        cr[0, i, j] := RandomRangeX(0, GeneCount)
      else
        for j := GeneCount downto 0 do
        begin
          // RandSeed:=i+random(RandSeed);
          cp := RandomRangeX(0, GeneCount);
          for k := cp to cp + GeneCount do
            if cr[0, i, k mod (GeneCount + 1)] = 0 then
            begin
              cr[0, i, k mod (GeneCount + 1)] := j;
              break;
            end;
        end;
end;

Function TGAthread.Convergency: boolean; // Determine seemness of generation
var
  i, Count: integer;
  best: real;
begin
  Result := false;
  Count := 0;
  best := P[BestChromoIdx];
  if isTrueChromo(cr[0, BestChromoIdx]) then
  begin
    for i := 0 to ChromoCount do
      if P[i] = best then
        Count := Count + 1;
    if Count >= Pcnv * ChromoCount then
      Result := true;
  end;
end;

procedure TGAthread.Execute;
var
  k: integer;
begin
  SetLength(OutVals, 0);

  // select initial population creation method of problem type
  case Problem of
    Tsp, Knight, Kpath, NQueen:
      InitPopulationTsp;
    Secret:
      InitPopulationSecret;
    NColor:
      InitPopulationNColor;
    Knapsack, Lpp:
      InitPopulationKnapsack;
    Square:
      InitPopulationSquare;
    Sudoku:
      InitPopulationSudoku;
    ssp:
      InitPopulationSsp;
    bpp:
      InitPopulationBpp;
    Opp:
      InitPopulationOpp;
    Cpp:
      InitPopulationCpp;
  end;

  Midle := GeneCount div 2;

  for k := 1 to GenerCount do
  begin
    GenerNumber := k;

    MakeFitnesses;

    Selection;

    if enMutation then
      Mutation;

    Elitism;

    cr[0] := cr[1]; // Generation

    Synchronize(GUIprogress);
    GUItxtupdate(gfrm.Statusbar.Panels.Items[0], GenerNumber);
    // GUItxtupdate(gfrm.Statusbar.Panels.Items[0], Trunc(GenerNumber * 100 / GenerCount));

    SetLength(OutVals, length(OutVals) + 1);
    OutVals[k - 1] := RoundTo(Fitness(cr[1, 0]), -4);

    if ((terminated) or (chkFitness and Convergency)) then
      break;
  end;

  Synchronize(GUIReturn);

end;

procedure TGAthread.GUIDrawSolutionBpp;
var
  i, j, UsedPackCount: integer;
  PackegeVol: array of Single; // Volume of Boxes in any package
  C: TChr;
begin
  C := cr[1, 0];

  gfrm.pPackMemo.Lines.BeginUpdate;
  try
    gfrm.pPackMemo.Clear;

    SetLength(PackegeVol, Packag.PacksCount);
    ZeroMemory(PackegeVol, sizeof(PackegeVol));
    UsedPackCount := 0;

    for i := 0 to GeneCount do
    begin
      if PackegeVol[C[i]] = 0 then
        UsedPackCount := UsedPackCount + 1;
      PackegeVol[C[i]] := PackegeVol[C[i]] + Packag.Vols[i];
    end;

    j := 0;
    for i := 0 to GeneCount do
      if PackegeVol[i] > 0 then
      begin
        gfrm.pPackMemo.Lines.Add(format('Pack[%d]: Weigth: %3g', [j, PackegeVol[i]]));
        j := j + 1;
      end;

    gfrm.pPackMemo.Lines.Add(format('Used Packages count: %d', [UsedPackCount]));
  finally
    gfrm.pPackMemo.Lines.EndUpdate;
  end;

end;

procedure TGAthread.GUIDrawSolutionCpp;
var
  C: TChr;
  i, j, k, p1, p2: integer;
  included: boolean;
begin

  C := cr[1, 0];

  for i := 0 to CppData.GridSize - 1 do // Grid Rows counter
    for j := 0 to CppData.GridSize - 1 do // Grid Cols counter
    begin
      included := false;

      for k := 0 to GeneCount do // for each number
      begin

        if C[k] > CppData.Vals[k] * 2 - 1 then
        begin
          CppData.Count := CppData.Count;
          continue;
        end;

        // Recogonizing that it is Horizontal or Vertical??
        if C[k] >= CppData.Vals[k] then
        begin
          // Rect is Vertical
          // p1,p2= start and end ROWS of the rectangle
          p1 := CppData.XYs[k].Row - C[k] + CppData.Vals[k];
          p2 := CppData.XYs[k].Row + CppData.Vals[k] - C[k] + CppData.Vals[k] - 1;

          // if we are in the direct sight of this number's rectangle
          if (j = CppData.XYs[k].Col) and Between(i, p1, p2) then
          begin
            included := true;
            break;
          end;
        end
        else
        begin
          // Rect is Horizontal
          // p1,p2= start and end COLS of the rectangle
          p1 := CppData.XYs[k].Col - C[k];
          p2 := CppData.XYs[k].Col + CppData.Vals[k] - C[k] - 1;

          // if we are in the direct sight of this number's rectangle
          if (i = CppData.XYs[k].Row) and Between(j, p1, p2) then
          begin
            included := true;
            break;
          end;
        end;
      end;

      if included then
        gfrm.pCppGrid.Canvas.Brush.Color := clskyblue
      else
        gfrm.pCppGrid.Canvas.Brush.Color := clwhite;

      gfrm.pCppGrid.Canvas.FillRect(gfrm.pCppGrid.CellRect(j, i));
      gfrm.pCppGrid.Canvas.TextOut(gfrm.pCppGrid.CellRect(j, i).Left + 5,
        gfrm.pCppGrid.CellRect(j, i).Top + 5, gfrm.pCppGrid.Cells[j, i]);

    end;
end;

procedure TGAthread.GUIDrawSolutionKnapsack;
var
  i: integer;
  C: TChr;
  sumWeigth, sumValues: Single;
begin
  C := cr[1, 0];
  gfrm.pKnapsackMemo.Lines.BeginUpdate;
  try
    gfrm.pKnapsackMemo.Clear;

    sumWeigth := 0;
    sumValues := 0;

    for i := 0 to GeneCount do
    begin
      if C[i] <> 0 then
      begin
        gfrm.pKnapsackMemo.Lines.Add(format('Box[%d]: Weigth: %3g     Value: %3g',
            [i, knap.Boxes[i].Weigth, knap.Boxes[i].Value]));

        sumWeigth := sumWeigth + knap.Boxes[i].Weigth;
        sumValues := sumValues + knap.Boxes[i].Value;
      end;
    end;

    gfrm.pKnapsackMemo.Lines.Add(format('SumWeigth: %3g     SumValue: %3g',
        [sumWeigth, sumValues]));
  finally
    gfrm.pKnapsackMemo.Lines.EndUpdate;
  end;
end;

procedure TGAthread.GUIDrawSolutionKnight;
var
  i: integer;
  C: TChr;
  k: TKnightPos;
begin
  C := cr[1, 0];

  gfrm.pKnightGrid.Canvas.Pen.Color := clblue;
  gfrm.pKnightGrid.Canvas.Pen.Width := 4;

  for i := 0 to GeneCount do
  begin
    k := GetKnightPos(C[i]);
    gfrm.pKnightGrid.Cells[k.Col + 1, k.Row + 1] := inttostr(i);

    gfrm.pKnightGrid.Canvas.MoveTo((k.Col + 1) * 50 + 25, (k.Row + 1) * 50 + 25);

    k := GetKnightPos(C[(i + 1) mod (GeneCount + 1)]);
    gfrm.pKnightGrid.Canvas.LineTo((k.Col + 1) * 50 + 25, (k.Row + 1) * 50 + 25);
  end;
end;

procedure TGAthread.GUIDrawSolutionKpp;
var
  i, j: integer;
  C: TChr;
  k: TKnightPos;
begin
  C := cr[1, 0];

  for i := 0 to gfrm.pKpathGrid.RowCount - 1 do
    gfrm.pKpathGrid.Rows[i].Clear;

  gfrm.pKpathGrid.Cells[KPData.p1.Col - 1, KPData.p1.Row - 1] := '®';
  gfrm.pKpathGrid.Cells[KPData.p2.Col - 1, KPData.p2.Row - 1] := '®';

  j := 0;
  for i := 0 to GeneCount do
    if C[i] <> 0 then
    begin
      j := j + 1;
      k := GetKnightPos(C[i], KPData.len);
      gfrm.pKpathGrid.Cells[k.Col - 1, k.Row - 1] := inttostr(j);
    end;

end;

procedure TGAthread.GUIDrawSolutionLpp;
begin

end;

procedure TGAthread.GUIDrawSolutionNColor;
var
  i, j: integer;
  C: TChr;
begin

  C := cr[1, 0];
  for i := 0 to GeneCount do
    TShp(gfrm.pNColor.FindComponent('shp' + inttostr(i))).Color := ColorSet[C[i]];

  if GenerNumber = 1 then
    with gfrm do
    begin
      img2.Canvas.Pen.Color := clteal;
      img2.Canvas.Rectangle(0, 0, img2.Width, img2.Height);

      img2.Canvas.Pen.Width := 1;

      with img2.Canvas do
      begin

        for i := 0 to GeneCount do
          for j := i + 1 to GeneCount do
            if (NCol.Matrix[i, j]) then
            begin
              MoveTo(pos[i].x, pos[i].y);
              LineTo(pos[j].x, pos[j].y);
            end;

      end;
    end;
end;

procedure TGAthread.GUIDrawSolutionNQueen;
var
  i, j: integer;
  C: TChr;
begin
  C := cr[1, 0];
  for i := 0 to GeneCount do
  begin
    for j := 0 to GeneCount do
      gfrm.pNQueenGrid.Cells[j, i] := '';
    gfrm.pNQueenGrid.Cells[C[i], i] := '®';
  end;
end;

procedure TGAthread.GUIDrawSolutionOpp;
var
  i: integer;
  C: TChr;
begin
  C := cr[1, 0];

  for i := 0 to GeneCount do
  begin
    Oppdata.DrawPPos[i].Row := C[i] Div 12;
    Oppdata.DrawPPos[i].Col := C[i] Mod 12;
  end;

  gfrm.pOppGrid.Refresh;
end;

procedure TGAthread.GUIDrawSolutionSecret;
var
  i: integer;
  C: TChr;
  tmpMsg: widestring;
begin
  C := cr[1, 0];
  // create secret message using current chromosome
  tmpMsg := msgData.CodedMsg;
  for i := 1 to msgData.len do
    tmpMsg[i] := msgData.Alphabet[C[posEx(tmpMsg[i], msgData.Alphabet) - 1] + 1];
  gfrm.pSecretMemo.Lines.Add(format('%d: ', [GenerNumber]) + tmpMsg);
end;

procedure TGAthread.GUIDrawSolutionSquare;
var
  i, RowSum, ColSum, j, s: integer;
  C: TChr;
begin
  C := cr[1, 0];

  s := round(Sqrt(GeneCount + 1)) - 1;

  // determine sumation of Rows and Cols
  for i := 0 to s do
  begin
    RowSum := 0;
    ColSum := 0;

    for j := 0 to s do
    begin
      RowSum := RowSum + C[(s + 1) * i + j];
      ColSum := ColSum + C[(s + 1) * j + i];

      gfrm.pSquareGrid.Cells[j + 1, i + 1] := inttostr(C[(s + 1) * i + j]);
    end;
    gfrm.pSquareGrid.Cells[i + 1, 0] := inttostr(ColSum);
    gfrm.pSquareGrid.Cells[0, i + 1] := inttostr(RowSum);
  end;

end;

procedure TGAthread.GUIDrawSolutionSsp;
var
  i, j: integer;
  pn: Single;
  C: TChr;
begin
  C := cr[1, 0];
  gfrm.psspMemo.Lines.BeginUpdate;
  try
    gfrm.psspMemo.Clear;

    // Find MAX index
    SSpdata.Ssplen := C[0] + SSpdata.Lengths[0];

    for i := 1 to GeneCount do
      if SSpdata.Ssplen < C[i] + SSpdata.Lengths[i] then
        SSpdata.Ssplen := C[i] + SSpdata.Lengths[i];

    // calculate current SSP length
    SSpdata.Ssplen := SSpdata.Ssplen - 1;

    SSpdata.SuperString := StringOfChar(' ', SSpdata.Ssplen + 1);

    for i := 0 to SSpdata.Ssplen do // each index in superstring
      for j := 0 to GeneCount do // each string/gene
        if (C[j] <= i) and (i < C[j] + SSpdata.Lengths[j]) then
        begin
          SSpdata.SuperString[i + 1] := SSpdata.Strings[j][i - C[j] + 1];
          break;
        end;

    gfrm.psspMemo.Lines.Add('"' + SSpdata.SuperString + '"');
    gfrm.psspMemo.Lines.Add(format('Message Length=%d', [SSpdata.SspMaxlen]));
    gfrm.psspMemo.Lines.Add(format('Supestr Length=%d', [length(SSpdata.SuperString)]));
    PenaltySsp(pn, C);
    gfrm.psspMemo.Lines.Add(format('Penalty=%f', [pn]));
    gfrm.psspMemo.Lines.Add('');

    // gfrm.psspMemo.Lines.Add('');

    for i := 0 to GeneCount do
      gfrm.psspMemo.Lines.Add(format('%s = %d', [SSpdata.Strings[i], C[i]]));
    // gfrm.psspMemo.Lines.Strings[1] := gfrm.psspMemo.Lines.Strings[1] + inttostr(C[i]) + ' ';

  finally
    gfrm.psspMemo.Lines.EndUpdate;
  end;

end;

procedure TGAthread.GUIDrawSolutionSudoku;
var
  i, j, idx: integer;
  C: TChr;
begin
  C := cr[1, 0];
  idx := 0;

  for i := 0 to 8 do
    for j := 0 to 8 do

      // If this cell has not a default value
      if not Sudodata.Bools[i * 9 + j] then
      begin
        gfrm.pSudokuGrid.Cells[j, i] := inttostr(C[idx]);

        // Increase the chromosome value counter
        idx := idx + 1;
      end;

end;

Procedure TGAthread.GUIDrawSolutionTsp;
var
  j: integer;
  C: TChr;
begin
  C := cr[1, 0];

  with gfrm do
  begin
    img.Canvas.Pen.Color := clteal;
    img.Canvas.Rectangle(0, 0, img.Width, img.Height);

    with img.Canvas do
    begin

      for j := 0 to GeneCount - 1 do
      begin
        img.Canvas.Pen.Width := 1;
        MoveTo(pos[C[j]].x, pos[C[j]].y);
        LineTo(pos[C[j + 1]].x, pos[C[j + 1]].y);
      end;

      MoveTo(pos[C[GeneCount]].x, pos[C[GeneCount]].y);
      LineTo(pos[C[0]].x, pos[C[0]].y);
    end;

  end;

end;

Procedure TGAthread.GUIprogress;
begin

  case Problem of
    Tsp:
      if (isTrueChromo(cr[1, 0])) then
        Synchronize(GUIDrawSolutionTsp);
    NQueen:
      Synchronize(GUIDrawSolutionNQueen);
    Secret:
      Synchronize(GUIDrawSolutionSecret);
    NColor:
      Synchronize(GUIDrawSolutionNColor);
    Knapsack:
      Synchronize(GUIDrawSolutionKnapsack);
    Knight:
      Synchronize(GUIDrawSolutionKnight);
    Square:
      Synchronize(GUIDrawSolutionSquare);
    Sudoku:
      Synchronize(GUIDrawSolutionSudoku);
    ssp:
      Synchronize(GUIDrawSolutionSsp);
    bpp:
      Synchronize(GUIDrawSolutionBpp);
    Opp:
      Synchronize(GUIDrawSolutionOpp);
    Kpath:
      Synchronize(GUIDrawSolutionKpp);
    Cpp:
      Synchronize(GUIDrawSolutionCpp);
    Lpp:
      Synchronize(GUIDrawSolutionLpp);
  end;

  gfrm.Update;

end;

procedure TGAthread.PenaltyBpp(var Result: Single; const C: TChr);
var
  i, UsedPackCount: integer;
  sumExVolumes: Single;
  PackegeVol: array of Single; // Volume of Boxes in any package
begin

  SetLength(PackegeVol, Packag.PacksCount);
  ZeroMemory(PackegeVol, sizeof(PackegeVol));

  UsedPackCount := 0;
  sumExVolumes := 1;

  // Each gene in chromosome, is a box
  // Each gene value in chromosoe is the number of Package that involved this box

  try
    for i := 0 to GeneCount do
    begin
      // Calculate count of used packages
      if PackegeVol[C[i]] = 0 then
        UsedPackCount := UsedPackCount + 1;

      // Calculate sum of Boxes in any package
      PackegeVol[C[i]] := PackegeVol[C[i]] + Packag.Vols[i];
    end;

    // Calculate sum of err
    for i := 0 to GeneCount do
      if PackegeVol[i] - Packag.PackSize > 0 then // if there is overflow
        sumExVolumes := sumExVolumes + PackegeVol[i] - Packag.PackSize;

  finally
    Result := sumExVolumes * 3 + UsedPackCount * 2;
  end;

end;

procedure TGAthread.PenaltyCpp(var Result: Single; const C: TChr);
var
  i, j, k, BlankCells, Err, p1, p2: integer;
  included: boolean;
begin
  BlankCells := 0;
  Err := 0;

  try
    for i := 0 to CppData.GridSize - 1 do // Grid Rows counter
      for j := 0 to CppData.GridSize - 1 do // Grid Cols counter
      begin
        included := false;
        p1 := 0;
        p2 := 0;

        for k := 0 to GeneCount do // for each number
        begin

          // if index is out of grid
          if C[k] > CppData.Vals[k] * 2 - 1 then
          begin
            Err := Err + C[k] - (CppData.Vals[k] * 2 - 1);
            continue;
          end;

          // Recogonizing that it is Horizontal or Vertical??
          if C[k] >= CppData.Vals[k] then
          begin
            // Rect is Vertical
            // p1,p2= start and end ROWS of the rectangle
            p1 := CppData.XYs[k].Row - C[k] + CppData.Vals[k];
            p2 := CppData.XYs[k].Row + CppData.Vals[k] - C[k] + CppData.Vals[k] - 1;

            // if we are in the direct sight of this number's rectangle
            if (j = CppData.XYs[k].Col) and Between(i, p1, p2) then
            begin
              included := true;
              break;
            end;
          end
          else
          begin
            // Rect is Horizontal
            // p1,p2= start and end COLS of the rectangle
            p1 := CppData.XYs[k].Col - C[k];
            p2 := CppData.XYs[k].Col + CppData.Vals[k] - C[k] - 1;

            // if we are in the direct sight of this number's rectangle
            if (i = CppData.XYs[k].Row) and Between(j, p1, p2) then
            begin
              included := true;
              break;
            end;
          end;
        end;

        // Calculate out ranged rectangles
        if p2 > CppData.GridSize - 1 then
          Err := Err + p2 - CppData.GridSize + 1;
        if p1 < 0 then
          Err := Err + -p1;

        // This cell is not included in any rectangle
        if not included then
          BlankCells := BlankCells + 1;

      end;

  finally
    Result := CppData.GridSize * CppData.GridSize - BlankCells + Err * 10;
  end;

end;

procedure TGAthread.PenaltyKnapsack(var Result: Single;

  const C: TChr);
var
  i: integer;
  sumWeigth, sumValues: Single;
begin

  sumWeigth := 1;
  sumValues := 1;

  try
    for i := 0 to GeneCount do
      if C[i] <> 0 then
      begin
        sumWeigth := sumWeigth + knap.Boxes[i].Weigth;
        sumValues := sumValues + knap.Boxes[i].Value;
      end;

  finally

    Result := abs(knap.KnapsackSize - sumWeigth) * 3 + knap.MaxValue - sumValues;
  end;

end;

procedure TGAthread.PenaltyKnight(var Result: Single;

  const C: TChr);
var
  loops, moves, i: integer;
  k, l: TKnightPos;
begin

  loops := 1;
  moves := 0;

  try

    // find repeated knight positions
    for i := 0 to GeneCount do
      loops := loops + Repeatation(C, i);

    // find illegal moves of knight
    for i := 0 to GeneCount do
    begin
      k := GetKnightPos(C[i]);
      l := GetKnightPos(C[i + 1]);

      if not(((abs(k.Row - l.Row) = 2) and (abs(k.Col - l.Col) = 1)) or
          ((abs(k.Row - l.Row) = 1) and (abs(k.Col - l.Col) = 2))) then
        moves := moves + 1;
    end;

  finally
    Result := loops + 2 * moves;
  end;

end;

procedure TGAthread.PenaltyKpp(var Result: Single;

  const C: TChr);
var
  loops, moves, len, i: integer;
  k, l: TKnightPos;
  C_Tmp: TChr;
begin

  loops := 1;
  moves := 0;
  len := 0;

  ZeroMemory(@C_Tmp, length(C_Tmp));

  try

    // First gene is start point succ move
    // Last gene is end point pred mov
    // 0 value is empty move
    // Board is 1..64 beacause 0 number was used for empty move

    // calculate length of tour by removing 0 value
    // adding start&end points in first and last gene of C_Tmp to makeing the
    // calculations easier

    C_Tmp[0] := KPData.PN1;
    for i := 0 to GeneCount do
      if C[i] <> 0 then
      begin
        len := len + 1;
        C_Tmp[len] := C[i];
      end;
    len := len + 1;
    C_Tmp[len] := KPData.PN2;

    // find repeated knight positions
    for i := 0 to len do
      loops := loops + Repeatation(C_Tmp, i + 1);

    // find other illegal moves
    for i := 0 to len - 1 do
    begin
      k := GetKnightPos(C_Tmp[i], KPData.len);
      l := GetKnightPos(C_Tmp[i + 1], KPData.len);

      if not(((abs(k.Row - l.Row) = 2) and (abs(k.Col - l.Col) = 1)) or
          ((abs(k.Row - l.Row) = 1) and (abs(k.Col - l.Col) = 2))) then
        moves := moves + 1;
    end;

  finally
    Result := loops + 2 * moves + len / 62;
  end;

end;

procedure TGAthread.PenaltyLpp(var Result: Single;

  const C: TChr);
begin

end;

procedure TGAthread.PenaltyNColor(var Result: Single;

  const C: TChr);
var
  NeighborSames, colors, i, j: integer;
begin

  NeighborSames := 20;
  colors := NCol.ColorCount;

  try
    for i := 0 to GeneCount do
      for j := 0 to GeneCount do
        if (j <> i) and (NCol.Matrix[i, j]) and (C[i] = C[j]) then
          NeighborSames := NeighborSames + 1;

    for i := 0 to NCol.ColorCount do
      colors := colors - Repeatation(C, i);

  finally

    Result := NeighborSames + colors;
  end;

end;

procedure TGAthread.PenaltyNQueen(var Result: Single;

  const C: TChr);
var
  guards, i, j: integer;
begin
{$RANGECHECKS Off}
  guards := 1;

  try
    for i := 0 to GeneCount do
      for j := 0 to GeneCount do
        if (j <> i) and (C[i] in [C[j], C[j] + j - i, C[j] - j + i]) then
          guards := guards + 1;

  finally

    Result := guards;
  end;
{$RANGECHECKS ON}
end;

procedure TGAthread.PenaltyOpp(var Result: Single;

  const C: TChr);
var
  ErrSum, ErrDist, i, j, k: integer;
begin

  ErrSum := 0;
  ErrDist := 1;

  try
    // Retrieve points position
    for i := 0 to GeneCount do
    begin
      Oppdata.PPos[i].Row := C[i] Div 12;
      Oppdata.PPos[i].Col := C[i] Mod 12;
    end;

    // Calculate error of ex distances between points
    for i := 0 to GeneCount do
      for j := 0 to GeneCount do
        if i <> j then
        begin
          k := Oppdata.Distance - (abs(Oppdata.PPos[i].Row - Oppdata.PPos[j].Row) + abs
              (Oppdata.PPos[i].Col - Oppdata.PPos[j].Col));

          if k > 0 then
            ErrDist := ErrDist + k;
        end;

    // Calculate sum error
    for k := 0 to GeneCount do
      for i := 0 to 11 do
        for j := 0 to 11 do
          ErrSum := ErrSum + Oppdata.Grid[i, j] *
            (abs(Oppdata.PPos[k].Row - i) + abs(Oppdata.PPos[k].Col - j));

  finally
    Result := ErrSum * ErrDist;
  end;

end;

procedure TGAthread.PenaltySecret(var Result: Single;

  const C: TChr);
var
  Distance, i: integer;
  tmpMsg: widestring;
begin

  Distance := 1;

  // create secret message using current chromosome
  tmpMsg := msgData.CodedMsg;
  for i := 1 to msgData.len do
    tmpMsg[i] := msgData.Alphabet[C[posEx(tmpMsg[i], msgData.Alphabet) - 1] + 1];

  try
    for i := 1 to msgData.len do
      Distance := Distance + abs(posEx(tmpMsg[i], msgData.Alphabet) - posEx(msgData.SecretMsg[i],
          msgData.Alphabet));

  finally

    Result := Distance;
  end;

end;

procedure TGAthread.PenaltySquare(var Result: Single;

  const C: TChr);
var
  RowSum, ColSum, ErrSum, loops, i, j, s: integer;
begin

  loops := 2;
  ErrSum := 1;

  try

    // find repeated numbers
    for i := 0 to GeneCount do
      loops := loops + Repeatation(C, i);

    s := round(Sqrt(GeneCount + 1)) - 1;

    // determine sumation of Rows and Cols
    for i := 0 to s do
    begin
      RowSum := 0;
      ColSum := 0;

      for j := 0 to s do
      begin
        RowSum := RowSum + C[(s + 1) * i + j];
        ColSum := ColSum + C[(s + 1) * j + i];
      end;

      ErrSum := ErrSum + abs(RowSum - MagicNumber) + abs(ColSum - MagicNumber);
    end;

  finally

    Result := loops * ErrSum;
  end;

end;

procedure TGAthread.PenaltySsp(var Result: Single;

  const C: TChr);
var
  i, j, Err, ChrCode: integer;
  IndexChars: set of byte;
begin
  Err := 1;

  try
    // Find MAX index
    SSpdata.Ssplen := C[0] + SSpdata.Lengths[0];

    for i := 1 to GeneCount do
      if SSpdata.Ssplen < C[i] + SSpdata.Lengths[i] then
        SSpdata.Ssplen := C[i] + SSpdata.Lengths[i];

    // calculate current SSP length
    SSpdata.Ssplen := SSpdata.Ssplen - 1;

    // if string index in ssp is lower than this position
    // and its length is greater than this position
    // we are in the middle of that string

    for i := 0 to SSpdata.Ssplen do // each index in superstring
    begin
      IndexChars := [];

      for j := 0 to GeneCount do // each string/gene
        if (C[j] <= i) and (i < C[j] + SSpdata.Lengths[j]) then
        begin

          ChrCode := posEx(SSpdata.Strings[j][i - C[j] + 1], SSpdata.Alphabet);
          if not(ChrCode in IndexChars) then
          begin
            if IndexChars <> [] then
              Err := Err + 2;
            // Collect differenet chars in this index of superstring
            IndexChars := IndexChars + [ChrCode];
          end;

        end;

      // if there is no char in this index
      if IndexChars = [] then
        Err := Err + 1; // SSpdata.StringsCount;

    end;

  finally
    Result := Err + SSpdata.Ssplen / SSpdata.SspMaxlen;
  end;

end;

procedure TGAthread.PenaltySudoku(var Result: Single;

  const C: TChr);
var
  ColRepitation, RowRepitation: Array [0 .. 8] of boolean;
  i, j, k, l, ChromoIdx, Err: integer;
begin

  ChromoIdx := 0;
  Err := 1;

  // Fill a pattern of all Sudoku cells from PATTERN and CHROMOSOME
  for i := 0 to 8 do
    for j := 0 to 8 do
      if not Sudodata.Bools[i * 9 + j] then
      begin
        Sudodata.Cells[i, j] := C[ChromoIdx];
        ChromoIdx := ChromoIdx + 1;
      end;

  // Calculate Line Errors
  for i := 0 to 8 do
  begin
    ZeroMemory(@ColRepitation, 9);
    ZeroMemory(@RowRepitation, 9);

    for j := 0 to 8 do
    begin

      // Row errors calculation
      if RowRepitation[Sudodata.Cells[i, j] - 1] then
        Err := Err + 1
      else
        RowRepitation[Sudodata.Cells[i, j] - 1] := true;

      // Col errors calculation
      if ColRepitation[Sudodata.Cells[j, i] - 1] then
        Err := Err + 1
      else
        ColRepitation[Sudodata.Cells[j, i] - 1] := true;

    end;
  end;

  // Calculate 3x3 Rectangles Error
  for i := 0 to 2 do
    for j := 0 to 2 do
    begin
      ZeroMemory(@RowRepitation, 9);
      for k := 0 to 2 do
        for l := 0 to 2 do
          if RowRepitation[Sudodata.Cells[i * 3 + k, j * 3 + l] - 1] then
            Err := Err + 1
          else
            RowRepitation[Sudodata.Cells[i * 3 + k, j * 3 + l] - 1] := true;
    end;

  Result := Err;

end;

procedure TGAthread.PenaltyTsp(var Result: Single;

  const C: TChr);
var
  r, Distance: Single;
  h, i, loops: integer;
begin
  loops := 0;
  Distance := 0;
  h := GeneCount - 1;
  try
    for i := 0 to h do
    // h is one lower than High(c) cause of distance summation
    begin
      loops := loops + Repeatation(C, i);
      // find each gene loop [cities are numbers like i]
      Distance := Distance + city[C[i], C[i + 1]];
    end;
    Distance := Distance + city[C[GeneCount], C[0]];
    loops := loops + Repeatation(C, GeneCount);
  finally
    r := Distance;
    r := r * (iif(loops = 0, 0.0001, loops));
    // To make beter P for TRUE (without loop) tours
    Result := r;
  end;
  // Result:=iif(r<=0,1,r);
  // Result:=1/r;
  // Please dont generate big values, this deserves to kill lower chromosomes very fast
  // use ballanced values of both Dist & Lop
end;

function TGAthread.MiniRoullete(TotalRank: Single): integer;
var
  sum: Single;
  // used inBoltzma, Ranking, ...
  i: integer;
begin
  sum := random * TotalRank;
  i := 0;
  while ((sum >= 0) and (i <= ChromoCount)) do
  begin
    sum := sum - Ranks[i];
    i := i + 1;
  end;
  Result := i - 1;
end;

end.
