. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/libfem" ] ; then
    echo "libfem exist, pulling"
    git -C libfem pull
else
    git clone git@77.244.215.97:cmir/libfem.git
    git -C htData flow init
fi

cd $STUFF_ROOT_DIR
