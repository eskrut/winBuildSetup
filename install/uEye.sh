. ./rc

mkdir -p $LOCAL_DIR/uEye/

#full
gdown https://drive.google.com/uc?id=11rzAUldhfOtt3JcaQcefE1D4EvuC_t5m -O /tmp/uEye.zip
# #batch
# gdown https://drive.google.com/uc?id=119Ai7KP-oXrt9ym2iNcNbWwjraKG3-NZ -O /tmp/uEye.zip

unzip /tmp/uEye.zip -d /tmp/uEye
cd /tmp/uEye
mv uEye*.exe uEye.exe
cmd \/C uEye.exe
cd $STUFF_ROOT_DIR

base=/c/Program\ Files/IDS/uEye
cp -r "${base}"/Develop/include $LOCAL_DIR/uEye/
cp -r "${base}"/Develop/DynamicDll $LOCAL_DIR/uEye/
cp -r "${base}"/Develop/Lib $LOCAL_DIR/uEye/

rm /tmp/uEye.zip
rm -r /tmp/uEye
