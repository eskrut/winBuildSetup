. ./rc

cp patches/qwtconfig.patch .local/qwtconfig.patch
sed -i 's/c:\/opt\/local/'$DISK_LABEL':\/'$DISK_SUFFIX'\/local/g' .local/qwtconfig.patch

patch $SRC_DIR/qwt/qwtconfig.pri .local/qwtconfig.patch

PROJECT=qwt

mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT
qmake -r $SRC_DIR/qwt/qwt.pro

mingw32-make -j$COMPILE_CORES

mingw32-make install

cd $STUFF_ROOT_DIR

rm -rf $BUILD_DIR/qwt
