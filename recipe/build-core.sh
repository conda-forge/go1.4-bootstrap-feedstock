# Build go1.4 using gcc
set -euf
export CGO_ENABLED=0
pushd go1.4-bootstrap/src
./make.bash
popd

# Don't need the cached build objects
rm -fr ${SRC_DIR}/go1.4-bootstrap/pkg/obj

# Dropping the verbose option here, because Travis chokes on output >4MB
cp -a $SRC_DIR/go1.4-bootstrap ${PREFIX}/

# Copy the rendered [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
for F in activate deactivate; do
  mkdir -p "${PREFIX}/etc/conda/${F}.d"
  cat "${RECIPE_DIR}/${F}-go1.4-bootstrap.sh" \
    | envsubst  '${PREFIX}' \
    > "${PREFIX}/etc/conda/${F}.d/go1.4-bootstrap.sh"
done
