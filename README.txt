#INSTALL

#allow PATH inheritance in msys2_shell.cmd by uncommenting line
#set MSYS2_PATH_TYPE=inherit
#reloat terminal

#from a start

pacman -S git

#^but you may already did this

#linksToSoftware.txt
#start with Notepad++ and chrome then reopen linksToSoftware.txt with Notepad++ and install all other

#copy-paste .winbuildrc to the home of msys, edit and source it in .profile

#fill free to edit .bashrc

#now the stuff. do from winbuildsetup

pacman -Suuyy

#^ it will require terminal reload
#may be several times till nothing new

./install/packages_32.sh

#^ this will be long...

#cleanup things
pacman -Scc

mkdir .local

./install/doli.sh
./install/uEye.sh
./install/qt.sh
#qtBatch script will appear at local folder
#need to adjust cmake generator to MSYS

./config/git.sh
./config/ssh.sh
./config/iss.sh

#copy pub key to git repos

#get sources
./srcs.sh

#^ remote ssh host confirmation needed
#^ git flow confirmation needed several times

#try build all
./builds.sh
