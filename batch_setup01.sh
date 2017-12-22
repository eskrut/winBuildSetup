#should be run under msys2 shell

#run patch
cmd /c patch_msys2.cmd

./config.git.sh

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
	./config.ssh.sh
else
	echo ssh key exists. skip creation
fi

#upgrade
./first.sh

#update
./buildStuff.sh

#get sources
./srcs.sh
