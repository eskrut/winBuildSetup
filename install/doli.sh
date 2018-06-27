. ./rc

mkdir -p $LOCAL_DIR/doli/lib
mkdir -p $LOCAL_DIR/doli/include

gdown https://drive.google.com/uc?id=1tcW-EvwE0TfVZUna2oMQcq-44qu-cgQk -O /tmp/dope.zip
bsdtar -C $LOCAL_DIR/doli/lib -xf /tmp/dope.zip --strip-components=2 ./*/DoPE/
bsdtar -C $LOCAL_DIR/doli/include -xf /tmp/dope.zip --strip-components=2 ./*/include/

rm /tmp/dope.zip
