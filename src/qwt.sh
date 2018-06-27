. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/qwt" ] ; then
    echo "qwt exist, pulling"
    svn -u
else
    svn export svn://svn.code.sf.net/p/qwt/code/trunk/qwt
fi

cd $STUFF_ROOT_DIR
