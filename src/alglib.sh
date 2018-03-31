. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/alglib" ] ; then
    echo "alglib exist, pulling"
    git -C alglib pull
else
    git clone git@77.244.215.97:cmir/alglib.git
fi

cd $STUFF_ROOT_DIR
