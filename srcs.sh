. ./rc
cd $SRC_DIR

if [ -d "${SRC_DIR}/qwt" ] ; then
    echo "qwt exist skip"
else
    svn export svn://svn.code.sf.net/p/qwt/code/trunk/qwt
fi

if [ -d "${SRC_DIR}/libsbf" ] ; then
    echo "libsbf exist, pulling"
    git -C libsbf pull
else
    git clone http://github.com/eskrut/sbf libsbf
    git -C libsbf flow init
fi

if [ -d "${SRC_DIR}/OpenUZOR" ] ; then
    echo "OpenUZOR exist, pulling"
    git -C OpenUZOR pull
else
    git clone http://github.com/eskrut/OpenUZOR
    git -C OpenUZOR flow init
fi

#use pacman vtk instead
# if [ -d "${SRC_DIR}/vtk" ] ; then
  # echo "Already have VTK"
# else
  # #git clone https://github.com/Kitware/VTK.git
  # # wget https://github.com/Kitware/VTK/archive/v8.0.0.zip -O vtk.zip
  # wget https://github.com/Kitware/VTK/archive/master.zip -O vtk.zip
  # unzip vtk.zip -d ./
  # mv VTK-master vtk
  # rm vtk.zip
# fi

if [ -d "${SRC_DIR}/alglib" ] ; then
    echo "alglib exist, pulling"
    git -C alglib pull
else
    git clone git@77.244.215.97:cmir/alglib.git
fi

if [ -d "${SRC_DIR}/htData" ] ; then
    echo "htData exist, pulling"
    git -C htData pull
else
    git clone git@77.244.215.97:cmir/htData.git
    git -C htData flow init
    git -C htData submodule init
    git -C htData submodule update
    git -C htData submodule foreach --recursive git reset --hard origin/HEAD
fi

if [ -d "${SRC_DIR}/htSoft" ] ; then
    echo "htSoft exist, pulling"
    git -C htSoft pull
    # git -C htSoft submodule update
else
    git clone git@77.244.215.97:cmir/htSoft.git
    git -C htSoft flow init
    git -C htSoft submodule init
    git -C htSoft submodule update
    git -C htSoft submodule foreach --recursive git reset --hard origin/HEAD
fi

cd $STUFF_ROOT_DIR
