SCRIPT_DIR=$(cd $(dirname $0) && pwd)
TF_SRC=${TF_SRC:-.}


realpath() {
  case "$1" in /*) ;; *) printf '%s/' "$PWD";; esac; echo "$1"
}


docker run --rm -it \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -v $(realpath $TF_SRC):/tf_src \
    -w /tf_src terraform-aws $@
