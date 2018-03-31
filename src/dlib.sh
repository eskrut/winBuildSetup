. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/dlib" ] ; then
    echo "dlib exist, pulling"
    git -C dlib pull
else
    git clone https://github.com/davisking/dlib.git
fi

cd $STUFF_ROOT_DIR
