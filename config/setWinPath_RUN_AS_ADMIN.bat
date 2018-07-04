call base.bat

call qwt.bat

call doli.bat

call htsoft.bat

reg add %REG_ENV_KEY% /v PATH /t REG_SZ /f /d %SET_AS_PATH%

call update.env.bat

echo "You need to restart system"

