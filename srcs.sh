. ./rc
cd $SRC_DIR

svn export svn://svn.code.sf.net/p/qwt/code/trunk/qwt
git clone http://github.com/eskrut/sbf libsbf
git clone http://github.com/eskrut/OpenUZOR

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

cd $STUFF_ROOT_DIR
