echo %*
@echo Set objShell = CreateObject("Shell.Application") > %temp%\sudo.tmp.vbs
@echo objShell.ShellExecute "cmd.exe", "/k cd c:\winBuildSetup && %*", "", "runas" >> %temp%\sudo.tmp.vbs
@cscript %temp%\sudo.tmp.vbs