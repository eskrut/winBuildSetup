#should be run under msys2 shell

echo run patch
cmd /c patch_msys2.cmd

./config.git.sh

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
	./config.ssh.sh
else
	echo ssh key exists. skip creation
fi

echo upgrade
./first.sh

echo update
./buildStuff.sh

echo get sources
./srcs.sh
