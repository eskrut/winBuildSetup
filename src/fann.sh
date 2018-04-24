. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/fann" ] ; then
    echo "fann exist, pulling"
    git -C fann pull
else
    git clone https://github.com/libfann/fann.git
fi

cd $STUFF_ROOT_DIR
