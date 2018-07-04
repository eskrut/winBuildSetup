::Setup QWT stuff

set QWT_ROOT=%LOCAL_PATH%\qwt
set QWT_LIB=%QWT_ROOT%\lib
set QWT_INCLUDE=%QWT_ROOT%\include

::clean

reg delete %REG_ENV_KEY% /v QWT_ROOT /f

reg add %REG_ENV_KEY% /v QWT_ROOT /t REG_SZ /d "%QWT_ROOT%"

set SET_AS_PATH=%QWT_LIB%;%SET_AS_PATH%
