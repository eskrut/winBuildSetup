#!/bin/bash

Build=/c/opt/build
Local=/c/opt/local
Dir=$Build/htSoft
Src=/c/opt/src
Exe=$Dir/htSoft.exe
deployDir=$Dir/deploy

pushd $Build/htData
cmake -DCMAKE_BUILD_TYPE=Release . && cmake --build . --target all -- -j 4
popd

pushd $Build/htSoft
cmake -DCMAKE_BUILD_TYPE=Release . && cmake --build . --target all -- -j 4
popd

mkdir -p $deployDir

./mingw.deploy.sh -v -c \
-d /mingw32/bin \
-d $Build/htData \
-d $Local/qwt/lib \
-d $Local/doli/lib \
-w $deployDir \
$Exe

#warkaround
cp $Local/doli/lib/DoPE.dll $deployDir
cp $Local/doli/lib/DoDpx.dll $deployDir

windeployqt.exe --release --dir $deployDir $Exe

cp $Exe $deployDir

Exe=$Dir/src/calibration/calibration.exe
./mingw.deploy.sh -v \
-d /mingw32/bin \
-d $Build/htData \
-d $Local/qwt/lib \
-d $Local/doli/lib \
-w $deployDir \
$Exe
windeployqt.exe --release --dir $deployDir $Exe
cp $Exe $deployDir

Exe=$Local/fann/bin/libdoublefann.dll
cp -r $Src/htSoft/femGrids $deployDir
mkdir -p $deployDir/results
cp $Src/htSoft/ann05_5_2.fann $deployDir
cp $Src/htSoft/fann.ini $deployDir
./mingw.deploy.sh -v \
-d /c/build/fann/src \
-d /mingw32/bin \
-w $deployDir \
$Exe
cp $Exe $deployDir

Exe=$Build/htData/libhtdata.dll
./mingw.deploy.sh -v \
-d /mingw32/bin \
-d $Build/htData \
-w $deployDir \
$Exe
cp $Exe $deployDir

Exe=$Build/libfem/libfem.dll
./mingw.deploy.sh -v \
-d $Build/libfem \
-d /mingw32/bin \
-w $deployDir \
$Exe
cp $Exe $deployDir