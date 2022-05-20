#!/usr/bin/env sh

readonly COMMIT_MSG_FILE=$1
readonly COMMIT_SOURCE=$2

# ブランチ名を `/` で分割した場合に何列目がチケット番号であるかの指定
# `{1 列目}/{2 列目}/{3 列目}/...`
TICKET_COL=1

# ブランチ名を取得
# https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git#answer-12142066
branch=$(git rev-parse --abbrev-ref HEAD)
# `/` によりブランチ名を分割してチケット番号を取得
ticket=$(echo $branch | cut -d / -f $TICKET_COL)
