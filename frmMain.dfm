object Gfrm: TGfrm
  Left = 183
  Top = 50
  Caption = 'GA-LAB V1.0'
  ClientHeight = 591
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 641
    Top = 0
    Width = 203
    Height = 572
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object grpConfig: TGroupBox
      Left = 0
      Top = 89
      Width = 203
      Height = 483
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Setting'
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object Label5: TLabel
        Left = 114
        Top = 26
        Width = 67
        Height = 13
        Caption = 'Chromosomes'
      end
      object Label6: TLabel
        Left = 114
        Top = 50
        Width = 58
        Height = 13
        Caption = 'Generations'
      end
      object Label7: TLabel
        Left = 114
        Top = 99
        Width = 42
        Height = 13
        Caption = 'Mutation'
      end
      object Label8: TLabel
        Left = 11
        Top = 289
        Width = 69
        Height = 13
        Caption = 'Mutation Type'
      end
      object Label9: TLabel
        Left = 114
        Top = 261
        Width = 76
        Height = 13
        Caption = 'Crossover Type'
      end
      object Label10: TLabel
        Left = 114
        Top = 157
        Width = 57
        Height = 13
        Caption = 'Genes Type'
      end
      object Label11: TLabel
        Left = 114
        Top = 74
        Width = 43
        Height = 13
        Caption = 'Selection'
      end
      object Label12: TLabel
        Left = 114
        Top = 122
        Width = 64
        Height = 13
        Caption = 'Convergence'
      end
      object Label13: TLabel
        Left = 11
        Top = 387
        Width = 28
        Height = 13
        Caption = 'Other'
      end
      object Label3: TLabel
        Left = 114
        Top = 184
        Width = 70
        Height = 13
        Caption = 'Selection Type'
      end
      object lblsel1: TLabel
        Left = 114
        Top = 210
        Width = 66
        Height = 13
        Caption = 'No Parameter'
      end
      object lblsel2: TLabel
        Left = 114
        Top = 235
        Width = 66
        Height = 13
        Caption = 'No Parameter'
      end
      object txtPop: TEdit
        Left = 10
        Top = 23
        Width = 98
        Height = 19
        Hint = 'Count of the individuals in population'
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 0
        Text = '100'
        OnEnter = txtPopExit
        OnExit = txtPopExit
      end
      object txtGeners: TEdit
        Left = 10
        Top = 48
        Width = 98
        Height = 19
        Hint = 'Count of GA execution iterations'
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 1
        Text = '1000'
        OnEnter = txtPopExit
        OnExit = txtPopExit
      end
      object chkAutostop: TCheckBox
        Left = 10
        Top = 433
        Width = 174
        Height = 17
        Caption = 'Auto-detecting stop condition'
        TabOrder = 16
      end
      object txtPm: TEdit
        Left = 10
        Top = 97
        Width = 98
        Height = 19
        Hint = 'Probability of mutation in every individual'
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 3
        Text = '0.30'
        OnEnter = txtPopExit
        OnExit = txtPopExit
      end
      object cmbCrossType: TComboBox
        Left = 10
        Top = 258
        Width = 98
        Height = 21
        Hint = 'Individual'#39's mating method'
        Style = csDropDownList
        ItemIndex = 6
        TabOrder = 8
        Text = 'GSX'
        Items.Strings = (
          'None'
          'Random'
          '1-Point'
          '2-Point'
          'Uniform'
          'GST'
          'GSX'
          'Greedy1pt'
          'Greedy2'
          'PMX'
          'Circular'
          'NoRepeat'
          'Both')
      end
      object cmbRndType: TComboBox
        Left = 10
        Top = 154
        Width = 98
        Height = 21
        Hint = 'Type of initial population creation'
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 5
        Text = 'NoRepeat'
        Items.Strings = (
          'Random'
          'NoRepeat')
      end
      object ChkbeterSel: TCheckBox
        Left = 10
        Top = 418
        Width = 166
        Height = 17
        Caption = 'Only Improving Crossover'
        Enabled = False
        TabOrder = 15
      end
      object txtPs: TEdit
        Left = 10
        Top = 72
        Width = 98
        Height = 19
        Hint = 'Total amount of individuals selection'
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 2
        Text = '0.95'
        OnEnter = txtPopExit
        OnExit = txtPopExit
      end
      object txtPcnv: TEdit
        Left = 10
        Top = 120
        Width = 98
        Height = 19
        Hint = 'Schema theorem percent'
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 4
        Text = '0.95'
        OnEnter = txtPopExit
        OnExit = txtPopExit
      end
      object chkBeterMut: TCheckBox
        Left = 10
        Top = 403
        Width = 166
        Height = 17
        Caption = 'Only Improving Mutation'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 14
      end
      object Chkmut0: TCheckBox
        Left = 10
        Top = 304
        Width = 71
        Height = 17
        Hint = 'Random values of genes'
        Caption = 'Random'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object Chkmut2: TCheckBox
        Left = 10
        Top = 334
        Width = 71
        Height = 17
        Hint = 'Random displacements of genes'
        Caption = 'Swapping'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object Chkmut4: TCheckBox
        Left = 10
        Top = 364
        Width = 63
        Height = 17
        Hint = 'Iterative greedy mutation'
        Caption = 'Greedy'
        TabOrder = 11
      end
      object Chkmut5: TCheckBox
        Left = 95
        Top = 304
        Width = 63
        Height = 17
        Hint = 'Random 2Opt method of Sengoku & Yoshihara'
        Caption = 'Rnd 2Opt'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object cmbSelType: TComboBox
        Left = 10
        Top = 181
        Width = 98
        Height = 21
        Hint = 'Individual'#39's selection method'
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 6
        Text = 'Roulette'
        OnSelect = cmbSelTypeSelect
        Items.Strings = (
          'Roulette'
          'Tournament Rnd'
          'Tournament Uniq'
          'Ranking Linear'
          'Ranking Exp'
          'Ranking Bias1'
          'Ranking Bias2'
          'Ranking NoLinear'
          'Boltzman'
          'Scaling Linear'
          'Scaling Exp'
          'Truncation')
      end
      object txtSelParam1: TEdit
        Left = 10
        Top = 208
        Width = 98
        Height = 19
        Hint = 'Selection'#39's parameter'
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        Enabled = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 7
        Text = '0'
      end
      object Chkmut6: TCheckBox
        Left = 95
        Top = 319
        Width = 63
        Height = 17
        Hint = 'Full iteration 2Opt method of Sengoku & Yoshihara'
        Caption = 'Full 2Opt'
        TabOrder = 13
      end
      object chkAddresult: TCheckBox
        Left = 10
        Top = 448
        Width = 174
        Height = 17
        Caption = 'Add result to analyzer chart'
        Checked = True
        State = cbChecked
        TabOrder = 17
      end
      object txtSelParam2: TEdit
        Left = 10
        Top = 233
        Width = 98
        Height = 19
        Hint = 'Selection'#39's parameter'
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        Enabled = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 18
        Text = '0'
      end
      object Chkmut1: TCheckBox
        Left = 10
        Top = 319
        Width = 71
        Height = 17
        Hint = 'Flipped values of genes'
        Caption = 'Flipping'
        TabOrder = 19
      end
      object Chkmut3: TCheckBox
        Left = 10
        Top = 349
        Width = 79
        Height = 17
        Hint = 'Random invertion of genes'
        Caption = 'Invertion'
        TabOrder = 20
      end
      object Chkmut7: TCheckBox
        Left = 95
        Top = 334
        Width = 90
        Height = 17
        Caption = 'Knight Cycle'
        TabOrder = 21
      end
    end
    object pnlBtns: TPanel
      Left = 0
      Top = 0
      Width = 203
      Height = 89
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnGo: TButton
        Left = 9
        Top = 8
        Width = 184
        Height = 25
        Caption = 'GO!'
        TabOrder = 0
        OnClick = btnGoClick
      end
      object btnStp: TButton
        Left = 9
        Top = 32
        Width = 184
        Height = 25
        Caption = 'Urgent stop'
        Enabled = False
        TabOrder = 1
        OnClick = btnStpClick
      end
      object btnAbout: TButton
        Left = 9
        Top = 56
        Width = 184
        Height = 25
        Caption = 'About'
        TabOrder = 2
        OnClick = btnAboutClick
      end
    end
  end
  object PageCtrDesign: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 638
    Height = 569
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = pTsp
    Align = alClient
    TabOrder = 1
    OnChange = PageCtrDesignChange
    object pTsp: TTabSheet
      Caption = 'TSP'
      object img: TImage
        Left = 0
        Top = 62
        Width = 630
        Height = 479
        Cursor = crHandPoint
        Align = alClient
        OnMouseUp = imgMouseUp
        ExplicitLeft = 1
        ExplicitTop = 72
        ExplicitWidth = 627
        ExplicitHeight = 657
      end
      object cube: TPanel
        Left = 232
        Top = 32
        Width = 17
        Height = 17
        Cursor = crDrag
        Hint = 'Dragable'
        BevelKind = bkFlat
        BevelOuter = bvNone
        BevelWidth = 2
        Caption = '99'
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnMouseDown = cubeMouseDown
        OnMouseUp = cubeMouseUp
      end
      object pTSPGrp: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 56
        Align = alTop
        Caption = 'Travelling Salesman Option'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 1
        DesignSize = (
          624
          56)
        object pTSPlbl: TLabel
          Left = 15
          Top = 25
          Width = 68
          Height = 13
          Caption = 'Random Cities'
        end
        object btnReset: TButton
          Left = 326
          Top = 17
          Width = 99
          Height = 25
          Hint = 'Clear MAP'
          Anchors = [akTop, akRight]
          Caption = 'Clear'
          TabOrder = 0
          OnClick = btnResetClick
        end
        object btnSave: TButton
          Left = 559
          Top = 17
          Width = 50
          Height = 25
          Hint = 'Save MAP'
          Caption = 'Save'
          TabOrder = 1
          OnClick = btnSaveClick
        end
        object btnLoad: TButton
          Left = 510
          Top = 17
          Width = 50
          Height = 25
          Hint = 'Load MAP'
          Caption = 'Load'
          TabOrder = 2
          OnClick = btnLoadClick
        end
        object btnRndCreate: TButton
          Left = 137
          Top = 17
          Width = 134
          Height = 25
          Caption = 'Create Random Cities'
          TabOrder = 3
          OnClick = btnRndCreateClick
        end
        object txtRndCreate: TEdit
          Left = 89
          Top = 20
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 7
          ParentCtl3D = False
          TabOrder = 4
          Text = '20'
          OnExit = txtRndCreateExit
        end
      end
    end
    object pNQueen: TTabSheet
      Caption = 'N-Queen'
      ImageIndex = 2
      DesignSize = (
        630
        541)
      object pNQueenlbl2: TLabel
        Left = 18
        Top = 67
        Width = 70
        Height = 13
        Caption = 'Chesse board:'
      end
      object pNQueenGrp: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 623
        Height = 59
        Margins.Right = 4
        Align = alTop
        Caption = 'N-Queen Option'
        TabOrder = 0
        object pNQueenlbl: TLabel
          Left = 15
          Top = 25
          Width = 71
          Height = 13
          Caption = 'Queens count:'
        end
        object pNqueentxt: TEdit
          Left = 92
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 0
          Text = '10'
        end
        object UpDown1: TUpDown
          Left = 134
          Top = 23
          Width = 19
          Height = 19
          Associate = pNqueentxt
          Min = 1
          Position = 10
          TabOrder = 1
        end
      end
      object pNQueenGrid: TStringGrid
        Left = 18
        Top = 86
        Width = 591
        Height = 435
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 12
        DefaultColWidth = 25
        DefaultRowHeight = 25
        FixedCols = 0
        RowCount = 12
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnDrawCell = pNQueenGridDrawCell
      end
    end
    object pSecretMessage: TTabSheet
      Caption = 'Message'
      ImageIndex = 3
      DesignSize = (
        630
        541)
      object pSecretlbl: TLabel
        Left = 19
        Top = 154
        Width = 34
        Height = 13
        Caption = 'Output'
      end
      object pSecretGrp: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 134
        Align = alTop
        Caption = 'Secret Message Option'
        TabOrder = 0
        object pSecretlbl1: TLabel
          Left = 16
          Top = 27
          Width = 80
          Height = 13
          Caption = 'Secret message:'
        end
        object pSecretlbl2: TLabel
          Left = 16
          Top = 76
          Width = 98
          Height = 13
          Caption = 'Encrypted message:'
        end
        object pSecrettxt: TEdit
          Left = 16
          Top = 46
          Width = 585
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = #1575#1604#1711#1608#1585#1740#1578#1605' '#1688#1606#1578#1740#1705' '#1593#1605#1604#1740' '#1608' '#1705#1575#1585#1576#1585#1583#1740
        end
        object pSecretEnctxt: TEdit
          Left = 16
          Top = 95
          Width = 585
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = #1582' '#1586#1608#1594#1740#1578#1605#1670#1688#1606#1578#1740#1579#1670#1593#1605' '#1740#1670#1608#1670#1579#1582#1711#1576#1594#1583#1607
        end
      end
      object pSecretMemo: TMemo
        Left = 19
        Top = 173
        Width = 585
        Height = 348
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object pNColor: TTabSheet
      Caption = 'N-Color'
      ImageIndex = 4
      object Img2: TImage
        Left = 0
        Top = 65
        Width = 630
        Height = 476
        Cursor = crHandPoint
        Align = alClient
        OnMouseUp = Img2MouseUp
        ExplicitLeft = 1
        ExplicitTop = 72
        ExplicitWidth = 627
        ExplicitHeight = 657
      end
      object Shape1: TShape
        Left = 487
        Top = 150
        Width = 26
        Height = 27
        Brush.Color = clBtnFace
        Pen.Color = clSkyBlue
        Pen.Width = 2
        Shape = stCircle
        Visible = False
      end
      object GroupBox4: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 59
        Align = alTop
        Caption = 'N-Color Option'
        TabOrder = 0
        DesignSize = (
          624
          59)
        object Label19: TLabel
          Left = 15
          Top = 25
          Width = 106
          Height = 13
          Caption = 'Maximum Color count:'
        end
        object pNColorSize: TEdit
          Left = 127
          Top = 25
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 0
          Text = '5'
        end
        object pNColorClear: TButton
          Left = 510
          Top = 20
          Width = 99
          Height = 25
          Hint = 'Clear MAP'
          Anchors = [akTop, akRight]
          Caption = 'Clear'
          TabOrder = 1
          OnClick = pNColorClearClick
        end
        object UpDown2: TUpDown
          Left = 169
          Top = 25
          Width = 16
          Height = 19
          Associate = pNColorSize
          Min = 1
          Position = 5
          TabOrder = 2
        end
      end
    end
    object pKnapsack: TTabSheet
      Caption = 'Knapsack'
      ImageIndex = 6
      DesignSize = (
        630
        541)
      object Label21: TLabel
        Left = 18
        Top = 181
        Width = 34
        Height = 13
        Caption = 'Output'
      end
      object GroupBox5: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 157
        Align = alTop
        Caption = 'Knapsack Option'
        TabOrder = 0
        object pKnapsacklbl1: TLabel
          Left = 15
          Top = 25
          Width = 47
          Height = 13
          Caption = 'Sack size:'
        end
        object pKnapsacklbl3: TLabel
          Left = 15
          Top = 102
          Width = 67
          Height = 13
          Caption = 'Boxes Values:'
        end
        object pKnapsacklbl2: TLabel
          Left = 15
          Top = 54
          Width = 75
          Height = 13
          Caption = 'Boxes Weights:'
        end
        object pKnapsackSize: TEdit
          Left = 79
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 0
          Text = '17'
        end
        object pKnapsackWeights: TEdit
          Left = 15
          Top = 73
          Width = 594
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          Text = '2, 4, 7, 9, 1, 3, 4, 2, 1, 6, 8, 10, 12, 9, 8, 11, 7, 10'
        end
        object pKnapsackValues: TEdit
          Left = 15
          Top = 121
          Width = 594
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          Text = 
            '8.5, 6.0, 5.75, 8.0, 9.5, 4.25, 8.25, 2.75, 4.75, 10.5, 4.5, 3.5' +
            ', 4.25, 6.25, 7.25, 5.5, 6.25, 12.5'
        end
        object UpDown3: TUpDown
          Left = 121
          Top = 23
          Width = 16
          Height = 19
          Associate = pKnapsackSize
          Min = 1
          Position = 17
          TabOrder = 3
        end
      end
      object pKnapsackMemo: TMemo
        Left = 18
        Top = 200
        Width = 594
        Height = 321
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object pKnight: TTabSheet
      Caption = 'Knight'#39's Tour'
      ImageIndex = 7
      DesignSize = (
        630
        541)
      object pKnightlbl: TLabel
        Left = 10
        Top = 10
        Width = 70
        Height = 13
        Caption = 'Chesse board:'
      end
      object pKnightGrid: TStringGrid
        Left = 10
        Top = 29
        Width = 599
        Height = 492
        TabStop = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 9
        Ctl3D = True
        DefaultColWidth = 50
        DefaultRowHeight = 50
        DoubleBuffered = True
        RowCount = 9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        OnDrawCell = pKnightGridDrawCell
      end
    end
    object pSquare: TTabSheet
      Caption = 'Magic Square'
      ImageIndex = 8
      DesignSize = (
        630
        541)
      object Label1: TLabel
        Left = 18
        Top = 67
        Width = 67
        Height = 13
        Caption = 'Magic square:'
      end
      object pSquareGrid: TStringGrid
        Left = 18
        Top = 86
        Width = 591
        Height = 435
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 4
        DefaultColWidth = 40
        DefaultRowHeight = 40
        RowCount = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object GroupBox6: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 623
        Height = 59
        Margins.Right = 4
        Align = alTop
        Caption = 'Magic Square Option'
        TabOrder = 1
        object Label2: TLabel
          Left = 15
          Top = 25
          Width = 44
          Height = 13
          Caption = 'Grid size:'
        end
        object Label4: TLabel
          Left = 215
          Top = 25
          Width = 70
          Height = 13
          Caption = 'Magic number:'
        end
        object pSquareSize: TEdit
          Left = 65
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 0
          Text = '3'
        end
        object UpDown4: TUpDown
          Left = 107
          Top = 23
          Width = 16
          Height = 19
          Associate = pSquareSize
          Min = 1
          Position = 3
          TabOrder = 1
        end
        object pSquareNumber: TEdit
          Left = 291
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 2
          Text = '15'
        end
        object UpDown5: TUpDown
          Left = 333
          Top = 23
          Width = 16
          Height = 19
          Associate = pSquareNumber
          Min = 1
          Position = 15
          TabOrder = 3
        end
      end
    end
    object pSudoku: TTabSheet
      Caption = 'Sudoku'
      ImageIndex = 9
      object pSudokuGrp: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 56
        Align = alTop
        Caption = 'Sudoku Option'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 0
        DesignSize = (
          624
          56)
        object pSudokuClear: TButton
          Left = 488
          Top = 17
          Width = 121
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Clear Sudoku'
          TabOrder = 0
          OnClick = pSudokuClearClick
        end
        object pSudokuBtnSave: TButton
          Left = 119
          Top = 17
          Width = 98
          Height = 25
          Caption = 'Save puzzle'
          TabOrder = 1
          OnClick = pSudokuBtnSaveClick
        end
        object pSudokuBtnLoad: TButton
          Left = 15
          Top = 17
          Width = 98
          Height = 25
          Caption = 'Load puzzle'
          TabOrder = 2
          OnClick = pSudokuBtnLoadClick
        end
        object pSudokuClearSol: TButton
          Left = 376
          Top = 17
          Width = 106
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Clear Solution'
          TabOrder = 3
          OnClick = pSudokuClearSolClick
        end
      end
      object pSudokuGrid: TStringGrid
        Left = 90
        Top = 74
        Width = 450
        Height = 450
        TabStop = False
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        ColCount = 9
        Ctl3D = True
        DefaultColWidth = 49
        DefaultRowHeight = 49
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 9
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [goVertLine, goHorzLine, goEditing]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssNone
        TabOrder = 1
        OnDrawCell = pSudokuGridDrawCell
        OnSetEditText = pSudokuGridSetEditText
      end
    end
    object pSSP: TTabSheet
      Caption = 'SSP'
      ImageIndex = 10
      DesignSize = (
        630
        541)
      object Label16: TLabel
        Left = 19
        Top = 114
        Width = 34
        Height = 13
        Caption = 'Output'
      end
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 98
        Align = alTop
        Caption = 'Shoortest Superstring Option'
        TabOrder = 0
        object Label14: TLabel
          Left = 16
          Top = 27
          Width = 59
          Height = 13
          Caption = 'Sub-Strings:'
        end
        object pSsptxt: TComboBox
          Left = 16
          Top = 46
          Width = 585
          Height = 21
          CharCase = ecLowerCase
          Ctl3D = True
          ItemIndex = 1
          ParentCtl3D = False
          TabOrder = 0
          Text = '10001 10 01 100 001 0001 1000'
          Items.Strings = (
            'abrac caac aca coca baroca car corea racar caroba bar rar'
            '10001 10 01 100 001 0001 1000'
            'abrac acada adab barada'
            'abc baab abba bab abaa aaa'
            'catgc ctaagt gcta ttca atgcatc'
            #1576#1575' '#1578#1576#1583#1740#1604' '#1575#1740#1606' '#1662#1740#1575#1605' '#1576#1575' '#1585#1608#1588' '#1575#1576#1585' '#1585#1588#1578#1607' '#1576#1607' '#1585#1605#1586' '#1591#1608#1604' '#1570#1606' '#1705#1605#1578#1585' '#1605#1740#1588#1608#1583)
        end
      end
      object pSspMemo: TMemo
        Left = 19
        Top = 133
        Width = 585
        Height = 388
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object pPackaging: TTabSheet
      Caption = 'Packaging'
      ImageIndex = 11
      DesignSize = (
        630
        541)
      object Label18: TLabel
        Left = 18
        Top = 122
        Width = 34
        Height = 13
        Caption = 'Output'
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 110
        Align = alTop
        Caption = 'Packaging Option'
        TabOrder = 0
        object Label17: TLabel
          Left = 15
          Top = 54
          Width = 75
          Height = 13
          Caption = 'Boxes Volumes:'
        end
        object Label15: TLabel
          Left = 15
          Top = 25
          Width = 113
          Height = 13
          Caption = 'Fixed Size of packages:'
        end
        object pPackVols: TEdit
          Left = 15
          Top = 73
          Width = 594
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          Text = 
            '8.5, 6.0, 5.75, 8.0, 9.5, 4.25, 8.25, 2.75, 4.75, 10.5, 4.5, 3.5' +
            ', 4.25, 6.25, 7.25, 5.5, 6.25, 12.5'
        end
        object pPackSize: TEdit
          Left = 134
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 1
          Text = '17'
        end
        object UpDown6: TUpDown
          Left = 176
          Top = 23
          Width = 16
          Height = 19
          Associate = pPackSize
          Min = 1
          Position = 17
          TabOrder = 2
        end
      end
      object pPackMemo: TMemo
        Left = 18
        Top = 141
        Width = 594
        Height = 380
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object pOpp: TTabSheet
      Caption = 'OPP'
      ImageIndex = 12
      DesignSize = (
        630
        541)
      object Label20: TLabel
        Left = 18
        Top = 67
        Width = 23
        Height = 13
        Caption = 'Grid:'
      end
      object pOppGrid: TStringGrid
        Left = 18
        Top = 86
        Width = 591
        Height = 435
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 12
        DefaultColWidth = 35
        DefaultRowHeight = 35
        FixedCols = 0
        RowCount = 12
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnDrawCell = pOppGridDrawCell
      end
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 623
        Height = 59
        Margins.Right = 4
        Align = alTop
        Caption = 'Optimized points problem option'
        TabOrder = 1
        DesignSize = (
          623
          59)
        object Label22: TLabel
          Left = 15
          Top = 25
          Width = 86
          Height = 13
          Caption = 'Number of Points:'
        end
        object Label23: TLabel
          Left = 215
          Top = 25
          Width = 76
          Height = 13
          Caption = 'Points distance:'
        end
        object pOppPoints: TEdit
          Left = 106
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 0
          Text = '10'
        end
        object UpDown7: TUpDown
          Left = 148
          Top = 23
          Width = 16
          Height = 19
          Associate = pOppPoints
          Min = 1
          Position = 10
          TabOrder = 1
        end
        object pOppDistance: TEdit
          Left = 297
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 2
          Text = '3'
        end
        object UpDown8: TUpDown
          Left = 339
          Top = 23
          Width = 16
          Height = 19
          Associate = pOppDistance
          Min = 1
          Position = 3
          TabOrder = 3
        end
        object pOppClearGrid: TButton
          Left = 485
          Top = 20
          Width = 121
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Clear Grid'
          TabOrder = 4
          OnClick = pOppClearGridClick
        end
      end
    end
    object pKpath: TTabSheet
      Caption = 'KPP'
      ImageIndex = 13
      DesignSize = (
        630
        541)
      object Label24: TLabel
        Left = 18
        Top = 67
        Width = 23
        Height = 13
        Caption = 'Grid:'
      end
      object pKpathGrid: TStringGrid
        Left = 18
        Top = 86
        Width = 591
        Height = 435
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 8
        DefaultColWidth = 40
        DefaultRowHeight = 40
        FixedCols = 0
        RowCount = 8
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object GroupBox7: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 623
        Height = 59
        Margins.Right = 4
        Align = alTop
        Caption = 'Knight'#39's path option'
        TabOrder = 1
        object Label25: TLabel
          Left = 15
          Top = 25
          Width = 60
          Height = 13
          Caption = 'Board'#39's size:'
        end
        object Label26: TLabel
          Left = 167
          Top = 25
          Width = 68
          Height = 13
          Caption = 'Start point, X:'
        end
        object Label27: TLabel
          Left = 290
          Top = 26
          Width = 10
          Height = 13
          Caption = 'Y:'
        end
        object Label28: TLabel
          Left = 413
          Top = 25
          Width = 62
          Height = 13
          Caption = 'End point, X:'
        end
        object Label29: TLabel
          Left = 530
          Top = 26
          Width = 10
          Height = 13
          Caption = 'Y:'
        end
        object pKpathStart_X: TEdit
          Left = 241
          Top = 23
          Width = 27
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 0
          Text = '1'
        end
        object UpDown10: TUpDown
          Left = 268
          Top = 23
          Width = 16
          Height = 19
          Associate = pKpathStart_X
          Min = 1
          Max = 8
          Position = 1
          TabOrder = 1
        end
        object pKpathSize: TEdit
          Left = 81
          Top = 23
          Width = 27
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 2
          Text = '8'
        end
        object UpDown9: TUpDown
          Left = 108
          Top = 23
          Width = 16
          Height = 19
          Associate = pKpathSize
          Min = 1
          Max = 8
          Position = 8
          TabOrder = 3
        end
        object pKpathStart_Y: TEdit
          Left = 306
          Top = 23
          Width = 27
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 4
          Text = '1'
        end
        object UpDown11: TUpDown
          Left = 333
          Top = 23
          Width = 16
          Height = 19
          Associate = pKpathStart_Y
          Min = 1
          Max = 8
          Position = 1
          TabOrder = 5
        end
        object pKpathEnd_X: TEdit
          Left = 481
          Top = 23
          Width = 27
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 6
          Text = '7'
        end
        object UpDown12: TUpDown
          Left = 508
          Top = 23
          Width = 16
          Height = 19
          Associate = pKpathEnd_X
          Min = 1
          Max = 8
          Position = 7
          TabOrder = 7
        end
        object pKpathEnd_Y: TEdit
          Left = 546
          Top = 23
          Width = 27
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 8
          Text = '8'
        end
        object UpDown13: TUpDown
          Left = 573
          Top = 23
          Width = 16
          Height = 19
          Associate = pKpathEnd_Y
          Min = 1
          Max = 8
          Position = 8
          TabOrder = 9
        end
      end
    end
    object pCPP: TTabSheet
      Caption = 'CPP'
      ImageIndex = 14
      object pCppGrp: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 56
        Align = alTop
        Caption = 'Corral puzzle option'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 0
        DesignSize = (
          624
          56)
        object Label30: TLabel
          Left = 15
          Top = 25
          Width = 86
          Height = 13
          Caption = 'Number of Points:'
        end
        object pCppClearPuzzle: TButton
          Left = 488
          Top = 19
          Width = 121
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Clear Puzzle'
          TabOrder = 0
          OnClick = pCppClearPuzzleClick
        end
        object pCppSize: TEdit
          Left = 106
          Top = 23
          Width = 42
          Height = 19
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 1
          Text = '10'
        end
        object UpDown14: TUpDown
          Left = 148
          Top = 23
          Width = 16
          Height = 19
          Associate = pCppSize
          Min = 1
          Position = 10
          TabOrder = 2
        end
      end
      object pCppGrid: TStringGrid
        Left = 106
        Top = 87
        Width = 410
        Height = 410
        TabStop = False
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        ColCount = 10
        Ctl3D = True
        DefaultColWidth = 40
        DefaultRowHeight = 40
        FixedCols = 0
        RowCount = 10
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [goVertLine, goHorzLine, goEditing]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object TabAnalyse: TTabSheet
      Caption = 'Analyse'
      ImageIndex = 1
      object Chart: TChart
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 628
        Height = 539
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Legend.Alignment = laTop
        Legend.CheckBoxes = True
        Legend.ColorWidth = 0
        Legend.DividingLines.Visible = True
        Legend.FontSeriesColor = True
        Legend.HorizMargin = 2
        Legend.LegendStyle = lsLastValues
        Legend.Symbol.Visible = False
        Legend.Symbol.Width = 0
        Legend.TextStyle = ltsValue
        Legend.TopPos = 0
        Legend.VertMargin = 2
        Legend.VertSpacing = -5
        MarginBottom = 5
        MarginLeft = 5
        MarginRight = 5
        MarginTop = 10
        MarginUnits = muPixels
        Title.Font.Color = clBlack
        Title.Text.Strings = (
          'TChart')
        OnClickSeries = ChartClickSeries
        OnClickTitle = ChartClickTitle
        LeftAxis.AxisValuesFormat = '0'
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Width = 2
        LeftAxis.TickLength = 5
        LeftAxis.TickOnLabelsOnly = False
        LeftAxis.Title.Caption = 'Fitness Values'
        View3D = False
        Zoom.Animated = True
        Zoom.Pen.Color = -1
        Align = alClient
        BevelInner = bvLowered
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          628
          539)
        PrintMargins = (
          15
          6
          15
          6)
        object btnChartView: TButton
          Left = 531
          Top = 60
          Width = 47
          Height = 25
          Hint = '3d, Flat view toggle'
          Anchors = [akTop, akRight]
          Caption = '3d/Flat'
          TabOrder = 1
          OnClick = btnChartViewClick
        end
        object btnChartAdd: TButton
          Left = 484
          Top = 60
          Width = 47
          Height = 25
          Hint = 'Add result to chart'
          Anchors = [akTop, akRight]
          Caption = 'Add'
          TabOrder = 0
          OnClick = btnChartAddClick
        end
        object btnChartClear: TButton
          Left = 531
          Top = 85
          Width = 47
          Height = 25
          Hint = 'Clear chart'
          Anchors = [akTop, akRight]
          Caption = 'Clear'
          TabOrder = 3
          OnClick = btnChartClearClick
        end
        object ColorBox: TColorListBox
          Left = 580
          Top = 60
          Width = 24
          Height = 244
          Hint = 'Select series color'
          TabStop = False
          AutoComplete = False
          DefaultColorColor = clBlue
          NoneColorColor = clWhite
          Selected = clBlue
          Style = [cbStandardColors, cbPrettyNames]
          Anchors = [akTop, akRight]
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = True
          ItemHeight = 15
          ParentCtl3D = False
          TabOrder = 2
        end
        object cmbThick: TComboBox
          Left = 532
          Top = 111
          Width = 45
          Height = 21
          Hint = 'Series thickness'
          Style = csDropDownList
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 4
          TabStop = False
          Text = #188
          Items.Strings = (
            #188
            #189
            #190)
        end
        object btnChartSave: TButton
          Left = 531
          Top = 133
          Width = 47
          Height = 25
          Hint = 'Save chart'
          Anchors = [akTop, akRight]
          Caption = 'Save'
          Enabled = False
          TabOrder = 5
          OnClick = btnChartSaveClick
        end
        object btnChartLoad: TButton
          Left = 531
          Top = 158
          Width = 47
          Height = 25
          Hint = 'Load chart'
          Anchors = [akTop, akRight]
          Caption = 'Load'
          Enabled = False
          TabOrder = 6
          OnClick = btnChartLoadClick
        end
        object btnChartExport: TButton
          Left = 531
          Top = 183
          Width = 47
          Height = 25
          Hint = 'Export as Image, XML, ...'
          Anchors = [akTop, akRight]
          Caption = 'Export'
          TabOrder = 7
          OnClick = btnChartExportClick
        end
        object Seri: TLineSeries
          Depth = 0
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Clip = True
          Marks.DrawEvery = 3
          Marks.Visible = False
          ShowInLegend = False
          Title = 'Seri'
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.VertSize = 2
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {0000000000}
        end
      end
    end
    object TabMonitor: TTabSheet
      Caption = 'Monitor'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo: TMemo
        Left = 0
        Top = 0
        Width = 630
        Height = 541
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Ctl3D = True
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object Statusbar: TStatusBar
    Left = 0
    Top = 572
    Width = 844
    Height = 19
    Panels = <
      item
        Text = 'Generation: 0%'
        Width = 50
      end>
  end
  object TimerPanel: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerPanelTimer
    Left = 576
    Top = 344
  end
  object DlgOpen: TOpenDialog
    DefaultExt = 'Tsm'
    Filter = 'TSP Map|*.Tsm'
    Options = [ofHideReadOnly, ofNoTestFileCreate, ofNoNetworkButton, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Title = 'Load Map'
    Left = 576
    Top = 392
  end
  object DlgSave: TSaveDialog
    DefaultExt = 'Tsm'
    Filter = 'TSP Map|*.Tsm'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofNoTestFileCreate, ofNoNetworkButton, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Title = 'Save Map'
    Left = 576
    Top = 296
  end
end
