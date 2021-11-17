program GALAB;

uses
  Forms,
  frmMain in 'frmMain.pas' {Gfrm},
  frmAbout in 'frmAbout.pas' {AboutBox},
  UGAthread in 'UGAthread.pas',
  UPublic in 'UPublic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Genetic Lab';
  Application.CreateForm(TGfrm, Gfrm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
