echo !!!!!!!!!!!!!!!!!!!!
echo DEPRECATED Use pacman provided DLIB
echo !!!!!!!!!!!!!!!!!!!!

. ./rc

PROJECT=dlib
mkdir -p $BUILD_DIR/$PROJECT
mkdir -p $INSTALL_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT

cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR/$PROJECT \
$SRC_DIR/$PROJECT \
&& \
cmake --build . -- -j$COMPILE_CORES \
&& \
cmake --build . --target install

cd $STUFF_ROOT_DIR