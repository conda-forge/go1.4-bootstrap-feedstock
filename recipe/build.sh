# Build go1.4 using gcc
export CGO_ENABLED=0
pushd ${PKG_NAME}/src
./make.bash
popd

# Don't need the cached build objects
rm -fr ${SRC_DIR}/${PKG_NAME}/pkg/obj

# Dropping the verbose option here, because Travis chokes on output >4MB
cp -a $SRC_DIR/${PKG_NAME} ${PREFIX}/

# Copy the rendered [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
for F in activate deactivate; do
  mkdir -p "${PREFIX}/etc/conda/${F}.d"
  cat "${RECIPE_DIR}/${F}-${PKG_NAME}.sh" \
    | envsubst  '${PREFIX}' \
    > "${PREFIX}/etc/conda/${F}.d/${PKG_NAME}.sh"
done
