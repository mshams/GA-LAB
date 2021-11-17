{
  Progname: Genetic Lab
  Coded By: Muhammad Shams Javi
  
  [Source Included]

  Description: Written by M.Shams in DELPHI as AI educational project and are
  protected by GNU (Also opened) and international open source theory.

  12/18/2007 Have Fun
}

unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, frmABOUT, UGAthread, UPublic, TeeProcs,
  TeEngine, Chart, Series, teestore, Grids, IOUtils;

type
  TGfrm = class(TForm)
    img: TImage;
    btnGo: TButton;
    pnlMain: TPanel;
    pnlBtns: TPanel;
    btnStp: TButton;
    btnAbout: TButton;
    cube: TPanel;
    TimerPanel: TTimer;
    DlgOpen: TOpenDialog;
    DlgSave: TSaveDialog;
    PageCtrDesign: TPageControl;
    pTsp: TTabSheet;
    TabAnalyse: TTabSheet;
    pNQueen: TTabSheet;
    TabMonitor: TTabSheet;
    pTSPGrp: TGroupBox;
    btnReset: TButton;
    btnSave: TButton;
    btnLoad: TButton;
    btnRndCreate: TButton;
    txtRndCreate: TEdit;
    pTSPlbl: TLabel;
    pNQueenGrp: TGroupBox;
    pNQueenlbl: TLabel;
    pNqueentxt: TEdit;
    pSecretMessage: TTabSheet;
    pSecretGrp: TGroupBox;
    pSecrettxt: TEdit;
    pSecretlbl1: TLabel;
    pNColor: TTabSheet;
    pKnapsack: TTabSheet;
    pKnight: TTabSheet;
    pSecretEnctxt: TEdit;
    pSecretlbl2: TLabel;
    pSecretMemo: TMemo;
    pSecretlbl: TLabel;
    pNQueenlbl2: TLabel;
    pKnightlbl: TLabel;
    pKnightGrid: TStringGrid;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    pNColorSize: TEdit;
    GroupBox5: TGroupBox;
    pKnapsacklbl1: TLabel;
    pKnapsackSize: TEdit;
    pKnapsackMemo: TMemo;
    Label21: TLabel;
    pKnapsacklbl3: TLabel;
    pKnapsackWeights: TEdit;
    pKnapsacklbl2: TLabel;
    pKnapsackValues: TEdit;
    pNQueenGrid: TStringGrid;
    Shape1: TShape;
    Img2: TImage;
    pNColorClear: TButton;
    Statusbar: TStatusBar;
    Memo: TMemo;
    grpConfig: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    lblsel1: TLabel;
    txtPop: TEdit;
    txtGeners: TEdit;
    chkAutostop: TCheckBox;
    txtPm: TEdit;
    cmbCrossType: TComboBox;
    cmbRndType: TComboBox;
    ChkbeterSel: TCheckBox;
    txtPs: TEdit;
    txtPcnv: TEdit;
    chkBeterMut: TCheckBox;
    Chkmut0: TCheckBox;
    Chkmut2: TCheckBox;
    Chkmut4: TCheckBox;
    Chkmut5: TCheckBox;
    cmbSelType: TComboBox;
    txtSelParam1: TEdit;
    Chkmut6: TCheckBox;
    chkAddresult: TCheckBox;
    Chart: TChart;
    btnChartView: TButton;
    btnChartAdd: TButton;
    btnChartClear: TButton;
    ColorBox: TColorListBox;
    cmbThick: TComboBox;
    btnChartSave: TButton;
    btnChartLoad: TButton;
    btnChartExport: TButton;
    Seri: TLineSeries;
    txtSelParam2: TEdit;
    lblsel2: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    pSquare: TTabSheet;
    pSquareGrid: TStringGrid;
    Label1: TLabel;
    GroupBox6: TGroupBox;
    Label2: TLabel;
    pSquareSize: TEdit;
    UpDown4: TUpDown;
    Label4: TLabel;
    pSquareNumber: TEdit;
    UpDown5: TUpDown;
    pSudoku: TTabSheet;
    pSudokuGrp: TGroupBox;
    pSudokuClear: TButton;
    pSudokuBtnSave: TButton;
    pSudokuBtnLoad: TButton;
    pSudokuGrid: TStringGrid;
    pSudokuClearSol: TButton;
    pSSP: TTabSheet;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label16: TLabel;
    pSspMemo: TMemo;
    pSsptxt: TComboBox;
    Chkmut1: TCheckBox;
    Chkmut3: TCheckBox;
    Chkmut7: TCheckBox;
    pPackaging: TTabSheet;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    pPackVols: TEdit;
    pPackMemo: TMemo;
    Label15: TLabel;
    pPackSize: TEdit;
    UpDown6: TUpDown;
    Label18: TLabel;
    pOpp: TTabSheet;
    pOppGrid: TStringGrid;
    Label20: TLabel;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    pOppPoints: TEdit;
    UpDown7: TUpDown;
    Label23: TLabel;
    pOppDistance: TEdit;
    UpDown8: TUpDown;
    pOppClearGrid: TButton;
    pKpath: TTabSheet;
    pKpathGrid: TStringGrid;
    Label24: TLabel;
    GroupBox7: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    pKpathStart_X: TEdit;
    UpDown10: TUpDown;
    pKpathSize: TEdit;
    UpDown9: TUpDown;
    Label27: TLabel;
    pKpathStart_Y: TEdit;
    UpDown11: TUpDown;
    Label28: TLabel;
    pKpathEnd_X: TEdit;
    UpDown12: TUpDown;
    Label29: TLabel;
    pKpathEnd_Y: TEdit;
    UpDown13: TUpDown;
    pCPP: TTabSheet;
    pCppGrp: TGroupBox;
    pCppClearPuzzle: TButton;
    pCppGrid: TStringGrid;
    Label30: TLabel;
    pCppSize: TEdit;
    UpDown14: TUpDown;
    procedure imgMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnResetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure txtPopExit(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnStpClick(Sender: TObject);
    procedure cubeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure TimerPanelTimer(Sender: TObject);
    procedure cubeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure txtRndCreateExit(Sender: TObject);
    procedure btnRndCreateClick(Sender: TObject);
    procedure DrawLastSol;
    procedure GBoxEnable(State: Boolean);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnChartViewClick(Sender: TObject);
    procedure btnChartAddClick(Sender: TObject);
    procedure btnChartClearClick(Sender: TObject);
    procedure cmbSelTypeSelect(Sender: TObject);
    procedure ChartClickTitle(Sender: TCustomChart; ATitle: TChartTitle; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChartClickSeries(Sender: TCustomChart; Series: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnChartSaveClick(Sender: TObject);
    procedure btnChartLoadClick(Sender: TObject);
    procedure btnChartExportClick(Sender: TObject);
    procedure pKnightGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Img2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pNColorClearClick(Sender: TObject);
    procedure pNQueenGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure PageCtrDesignChange(Sender: TObject);
    procedure pSudokuGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure pSudokuClearClick(Sender: TObject);
    procedure pSudokuBtnSaveClick(Sender: TObject);
    procedure pSudokuBtnLoadClick(Sender: TObject);
    procedure pSudokuGridSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
    procedure pSudokuClearSolClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pOppGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure pOppClearGridClick(Sender: TObject);
    procedure pCppClearPuzzleClick(Sender: TObject);
  private
    procedure SetThreadParams;
    procedure InitmapTsp;
    procedure InitmapNColor;
    procedure InitvalsKnapsack;
    procedure InitvalsPackaging;
    procedure InitvalsSSP;
    procedure InitvalsOPP;
    procedure InitvalsCPP;
    procedure InitvalsSudoku;
    procedure InitvalsKPath;
    procedure InitvalsSquare;
    procedure InitvalsSecret;
    procedure InitvalsQueen;
    procedure InitvalsKnights;

    procedure CheckMutations(Trues: SetOfByte);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Gfrm: TGfrm;

  GAthread: TGAthread; // Genetic thread
  Solution: TChr; // To draw TSP or NColor solution in the gui, when the form resized

  ProblemType: TProblem; // To problem tab determination
  City: tcity; // Saving TSP problem weights
  pos: TPos; // Used to save TSP city positions

  Knap: TKnapsackData;
  Packag: TPackagingData;
  NCol: TNColorData;
  SSpdata: Tsspdata;
  Sudodata: TSudokuData;
  msgData: TSecretMsgData;
  Oppdata: TOppData;
  KPData: TKPathData;
  CppData: TCppData;

  MagicNumber: Integer;
  OutVals: TOutFitness; // To recive solution from GAThread and drawing it in thr GUI

  tsh_counter: Integer = 0;
  tncol_counter: Integer = 0;
  // Counting drawed nodes in TSP & NColor

  Moverpanel: TObject;
  ccity: Integer = -1; // cities count
  cncol: Integer = -1; // nodes count

  Solved: Boolean; // Used in TSP to draw solved tour again, after changing nodes position
  SeriTitle: string; // Title string on top of chat, that exhibited GA parameters

  ActiveProblem: Integer;

implementation

uses Math;
{$R *.dfm}

procedure TGfrm.DrawLastSol; // draws last soloution
var
  j: Integer;
begin

  with Gfrm do
  begin
    img.canvas.Pen.Color := clteal;
    img.canvas.Rectangle(0, 0, img.Width, img.Height);
    if not Solved then
      exit;
    with img.canvas do
    begin
      for j := 0 to ccity - 1 do
      begin
        img.canvas.Pen.Width := 1;
        moveto(pos[Solution[j]].X, pos[Solution[j]].Y);
        lineto(pos[Solution[j + 1]].X, pos[Solution[j + 1]].Y);
      end;
      moveto(pos[Solution[ccity]].X, pos[Solution[ccity]].Y);
      lineto(pos[Solution[0]].X, pos[Solution[0]].Y);
    end;
  end;
end;

procedure TGfrm.btnResetClick(Sender: TObject); // Reset
var
  i: Integer;
  tp: TPanel;
begin
  Solved := false;
  img.Picture := nil;
  tsh_counter := 0;
  img.canvas.Pen.Color := clblack;
  img.canvas.Brush.Color := clwhite;
  img.canvas.Rectangle(0, 0, img.Width, img.Height);
  for i := 0 to ccity do
  begin
    tp := TPanel(Gfrm.pTsp.FindComponent('c' + inttostr(i)));
    if tp <> nil then
    begin
      tp.visible := false;
      tp.Free;
    end;
  end;
  ccity := 0;
end;

procedure TGfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btnStp.Enabled then
    btnStp.Click;
end;

procedure TGfrm.FormResize(Sender: TObject);
begin
  img.Picture := nil;
  img.canvas.Pen.Color := clblack;
  img.canvas.Brush.Color := clwhite;
  img.canvas.Rectangle(0, 0, img.Width, img.Height);
  Img2.Picture := nil;
  Img2.canvas.Pen.Color := clblack;
  Img2.canvas.Brush.Color := clwhite;
  Img2.canvas.Rectangle(0, 0, img.Width, img.Height);
  // if Solved then
  // DrawLastSol;
end;

procedure TGfrm.SetThreadParams;
var
  i: byte;
  mut: string;
begin
  with GAthread do
  begin

    case ProblemType of
      Tsp:
        GeneCount := ccity;

      NQueen:
        GeneCount := StrToInt(pNqueentxt.Text) - 1;

      Secret:
        GeneCount := 32; // Alphabet counts

      NColor:
        GeneCount := cncol;

      Knapsack:
        GeneCount := ccity;

      Knight:
        GeneCount := 63;

      Square:
        GeneCount := StrToInt(pSquareSize.Text) * StrToInt(pSquareSize.Text) - 1;

      Sudoku:
        GeneCount := 81 - Sudodata.FilledCount - 1;

      ssp:
        GeneCount := SSpdata.StringsCount - 1;

      Bpp:
        GeneCount := ccity;

      Opp:
        GeneCount := Oppdata.PointsCount - 1;

      Kpath:
        GeneCount := KPData.len * KPData.len - 3;

      Cpp:
        GeneCount := CppData.Count - 1;

    end;

    Problem := ProblemType;
    TypeCross := cmbCrossType.ItemIndex;
    TypeRandom := cmbRndType.ItemIndex;
    TypeSelection := cmbSelType.ItemIndex;

    mut := '';
    for i := 0 to 7 do
    begin
      TypeMutation[i] := TCheckBox(FindComponent('Chkmut' + inttostr(i))).Checked;
      if TypeMutation[i] then
        mut := mut + 'M' + inttostr(i);
    end;

    ChromoCount := StrToInt(txtPop.Text) - 1;
    GenerCount := StrToInt(txtGeners.Text);
    pm := strtofloat(txtPm.Text); // mutation
    SelectionParam1 := strtofloat(txtSelParam1.Text);
    SelectionParam2 := strtofloat(txtSelParam2.Text);
    ps := strtofloat(txtPs.Text); // selection
    Pcnv := strtofloat(txtPcnv.Text); // seemness
    chkBeterMut := Gfrm.chkBeterMut.Checked;
    chkFitness := Gfrm.chkAutostop.Checked;

    SeriTitle := 'Params= Pop:' + txtPop.Text + ', Geners:' + txtGeners.Text + ', Ps:' +
      txtPs.Text + ', Pm:' + txtPm.Text + ', ' + cmbSelType.Text + ', Sp:' +
      txtSelParam1.Text + ', ' + cmbCrossType.Text + ', Mut:' + mut + ', Ext:' + booltostr
      (chkBeterMut, True);

    enMutation := iif
      (Chkmut0.Checked or Chkmut1.Checked or Chkmut2.Checked or Chkmut3.Checked or Chkmut4.
        Checked or Chkmut5.Checked or Chkmut6.Checked or Chkmut7.Checked, True, false);
  end;
end;

procedure TGfrm.InitmapNColor;
var
  i, j: Integer;
begin

  NCol.ColorCount := StrToInt(pNColorSize.Text) - 1;

  for i := 0 to cncol do
    for j := 0 to cncol do
      NCol.Matrix[j, i] := false;

  for i := 0 to cncol do
  begin
    for j := 0 to cncol div 2 do
      NCol.Matrix[i, RandomRangeX(j, cncol)] := True;
    NCol.Matrix[i, i] := false;
  end;

  for i := 0 to cncol do
    for j := i to cncol do
      NCol.Matrix[j, i] := NCol.Matrix[i, j];
end;

procedure TGfrm.InitmapTsp;
var
  k, j: Integer;
begin
  for j := 0 to ccity do
  // make cities distances
  begin
    City[j, j] := 100000;
    // same as infinity
    for k := j - 1 downto 0 do
    begin
      City[j, k] := sqrt(sqr(pos[j].X - pos[k].X) / 10 + sqr(pos[j].Y - pos[k].Y) / 10);
      City[j, k] := Roundto(City[j, k], -3);
      City[k, j] := City[j, k];
    end;
  end;
end;

procedure TGfrm.InitvalsCPP;
var
  i: Integer;
begin
  if pCppGrid.Tag <> 0 then
    exit;
  pCppGrid.Tag := 1;
  CppData.Count := StrToInt(pCppSize.Text);
  CppData.GridSize := pCppGrid.RowCount;

  SetLength(CppData.Vals, CppData.Count);
  SetLength(CppData.XYs, CppData.Count);

  for i := 0 to CppData.Count - 1 do
  begin
    CppData.Vals[i] := RandomRangeX(2, pCppGrid.RowCount - 2);
    CppData.XYs[i].Row := RandomRangeX(1, pCppGrid.ColCount - 2);
    CppData.XYs[i].Col := RandomRangeX(1, pCppGrid.ColCount - 2);

    pCppGrid.Cells[CppData.XYs[i].Col, CppData.XYs[i].Row] := inttostr(CppData.Vals[i]);
  end;
end;

procedure TGfrm.InitvalsKnapsack;
var
  i: Integer;
  st: TStrings;
begin

  pKnapsackMemo.Clear;
  Knap.KnapsackSize := StrToInt(pKnapsackSize.Text);

  // Setting the weights and values of knapsack boxes
  st := TStringList.Create;
  try
    st.Delimiter := ',';
    st.DelimitedText := pKnapsackWeights.Text;

    ccity := st.Count - 1;
    Knap.MaxWeigth := 0;
    Knap.MaxValue := 0;

    for i := 0 to ccity do
    begin
      Knap.Boxes[i].Weigth := strtofloat(st.Strings[i]);
      Knap.MaxWeigth := Knap.MaxWeigth + Knap.Boxes[i].Weigth;
    end;

    st.Clear;
    st.DelimitedText := pKnapsackValues.Text;

    for i := 0 to ccity do
    begin
      Knap.Boxes[i].Value := strtofloat(st.Strings[i]);
      Knap.MaxValue := Knap.MaxValue + Knap.Boxes[i].Value;
    end;

  finally
    st.Free;
  end;

end;

procedure TGfrm.InitvalsKnights;
var
  i: byte;
begin
  for i := 1 to 8 do
  begin
    pKnightGrid.Cells[i, 0] := inttostr(i);
    pKnightGrid.Cells[0, i] := Chr(ord('A') + i - 1);
  end;
end;

procedure TGfrm.InitvalsKPath;
begin
  with KPData do
  begin
    P1.Row := StrToInt(pKpathStart_X.Text);
    P1.Col := StrToInt(pKpathStart_Y.Text);
    P2.Row := StrToInt(pKpathEnd_X.Text);
    P2.Col := StrToInt(pKpathEnd_Y.Text);
    len := StrToInt(pKpathSize.Text);

    pKpathGrid.RowCount := len;
    pKpathGrid.ColCount := len;

    PN1 := (P1.Row - 1) * len + P1.Col;
    PN2 := (P2.Row - 1) * len + P2.Col;
  end;
end;

procedure TGfrm.InitvalsOPP;
var
  i, j: Integer;
begin

  Oppdata.Distance := StrToInt(pOppDistance.Text);
  Oppdata.PointsCount := StrToInt(pOppPoints.Text);

  SetLength(Oppdata.PPos, Oppdata.PointsCount);
  SetLength(Oppdata.DrawPPos, Oppdata.PointsCount);

  // if grid is empty, then Set initial values for grid positions
  for i := 0 to pOppGrid.RowCount - 1 do
    for j := 0 to pOppGrid.ColCount - 1 do
    begin
      if pOppGrid.Cells[j, i] = '' then
        pOppGrid.Cells[j, i] := inttostr(RandomRangeX(0, 9));

      Oppdata.Grid[i, j] := StrToInt(pOppGrid.Cells[j, i]);
    end;

end;

procedure TGfrm.InitvalsPackaging;
var
  i: Integer;
  st: TStrings;
begin
  pPackMemo.Clear;
  Packag.PackSize := StrToInt(pPackSize.Text);

  st := TStringList.Create;
  try
    st.Delimiter := ',';
    st.DelimitedText := pPackVols.Text;
    ccity := st.Count - 1;
    Packag.PacksCount := st.Count;

    for i := 0 to ccity do
      Packag.Vols[i] := strtofloat(st.Strings[i]);

  finally
    st.Free;
  end;

end;

procedure TGfrm.InitvalsQueen;
begin
  pNQueenGrid.ColCount := StrToInt(pNqueentxt.Text);
  pNQueenGrid.RowCount := pNQueenGrid.ColCount;
end;

procedure TGfrm.InitvalsSecret;
begin

  pSecretMemo.Clear;
  msgData.SecretMsg := pSecrettxt.Text;
  msgData.CodedMsg := pSecretEnctxt.Text;
  msgData.len := Length(pSecrettxt.Text);

end;

procedure TGfrm.InitvalsSquare;
begin
  pSquareGrid.ColCount := StrToInt(pSquareSize.Text) + 1;
  pSquareGrid.RowCount := pSquareGrid.ColCount;
  MagicNumber := StrToInt(pSquareNumber.Text);
end;

procedure TGfrm.InitvalsSSP;
var
  i: Integer;
  st: TStrings;
begin

  pSspMemo.Clear;

  // Setting the weights and values of knapsack boxes
  st := TStringList.Create;
  try
    st.Delimiter := ' ';
    st.DelimitedText := pSsptxt.Text;

    SSpdata.StringsCount := st.Count;
    SetLength(SSpdata.Strings, SSpdata.StringsCount);
    SetLength(SSpdata.Lengths, SSpdata.StringsCount);

    SSpdata.SspMaxlen := Length(pSsptxt.Text) - SSpdata.StringsCount + 1;

    for i := 0 to st.Count - 1 do
    begin
      SSpdata.Strings[i] := st.Strings[i];
      SSpdata.Lengths[i] := Length(SSpdata.Strings[i]);
    end;

  finally
    st.Free;
  end;

end;

procedure TGfrm.InitvalsSudoku;
var
  i, j: Integer;
begin
  Sudodata.FilledCount := 0;

  for i := 0 to 8 do
    for j := 0 to 8 do
    begin
      Sudodata.Bools[i * 9 + j] := pSudokuGrid.Cells[j, i] <> '';
      Sudodata.Cells[i, j] := StrToIntDef(pSudokuGrid.Cells[j, i], 0);
      if Sudodata.Bools[i * 9 + j] then
        inc(Sudodata.FilledCount);
    end;
end;

procedure TGfrm.PageCtrDesignChange(Sender: TObject);
begin
  with grpConfig do
    case PageCtrDesign.ActivePageIndex of
      0: // tsp
        begin
          CheckMutations([0, 2, 5]);
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('NoRepeat');
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('GSX');
        end;
      1: // N-Queen
        begin
          CheckMutations([0, 2]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('GSX');
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('NoRepeat');
        end;
      2: // Secret
        begin
          CheckMutations([0, 2]);
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Scaling Exp');
          cmbSelTypeSelect(nil);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('Random');
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('Random');
        end;
      3, 4, 6: // N-Color, Knapsack, Square
        begin
          CheckMutations([0, 2]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('Uniform');
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('NoRepeat');
        end;
      5: // Knight Tour
        begin
          CheckMutations([0, 2, 7]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('GSX');
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Ranking Bias1');
          cmbSelTypeSelect(nil);
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('Random');
        end;
      7: // Sudoku
        begin
          CheckMutations([2]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('Uniform');
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Ranking Bias1');
          cmbSelTypeSelect(nil);
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('NoRepeat');
          txtSelParam1.Text := '1.9';
        end;
      8: // SSP
        begin
          CheckMutations([0, 3]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('Uniform');
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Ranking Linear');
          cmbSelTypeSelect(nil);
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('NoRepeat');
        end;
      9: // Packaging
        begin
          CheckMutations([0, 2]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('Uniform');
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Truncation');
          cmbSelTypeSelect(nil);
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('NoRepeat');
        end;
      10: // Opp
        begin
          CheckMutations([0, 2]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('2-Point');
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Boltzman');
          cmbSelTypeSelect(nil);
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('NoRepeat');
        end;
      11: // Kpath
        begin
          CheckMutations([0, 1, 2, 3, 4]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('Uniform');
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Ranking Linear');
          cmbSelTypeSelect(nil);
          cmbRndType.ItemIndex := cmbRndType.Items.IndexOf('Random');
        end;
      12: // Corral
        begin
          CheckMutations([0, 2]);
          cmbCrossType.ItemIndex := cmbCrossType.Items.IndexOf('Uniform');
          cmbSelType.ItemIndex := cmbSelType.Items.IndexOf('Ranking Linear');
          cmbSelTypeSelect(nil);
        end;
    end;
end;

procedure TGfrm.pKnightGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  if (ACol > 0) and (ARow > 0) then
  begin
    if (odd(ACol + ARow)) then
    begin
      pKnightGrid.canvas.Brush.Color := clwhite
    end
    else
    begin
      pKnightGrid.canvas.Brush.Color := clblack;
    end;

    pKnightGrid.canvas.FillRect(Rect);
    pKnightGrid.Font.Color := clred;
    pKnightGrid.canvas.TextOut(Rect.Left + 9, Rect.Top + 9, pKnightGrid.Cells[ACol, ARow]);

  end;
end;

procedure TGfrm.FormShow(Sender: TObject);
begin
  // randomize;
  btnReset.Click;
end;

procedure TGfrm.GBoxEnable(State: Boolean);
var
  i: Integer;
begin
  for i := 0 to grpConfig.ControlCount - 1 do
    grpConfig.Controls[i].Enabled := State;
  pTsp.Enabled := State;
  btnStp.Enabled := not State;
  TabAnalyse.Enabled := State;
  PageCtrDesign.Enabled := State;
end;

procedure TGfrm.Img2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    if tncol_counter < 10 then
    begin
      // dont draw last solution Cause the city added
      Solved := false;
      with TPanel.Create(pNColor) do
      begin
        parent := pNColor;
        name := 'shp' + inttostr(tncol_counter);
        // Left := X - 15;
        // Top := Y + 50;
        Left := X - 6;
        Top := Y + 55;
        Width := cube.Width - 3;
        Height := cube.Height - 3;
        ControlStyle := cube.ControlStyle;
        visible := True;
        caption := '';
        // Shape := stCircle;
        // Pen.Width := 2;
        // Pen.Color := Shape1.Pen.Color;
        // Brush.Color := Shape1.Brush.Color;
        Tag := tncol_counter;
        BevelKind := bkflat;
        BevelOuter := bvnone;

      end;
      pos[tncol_counter] := point(X, Y);
      inc(tncol_counter);
    end;
    cncol := tncol_counter - 1; // wer
  end;
end;

procedure TGfrm.btnGoClick(Sender: TObject); // Start procedure
begin

  // No solution selected
  if (PageCtrDesign.ActivePage.caption = 'Analyse') or
    (PageCtrDesign.ActivePage.caption = 'Monitor') then
    exit;

  if btnGo.caption = 'Pause' then
  begin
    GAthread.Suspend;
    GBoxEnable(True);
    btnGo.caption := 'Resume';
  end
  else
  begin
    if btnGo.caption = 'GO!' then
    begin
      randomize;

      // set solution number
      ProblemType := TProblem(PageCtrDesign.ActivePageIndex);

      case ProblemType of
        Tsp:
          begin
            InitmapTsp;
            if ccity = 0 then
              exit;
          end;

        NQueen:
          InitvalsQueen;

        Secret:
          InitvalsSecret;

        NColor:
          begin
            if cncol = 0 then
              exit;
            InitmapNColor;
          end;

        Knapsack:
          InitvalsKnapsack;

        Knight:
          InitvalsKnights;

        Square:
          InitvalsSquare;

        Sudoku:
          begin
            InitvalsSudoku;
            if Sudodata.FilledCount = 81 then
              exit;
          end;

        ssp:
          InitvalsSSP;

        Bpp:
          InitvalsPackaging;

        Opp:
          InitvalsOPP;

        Kpath:
          InitvalsKPath;

        Cpp:
          InitvalsCPP;

      end;

      GBoxEnable(false);
      Memo.Clear;
      Solved := false;
      GAthread := TGAthread.Create(True);

    end; // of GO!

    btnGo.caption := 'Pause'; // cause of after resume
    GBoxEnable(false); // cause of after resume

    SetThreadParams;
    with GAthread do
    begin
      Priority := tpnormal;
      // FreeOnTerminate:=true;
      Resume;
    end;

  end;
end;

procedure TGfrm.btnRndCreateClick(Sender: TObject);
var
  i, h: Integer;
begin
  h := StrToInt(txtRndCreate.Text) - 1;
  for i := 0 to h do
  begin
    imgMouseUp(img, mbLeft, KeysToShiftState(0), RandomRangeX(img.Left + 30, img.Width - 30),
      RandomRangeX(img.Top - 30, img.Height - 30));
  end;
end;

procedure TGfrm.btnLoadClick(Sender: TObject);
var
  Buf: TMemoryStream;
  i: Integer;
begin
  btnReset.Click;
  with DlgOpen do
  begin
    Filter := 'TSP Map (*.Tsm)|*.Tsm';
    DefaultExt := 'Tsm';
    Title := 'Load Map';
  end;
  if DlgOpen.Execute then
  begin
    Buf := TMemoryStream.Create;
    try
      Buf.LoadFromFile(DlgOpen.FileName);
      Buf.Seek(0, soFromBeginning);
      Buf.ReadBuffer(pos, sizeof(pos));
      Buf.ReadBuffer(ccity, sizeof(ccity));
    finally
      Buf.Free;
    end;
    for i := 0 to ccity do
      imgMouseUp(img, mbLeft, KeysToShiftState(0), pos[i].X, pos[i].Y);
  end;
end;

procedure TGfrm.btnSaveClick(Sender: TObject);
var
  Buf: TMemoryStream;
begin
  with DlgSave do
  begin
    Filter := 'TSP Map (*.Tsm)|*.Tsm';
    DefaultExt := 'Tsm';
    Title := 'Save Map';
  end;
  if DlgSave.Execute then
  begin
    Buf := TMemoryStream.Create;
    try
      Buf.Seek(0, soFromBeginning);
      Buf.WriteBuffer(pos, sizeof(pos));
      Buf.WriteBuffer(ccity, sizeof(ccity));
      Buf.SaveToFile(DlgSave.FileName);
    finally
      Buf.Free;
    end;
  end;
end;

procedure TGfrm.txtPopExit(Sender: TObject);
begin
  if Sender = txtPop then
  begin
    if (StrToInt(txtPop.Text) > Mcr) or (StrToInt(txtPop.Text) < 5) then
      txtPop.Text := '100';
  end
  else if Sender = txtGeners then
  begin
    if (StrToInt(txtGeners.Text) > 100000) or (StrToInt(txtGeners.Text) < 10) then
      txtGeners.Text := '1000';
  end
  else if Sender = txtPs then
  begin
    if (strtofloat(txtPs.Text) > 1) or (strtofloat(txtPs.Text) < 0.1) then
      txtPs.Text := '1';
    TEdit(Sender).Text := FloatToStr(SimpleRoundTo(strtofloat(TEdit(Sender).Text), -2));
  end
  else if Sender = txtPm then
  begin
    if (strtofloat(txtPm.Text) > 1) or (strtofloat(txtPm.Text) < 0.01) then
      txtPm.Text := '0.30';
    TEdit(Sender).Text := FloatToStr(SimpleRoundTo(strtofloat(TEdit(Sender).Text), -2));
  end
  else if Sender = txtPcnv then
  begin
    if (strtofloat(txtPcnv.Text) > 0.99) or (strtofloat(txtPcnv.Text) < 0.3) then
      txtPcnv.Text := '0.95';
    TEdit(Sender).Text := FloatToStr(SimpleRoundTo(strtofloat(TEdit(Sender).Text), -2));
  end;
end;

procedure TGfrm.btnChartAddClick(Sender: TObject);
var
  i: Integer;
  Seri: TLineSeries;
begin
  if Length(OutVals) > 0 then
    with Chart do
    begin
      Seri := TLineSeries.Create(nil);
      Seri.Clear;
      Seri.Title := SeriTitle;
      Chart.Title.caption := SeriTitle;
      // s.Title:='asdf';
      Seri.ParentChart := Chart;
      Seri.Color := ColorBox.Selected;
      Seri.LinePen.Width := cmbThick.ItemIndex + 1;
      for i := 0 to Length(OutVals) - 1 do
        if ProblemType = Tsp then
          Seri.AddXY(Seri.Count, OutVals[i] * 100)
        else
          Seri.AddXY(Seri.Count, OutVals[i]);
    end;
end;

procedure TGfrm.btnChartViewClick(Sender: TObject);
begin
  Chart.View3D := not Chart.View3D;
end;

procedure TGfrm.btnAboutClick(Sender: TObject);
begin
  // showmessage('Coded By: Mohammad Shams'#10#13'     M.Shams.J@Gmail.com'#10#13'              12/18/2007');
  AboutBox.ShowModal;
end;

procedure TGfrm.btnStpClick(Sender: TObject);
begin
  if GAthread <> nil then
    GAthread.Terminate;
  if GAthread.Suspended then
    GAthread.Resume;

  GAthread.WaitFor;
  FreeAndNil(GAthread);
  GBoxEnable(True);
  btnGo.caption := 'GO!';
end;

procedure TGfrm.pCppClearPuzzleClick(Sender: TObject);
var
  i: Integer;
begin
  pCppGrid.Tag := 0;
  for i := 0 to pCppGrid.RowCount - 1 do
    pCppGrid.Rows[i].Text := '';
end;

procedure TGfrm.pOppClearGridClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to pOppGrid.RowCount - 1 do
    pOppGrid.Rows[i].Clear;
end;

procedure TGfrm.pNColorClearClick(Sender: TObject);
var
  i: Integer;
  tshp: TShape;
begin
  Img2.Picture := nil;
  for i := 0 to cncol do
  begin
    tshp := TShape(Gfrm.pNColor.FindComponent('shp' + inttostr(i)));
    if tshp <> nil then
    begin
      tshp.visible := false;
      tshp.Free;
    end;
  end;
  cncol := 0;
  tncol_counter := 0;
end;

procedure TGfrm.pNQueenGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  begin

    if (odd(ACol + ARow)) then
    begin
      canvas.Brush.Color := clwhite
    end
    else
    begin
      canvas.Brush.Color := clGray;
    end;

    canvas.FillRect(Rect);
    Font.Color := clblue;
    canvas.TextOut(Rect.Left + 1, Rect.Top + 1, Cells[ACol, ARow]);
  end;
end;

procedure TGfrm.pOppGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  i: Integer;
begin
  with (Sender as TStringGrid) do
  begin

    for i := 0 to Oppdata.PointsCount - 1 do
      if (ARow = Oppdata.DrawPPos[i].Row) and (ACol = Oppdata.DrawPPos[i].Col) then
      begin
        canvas.Brush.Color := clSkyBlue;

        break;
      end;

    canvas.FillRect(Rect);
    canvas.Font.Size := 6 + StrToIntDef(Cells[ACol, ARow], 2);
    canvas.TextOut(Rect.Left + 3, Rect.Top + 3, Cells[ACol, ARow]);

  end;
end;

procedure TGfrm.pSudokuBtnLoadClick(Sender: TObject);
begin
  with DlgOpen do
  begin
    Filter := 'Sudoku Puzzle (*.Sdp)|*.Sdp';
    DefaultExt := 'Sdp';
    Title := 'Load Puzzle';
  end;

  if DlgOpen.Execute then
    LoadGridFromFile(pSudokuGrid, DlgOpen.FileName);
end;

procedure TGfrm.pSudokuBtnSaveClick(Sender: TObject);
begin
  with DlgSave do
  begin
    Filter := 'Sudoku Puzzle (*.Sdp)|*.Sdp';
    DefaultExt := 'Sdp';
    Title := 'Save Puzzle';
  end;
  if DlgSave.Execute then
    SaveGrid2File(pSudokuGrid, DlgSave.FileName);
end;

procedure TGfrm.pSudokuClearClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to pSudokuGrid.RowCount - 1 do
    pSudokuGrid.Rows[i].Text := '';
end;

procedure TGfrm.pSudokuClearSolClick(Sender: TObject);
var
  i, j: Integer;
begin
  for i := 0 to 8 do
    for j := 0 to 8 do
      if not Sudodata.Bools[i * 9 + j] then
        pSudokuGrid.Cells[j, i] := '';
end;

procedure TGfrm.pSudokuGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  begin
    if odd(ACol div 3) xor odd(ARow div 3) then
    begin
      canvas.Brush.Color := clwhite;
    end
    else
    begin
      canvas.Brush.Color := $00F9E9E6;
    end;

    canvas.FillRect(Rect);
    Font.Color := clgreen;
    if Cells[ACol, ARow] <> '' then
      canvas.TextOut(Rect.Left + 9, Rect.Top + 9, Cells[ACol, ARow]);

    // canvas.Brush.Color:= clred;
    // FrameRect(canvas.Handle, Rect, canvas.Brush.Handle);
  end;

end;

procedure TGfrm.pSudokuGridSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
begin
  if not(StrToIntDef(Value, 10) in [1 .. 9]) then
    TStringGrid(Sender).Cells[ACol, ARow] := '';
end;

procedure TGfrm.btnChartSaveClick(Sender: TObject);
begin
  with DlgSave do
  begin
    Filter := 'TSP Analyse chart (*.Tcr)|*.Tcr';
    DefaultExt := 'Tcr';
    Title := 'Save Chart';
  end;
  if DlgSave.Execute then
    SaveChartToFile(Chart, DlgSave.FileName, True, True);
end;

procedure TGfrm.ChartClickSeries(Sender: TCustomChart; Series: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Sender.Title.visible := True;
  Sender.Title.caption := Series.Title;
end;

procedure TGfrm.ChartClickTitle(Sender: TCustomChart; ATitle: TChartTitle; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ATitle.visible := not ATitle.visible;
end;

procedure TGfrm.CheckMutations(Trues: SetOfByte);
var
  i: Integer;
begin
  for i := 0 to 7 do
    TCheckBox(FindComponent('Chkmut' + inttostr(i))).Checked := (i in Trues);
end;

procedure TGfrm.btnChartClearClick(Sender: TObject);
begin
  // chart;
  Chart.RemoveAllSeries;
  Chart.Refresh;
end;

procedure TGfrm.btnChartExportClick(Sender: TObject);
begin
  // teexport.TeeExport(self,chart);
end;

procedure TGfrm.btnChartLoadClick(Sender: TObject);
begin
  with DlgOpen do
  begin
    Filter := 'TSP Analyse chart (*.Tcr)|*.Tcr';
    DefaultExt := 'Tcr';
    Title := 'Load Chart';
  end;
  if DlgOpen.Execute then
    LoadChartFromFile(TCustomChart(Chart), DlgOpen.FileName);
  Chart.Refresh;
  Chart.Repaint;
end;

procedure TGfrm.txtRndCreateExit(Sender: TObject);
begin
  if (StrToInt(txtRndCreate.Text) > MC) or (StrToInt(txtRndCreate.Text) < 2) then
    txtRndCreate.Text := '20';
end;

procedure TGfrm.cmbSelTypeSelect(Sender: TObject);
begin
  txtSelParam1.Enabled := True;
  txtSelParam2.Enabled := True;
  case cmbSelType.ItemIndex of
    1 .. 2: // Tournament
      begin
        txtSelParam1.Text := inttostr(StrToInt(txtPop.Text) * 15 div 100);
        txtSelParam2.Text := '0.75';
        lblsel1.caption := 'Pool Size';
        lblsel2.caption := 'P: Best/Worst';
        // 1 < Param < N
      end;
    4: // Ranking Exp
      begin
        txtSelParam1.Text := '0.001';
        lblsel1.caption := 'Base Value';
        txtSelParam2.Text := '0';
        lblsel2.caption := 'No Parameter';
        txtSelParam2.Enabled := false;
        // 1 < Param < N
      end;
    5, 6: // Ranking Bias
      begin
        txtSelParam1.Text := '20';
        lblsel1.caption := 'Bias Value';
        txtSelParam2.Text := '0';
        lblsel2.caption := 'No Parameter';
        txtSelParam2.Enabled := false;
      end;
    7: // Ranking NoLinear
      begin
        txtSelParam1.Text := '0.9';
        lblsel1.caption := 'Pressure';
        txtSelParam2.Text := '0';
        lblsel2.caption := 'No Parameter';
        txtSelParam2.Enabled := false;
      end;
    9: // Scaling Linear
      begin
        txtSelParam1.Text := '9';
        lblsel1.caption := 'Factor Value';
        txtSelParam2.Text := '0';
        lblsel2.caption := 'No Parameter';
        txtSelParam2.Enabled := false;
        // 0 < Param < 1
      end;
    11: // Truncation
      begin
        txtSelParam1.Text := '15';
        lblsel1.caption := 'Trunc Percent';
        txtSelParam2.Text := '0';
        lblsel2.caption := 'No Parameter';
        txtSelParam2.Enabled := false;
        // 0 < Param < 1
      end;

  else
    begin
      txtSelParam1.Text := '0';
      txtSelParam2.Text := '0';
      lblsel1.caption := 'No Parameter';
      lblsel2.caption := 'No Parameter';
      txtSelParam1.Enabled := false;
      txtSelParam2.Enabled := false;
    end;
  end;
end;

procedure TGfrm.cubeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    TPanel(Sender).BorderStyle := bsSingle;
    if Moverpanel <> nil then
      TPanel(Moverpanel).Color := clSkyBlue;
    Moverpanel := Sender;
    TPanel(Sender).Color := clyellow;
    TimerPanel.Enabled := True;
  end
  else
  begin
    Moverpanel := nil;
    TPanel(Sender).Color := clSkyBlue;
  end;
end;

procedure TGfrm.cubeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  TimerPanel.Enabled := false;
  TPanel(Sender).BorderStyle := bsnone;
  pos[TPanel(Sender).Tag] := point(TPanel(Sender).Left + 6, TPanel(Sender).Top - 55);
  DrawLastSol;
  // Moverpanel:=nil;
end;

procedure TGfrm.TimerPanelTimer(Sender: TObject);
begin
  if Moverpanel <> nil then
    with TPanel(Moverpanel) do
    begin
      Left := mouse.CursorPos.X - Gfrm.Left - 18;
      Top := mouse.CursorPos.Y - Gfrm.Top - 65;
    end;
end;

procedure TGfrm.imgMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    if tsh_counter < MC + 1 then
    begin
      Solved := false; // dont draw last solution Cause the city added
      with TPanel.Create(pTsp) do
      begin
        parent := pTsp;
        name := 'c' + inttostr(tsh_counter);
        Left := X - 6;
        Top := Y + 55;
        Width := cube.Width - 3;
        Height := cube.Height - 3;
        BevelKind := bkflat;
        BevelOuter := bvnone;
        Color := clSkyBlue;
        cursor := crdrag;
        Font.Size := 5;
        hint := 'Dragable';
        ControlStyle := cube.ControlStyle;
        OnMouseDown := cubeMouseDown;
        OnMouseup := cubeMouseUp;
        visible := True;
        caption := inttostr(tsh_counter);
        Tag := tsh_counter;
      end;
      pos[tsh_counter] := point(X, Y);
      inc(tsh_counter); // wer
    end;
    ccity := tsh_counter - 1; // wer
  end;

  if Moverpanel <> nil then
  begin
    TPanel(Moverpanel).Color := clSkyBlue;
    Moverpanel := nil;
  end;
end;

end.
