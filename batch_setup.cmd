set baseDir=c:\winBuildSetup
set msysDir=c:\msys32
set startShellCmd=%msysDir%\msys2_shell.cmd

%startShellCmd% -msys2 -where %baseDir% ./batch_setup01.sh

%startShellCmd% -mingw32 -where %baseDir% ./batch_setup02.sh