#!/bin/bash

LIB=libJlTrussC

function create_tar_gz() {
    target=$1
    ext=$2
    name_arg=$3
    name=${name_arg:="$LIB"}
    rm -rf $target
    mkdir $target
    mkdir $target/lib
    mkdir $target/include
    cp libs/$name.$ext $target/lib
    cd $target
    tar czf $target.tar.gz *
    cd ..
    rm -rf $target
}

cd `dirname $0`
rm -rf *.tar.gz
create_tar_gz "mac_arm64" "dylib"
create_tar_gz "linux_arm64" "so"
create_tar_gz "windows_arm64" "dll"