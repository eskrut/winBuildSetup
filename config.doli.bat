::Setup DOLI stuff

set DR=c:\doli
set DPER=%DR%\dope
set DPELIB=%DPER%\DoPE
set DPEINC=%DPER%\Include

::clean

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v DOLI_ROOT /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v DOLI_DOPE_ROOT /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v DOLI_ROOT /t REG_SZ /d "%DR%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v DOLI_DOPE_ROOT /t REG_SZ /d "%DPER%"

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /t REG_SZ /d "%DPELIB%;%path%"

call update.env.bat
