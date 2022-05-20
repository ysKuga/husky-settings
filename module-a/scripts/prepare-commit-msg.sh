#!/usr/bin/env sh

readonly COMMIT_MSG_FILE=$1
readonly COMMIT_SOURCE=$2

echo $(pwd)
echo "module-a"
echo $COMMIT_MSG_FILE
echo $COMMIT_SOURCE
