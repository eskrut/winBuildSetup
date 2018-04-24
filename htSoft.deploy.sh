#!/bin/bash

Dir=/c/build/htSoft
Exe=$Dir/htSoft.exe
deployDir=$Dir/deploy

mkdir -p $deployDir

./mingw.deploy.sh -v -c \
-d /c/qwt/lib \
-d /c/build/htData \
-d /c/doli/dope/dope \
-d /mingw32/bin \
-w $deployDir \
$Exe

windeployqt.exe --release --dir $deployDir $Exe

cp $Exe $deployDir

Exe=$Dir/src/calibration/calibration.exe
./mingw.deploy.sh -v \
-d /c/qwt/lib \
-d /c/build/htData \
-d /c/doli/dope/dope \
-d /mingw32/bin \
-w $deployDir \
$Exe
windeployqt.exe --release --dir $deployDir $Exe
cp $Exe $deployDir

Exe=/c/build/fann/src/libdoublefann.dll
cp -r $Dir/femGrids $deployDir
cp -r $Dir/results $deployDir
cp $Dir/ann05_5_2.fann $deployDir
cp $Dir/fann.ini $deployDir
./mingw.deploy.sh -v \
-d /c/build/fann/src \
-d /mingw32/bin \
-w $deployDir \
$Exe
cp $Exe $deployDir

Exe=/c/build/htData/libhtdata.dll
./mingw.deploy.sh -v \
-d /c/build/htData \
-d /mingw32/bin \
-w $deployDir \
$Exe
cp $Exe $deployDir

Exe=/c/build/libfem/libfem.dll
./mingw.deploy.sh -v \
-d /c/build/libfem \
-d /mingw32/bin \
-w $deployDir \
$Exe
cp $Exe $deployDir