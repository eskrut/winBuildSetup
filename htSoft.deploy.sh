#!/bin/bash

Dir=/c/build/htSoft
Exe=$Dir/htSoft.exe
deployDir=$Dir/deploy

mkdir -p $deployDir

mingw.deploy.sh -v -c \
-d /c/qwt/lib \
-d /c/build/htData \
-d /c/doli/dope/dope \
-d /mingw32/bin \
-w $deployDir \
$Exe

windeployqt.exe --dir $deployDir $Exe