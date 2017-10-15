export arch=mingw-w64-i686
pacman -S --needed \
	git \
	git-flow \
	tig \
	base-devel \
	zlib \
	tmux \
	libxml2-devel \
	$arch-toolchain \
	$arch-cmake \
	$arch-boost \
	$arch-qt5 \
	$arch-qt-creator \
	$arch-python2 \

