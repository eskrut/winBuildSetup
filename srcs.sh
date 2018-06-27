#!/bin/bash

./src/qwt.sh
./src/sbf.sh
./src/vtk.sh
#use pacman provided version
#./src/dlib.sh
./src/fann.sh
./src/alglib.sh
./src/libfem.sh
./src/htSoft.sh

cd $STUFF_ROOT_DIR
