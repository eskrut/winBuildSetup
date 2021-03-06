pacman -S --needed \
	git \
	subversion \
	git-flow \
	tig \
	base-devel \
	zlib \
	tmux \
	libxml2-devel \
	$arch-toolchain \
	$arch-clang \
	$arch-clang-analyzer \
	$arch-clang-tools-extra \
	$arch-compiler-rt \
	$arch-cmake \
	$arch-extra-cmake-modules \
	$arch-cmake-doc-qt \
	$arch-cotire \
	$arch-boost \
	$arch-qt5 \
	$arch-qt-creator \
	$arch-python2 \
	$arch-python2-pip \
	$arch-ntldd \
	$arch-hdf5 \
	$arch-expat \
	$arch-glew \
	$arch-gl2ps \
	$arch-jsoncpp \
	$arch-libharu \
	$arch-libxml2 \
	$arch-libxml++ \
	$arch-lz4 \
	$arch-vtk \
	$arch-metis \
	$arch-eigen3 \
	$arch-gnuplot \
	$arch-dlib \
	$arch-proj \
	$arch-meld3 \
	zip unzip p7zip

#for downloading large files from gdrive
pip install gdown
pip install six

#remove msys gdb
pacman -R gdb