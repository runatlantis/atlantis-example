SCRIPT_DIR=$(cd $(dirname $0) && pwd)

docker build $SCRIPT_DIR \
    --build-arg ARCH=arm64 \
    -f $SCRIPT_DIR/Dockerfile \
    -t terraform-aws
