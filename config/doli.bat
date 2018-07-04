::Setup DOLI stuff

set DOPE_ROOT=%LOCAL_PATH%\doli
set DOPE_LIB=%DOPE_ROOT%\lib
set DOPE_INCLUDE=%DOPE_ROOT%\include

::clean

reg delete %REG_ENV_KEY% /v DOPE_ROOT /f

reg add %REG_ENV_KEY% /v DOPE_ROOT /t REG_SZ /d "%DOPE_ROOT%"

set SET_AS_PATH=%DOPE_LIB%;%SET_AS_PATH%