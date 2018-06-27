. ./rc

PROJECT=libsbf
mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES

PROJECT=OpenUZOR
mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
	-DTARGET_QT_VERSION=5 \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES

cd $STUFF_ROOT_DIR