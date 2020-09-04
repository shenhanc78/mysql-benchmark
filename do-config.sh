#!/bin/bash

DDIR=$(cd $(dirname $0) ; pwd)

mkdir -p build-opt
pushd build-opt

SYM_FILE=${DDIR}/propeller/propeller.symorder
SYM_OPT="-Wl,--symbol-ordering-file=${SYM_FILE}"

cmake -G Ninja -DCMAKE_LINKER="lld" -DDOWNLOAD_BOOST=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DFPROFILE_USE=ON -DFPROFILE_DIR=${DDIR}/propeller/profile -DCMAKE_C_FLAGS="-funique-internal-linkage-names -flto=thin -fbasic-block-sections=list=${DDIR}/propeller/propeller.cluster -fuse-ld=lld -DDBUG_OFF -ffunction-sections -fdata-sections -O3 -DNDEBUG -Qunused-arguments -funique-internal-linkage-names" -DCMAKE_CXX_FLAGS="-funique-internal-linkage-names -flto=thin -fbasic-block-sections=list=${DDIR}/propeller/propeller.cluster -fuse-ld=lld -DDBUG_OFF -ffunction-sections -fdata-sections -O3 -DNDEBUG -Qunused-arguments -funique-internal-linkage-names" -DCMAKE_EXE_LINKER_FLAGS="-Wl,--no-call-graph-profile-sort -Wl,--lto-basic-block-sections=${DDIR}/propeller/propeller.cluster -flto=thin ${SYM_OPT} -Wl,-z,keep-text-section-prefix" -DDOWNLOAD_BOOST=1 -DWITH_BOOST=${DDIR}/mysql-server/boost ${DDIR}/mysql-server

popd
