
#run patch
cmd /c patch_msys2.cmd

./config.git.sh

./config.ssh.sh

#upgrade
./first.sh

#update
./buildStuff.sh

#get sources
./srcs.sh

#patch and install qwt
./install.qwt.sh
./sudo.cmd config.qwt.bat

./sudo.cmd config.doli.bat

./build.sbf.sh

./build.htSoft.sh
