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
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES

cd $STUFF_ROOT_DIR