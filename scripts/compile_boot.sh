#!/bin/bash

fullfile=$1
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"


if [[ ! -d build ]]
then
    mkdir build

if [[ -f build/$filename.bin ]]
then
    rm build/$filename.bin

nasm -f bin $1 -o build/$filename.bin
qemu-system-x86_64 build/$filename.bin  