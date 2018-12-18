export CONDA_GOROOT_BOOTSTRAP_BACKUP="${GOROOT_BOOTSTRAP:-}"
export GOROOT_BOOTSTRAP="${CONDA_PREFIX}/go1.4-bootstrap"

if [ $CONDA_BUILD == 1 ]; then
  export GOPATH_BACKUP="${GOPATH:-}"
  export GOPATH="${SRC_DIR}"
fi
