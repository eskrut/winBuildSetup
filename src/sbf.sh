. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/libsbf" ] ; then
    echo "libsbf exist, pulling"
    git -C libsbf pull
else
    git clone http://github.com/eskrut/sbf libsbf
    git -C libsbf flow init
fi

if [ -d "${SRC_DIR}/OpenUZOR" ] ; then
    echo "OpenUZOR exist, pulling"
    git -C OpenUZOR pull
else
    git clone http://github.com/eskrut/OpenUZOR
    git -C OpenUZOR flow init
fi

cd $STUFF_ROOT_DIR
