. ./rc

PROJECT=htData
mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES

PROJECT=htSoft
mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH=$STUFF_ROOT_DIR/cmake \
	-DUSE_MSCOPE=On \
	-DUSE_FEM=On \
	-DUSE_REPORTER=On \
	-DUSE_FANN=Off \
	-DDEV_MODE=On \
	-DBUILD_TESTS=Off \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES

#copy mandatory runtime files from htSoft src dir
cp -r $SRC_DIR/$PROJECT/femGrids ann05_5_2.fann fann.ini ./

cd $STUFF_ROOT_DIR
