. ./rc
mkdir -p $SRC_DIR
cd $SRC_DIR || exit 0

if [ -d "${SRC_DIR}/htData" ] ; then
    echo "htData exist, pulling"
    git -C htData pull
else
    git clone git@77.244.215.97:cmir/htData.git
	git -C htData flow init
    git -C htData checkout develop
    git -C htData submodule init
    git -C htData submodule update
    git -C htData submodule foreach --recursive git reset --hard origin/HEAD
fi

if [ -d "${SRC_DIR}/alglib" ] ; then
    echo "alglib exist, pulling"
    git -C alglib pull
else
    git clone git@77.244.215.97:cmir/alglib.git
fi

if [ -d "${SRC_DIR}/htSoft" ] ; then
    echo "htSoft exist, pulling"
    git -C htSoft pull
    # git -C htSoft submodule update
else
    git clone git@77.244.215.97:cmir/htSoft.git
	git -C htSoft flow init
    git -C htSoft checkout develop
    git -C htSoft submodule init
    git -C htSoft submodule update
    git -C htSoft submodule foreach --recursive git reset --hard origin/HEAD
fi


cd $STUFF_ROOT_DIR
