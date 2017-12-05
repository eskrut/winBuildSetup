. ./rc

patch /c/src/qwt/qwtconfig.pri qwtconfig.patch

PROJECT=qwt

mkdir -p $BUILD_DIR/$PROJECT
cd $BUILD_DIR/$PROJECT
qmake -r $SRC_DIR/qwt/qwt.pro

mingw32-make -j4

mingw32-make install

cd $STUFF_ROOT_DIR

rm -rf $BUILD_DIR/qwt
