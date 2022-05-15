#!/bin/bash

git pull
git submodule update --init --recursive
path=$(pwd)
cat .gitmodules | grep "path" | awk '{print $3}' | while read line
do
    echo '###############################################'
    cd $line
    echo "Updating $line"
    git checkout main
    git pull
    cd $path
done