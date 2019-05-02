. ./rc

mkdir -p $BASE_DISK/htSoftDistro

cp htSoft.deploy.iss .local/htSoft.deploy.iss && \
sed -i 's/c:\\opt/'$WIN_BASE_DISK'/g' .local/htSoft.deploy.iss
