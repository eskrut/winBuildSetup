::Setup QWT stuff

set HTDATA_LIB=c:\build\htData
set HTDATA_INCLUDE=c:\src\htData\include

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /t REG_SZ /d "%HTDATA_LIB%;%path%"

call update.env.bat
