. ./rc

PROJECT=htData
mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j4

PROJECT=htSoft
mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH=$STUFF_ROOT_DIR \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j4

cd $STUFF_ROOT_DIR