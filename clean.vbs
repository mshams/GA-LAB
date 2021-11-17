dim Args,Shl
Set Args = wscript.Arguments
Set Shl = WScript.CreateObject ("WSCript.shell")

p = Args(0)
p = Left(p,InStrRev(p, "\"))

Shl.run "cmd /Q /c del """ + p + "*.~* "">nul"
Shl.run "cmd /Q /c del """ + p + "*.dcu "">nul"
Shl.run "cmd /Q /c del """ + p + "*.dof "">nul"
Shl.run "cmd /Q /c del """ + p + "*.dsk "">nul"
Shl.run "cmd /Q /c del """ + p + "*.cfg "">nul"
Shl.run "cmd /Q /c del """ + p + "*.$$$ "">nul"
Shl.run "cmd /Q /c del """ + p + "*.identcache "">nul"
Shl.run "cmd /Q /c del """ + p + "*.local "">nul"
           
'Shl.run "cmd /K CD /d C:\ & Dir"
'wscript.echo Args(0)
'WScript.Shell.Run Args(0)
'i = InStr(1, strFullName, ".exe", 1)
