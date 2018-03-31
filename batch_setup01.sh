#should be run under msys2 shell

echo run patch
cmd /c patch_msys2.cmd

./config/git.sh

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
	./config/ssh.sh
	echo SSH keys created. You probably need to copy them to git repo hostings
else
	echo ssh key exists. skip creation
fi

echo upgrade
./install/update.sh

echo install
./install/packages_32.sh

echo fixing gettext
./config/fixGettextError.sh

echo get sources
./srcs.sh

