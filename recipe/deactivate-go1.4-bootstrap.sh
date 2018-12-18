if [ $CONDA_BUILD == 1]; then
  export GOPATH="${GOPATH_BACKUP}"
  unset GOPATH_BACKUP
  if [ -z "$GOPATH" ]; then
    unset GOPATH
  fi
fi

export GOROOT_BOOTSTRAP="${CONDA_GOROOT_BOOTSTRAP_BACKUP}"
unset CONDA_GOROOT_BOOTSTRAP_BACKUP
if [ -z "$GOROOT_BOOTSTRAP" ]; then
    unset GOROOT_BOOTSTRAP
fi
