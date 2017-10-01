export arch=mingw-w64-i686
pacman -S --needed \
	git \
	base-devel \
	zlib \
	$arch-toolchain \
	$arch-cmake \
	$arch-boost \
	$arch-qt5 \
	$arch-python2 \

