#!/bin/bash
set -e

verifyNative() {
    local quantum=$1
    local folder=$2

    local file=${folder}/Release${quantum}/Arm64/Magick.Native-${quantum}-Arm64.dll.so

    if [ ! -f $file ]; then
        echo "Unable to find $file"
        exit 1
    fi

    if ldd $file 2>&1 | grep "not found"; then
      exit 1
    else
        echo "Verified ldd status for $file"
    fi

    if ld $file 2>&1 | grep "undefined reference"; then
        exit 1
    else
        echo "Verified ld status for $file"
    fi
}

if [ ! -f "/usr/bin/ld" ]; then
    apt-get update -y
    apt-get install -y binutils
fi

verifyNative "Q8" $1
verifyNative "Q16" $1
verifyNative "Q16-HDRI" $1
