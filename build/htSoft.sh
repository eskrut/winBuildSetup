. ./rc

PROJECT=htData
mkdir -p $BUILD_DIR/$PROJECT$2
cd $BUILD_DIR/$PROJECT$2

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=$1 \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES

PROJECT=htSoft
mkdir -p $BUILD_DIR/$PROJECT$2
cd $BUILD_DIR/$PROJECT$2

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=$1 \
    -DCMAKE_MODULE_PATH=$STUFF_ROOT_DIR/cmake \
	-DVTK_DIR=$LOCAL_DIR/vtk$2 \
	-DUSE_MSCOPE=On \
	-DUSE_FEM=On \
	-DUSE_REPORTER=On \
	-DUSE_FANN=On \
	-Dfann_DIR=$LOCAL_DIR/fann/lib/cmake/fann \
	-DDEV_MODE=On \
	-DBUILD_TESTS=Off \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES

#copy mandatory runtime files from htSoft src dir
cp -r \
$SRC_DIR/$PROJECT/femGrids \
$SRC_DIR/$PROJECT/ann05_5_2.fann \
$SRC_DIR/$PROJECT/fann.ini ./

cd $STUFF_ROOT_DIR
