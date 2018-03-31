. ./rc

PROJECT=vtk

mkdir -p $BUILD_DIR/$2
cd $BUILD_DIR/$2

#Following VTK_USE_SYSTEM_xxx set to OFF due to unsofitient pacman versions

#CMAKE_CXX_COMPILER=g++ CMAKE_CXX_FLAGS=-Wa,-mbig-obj added to pass assembler error too many sections
#unfortunately this not working. so this will be actually not a debug info version with	
#CMAKE_CXX_FLAGS_DEBUG="-O3 -DNDEBUG"

cmake \
	-G "MSYS Makefiles" \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR/$2 \
	-DCMAKE_BUILD_TYPE=$1 \
	-DBUILD_TESTING=OFF \
	-DCMAKE_CXX_COMPILER=g++ \
	-DCMAKE_C_COMPILER=gcc \
	-DCMAKE_CXX_FLAGS=-Wa,-mbig-obj \
	-DCMAKE_CXX_FLAGS_DEBUG="-O3 -DNDEBUG"\
	-DVTK_Group_Qt=ON \
	-DVTK_QT_VERSION=5 \
	-DVTK_USE_SYSTEM_LIBRARIES=OFF \
	-DVTK_USE_SYSTEM_EIGEN=ON \
	-DVTK_USE_SYSTEM_EXPAT=ON \
	-DVTK_USE_SYSTEM_FREETYPE=ON \
	-DVTK_USE_SYSTEM_GL2PS=OFF \
	-DVTK_USE_SYSTEM_GLEW=ON \
	-DVTK_USE_SYSTEM_HDF5=ON \
	-DVTK_USE_SYSTEM_JPEG=ON \
	-DVTK_USE_SYSTEM_JSONCPP=ON \
	-DVTK_USE_SYSTEM_LIBHARU=OFF \
	-DVTK_USE_SYSTEM_LIBXML2=ON \
	-DVTK_USE_SYSTEM_LZ4=ON \
	-DVTK_USE_SYSTEM_PNG=ON \
	-DVTK_USE_SYSTEM_TIFF=ON \
	-DVTK_USE_SYSTEM_ZLIB=ON \
	-DVTK_USE_SYSTEM_LZMA=ON \
$SRC_DIR/$PROJECT \
&&
make -j4 \
&&
make install

cd $STUFF_ROOT_DIR