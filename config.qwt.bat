::Setup QWT stuff

set QWT_ROOT=c:\qwt
set QWT_LIB=%QWT_ROOT%\lib
set QWT_INCLUDE=%QWT_ROOT%\include

::clean

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v QWT_ROOT /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v QWT_ROOT /t REG_SZ /d "%QWT_ROOT%"

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /t REG_SZ /d "%QWT_LIB%;%path%"

call update.env.bat
