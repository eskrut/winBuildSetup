#should be run under mingw32 shell

#patch and install qwt
./install.qwt.sh
./sudo.cmd config.qwt.bat

./sudo.cmd config.doli.bat

./build.sbf.sh

./build.htSoft.sh
