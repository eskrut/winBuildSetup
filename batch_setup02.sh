#should be run under mingw32 shell

echo patch and install qwt
./install.qwt.sh
./sudo.cmd config.qwt.bat

echo set path for doli
./sudo.cmd config.doli.bat

./build.sbf.sh

./build.libfem.sh

./build.htSoft.sh
