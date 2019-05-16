. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/vtk" ] ; then
  echo "Already have VTK"
else
  #git clone https://github.com/Kitware/VTK.git
  # wget https://github.com/Kitware/VTK/archive/v8.0.0.zip -O vtk.zip
  # wget https://github.com/Kitware/VTK/archive/v8.2.0.zip -O vtk.zip
  wget https://github.com/Kitware/VTK/archive/master.zip -O vtk.zip
  unzip vtk.zip -d ./
  mv VTK-master vtk
  rm vtk.zip
fi

cd $STUFF_ROOT_DIR
