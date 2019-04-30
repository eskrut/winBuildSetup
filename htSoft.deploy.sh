#!/bin/bash

. rc

Build=${BASE_DISK}/build
Local=${BASE_DISK}/local
Dir=$Build/htSoft
Src=${BASE_DISK}/src
Exe=$Dir/htSoft.exe
deployDir=$Dir/deploy

pushd $Build/htData
cmake -DCMAKE_BUILD_TYPE=Release . && cmake --build . --target all -- -j ${COMPILE_CORES}
popd

pushd $Build/htSoft
cmake -DCMAKE_BUILD_TYPE=Release . && cmake --build . --target all -- -j ${COMPILE_CORES}
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
-d ${BASE_DISK}/build/fann/src \
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

/c/Program\ Files\ \(x86\)/Inno\ Setup\ 6/ISCC htSoft.deploy.iss
