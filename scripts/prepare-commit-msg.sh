#!/usr/bin/env sh

readonly COMMIT_MSG_FILE=$1
readonly COMMIT_SOURCE=$2

# ブランチ名を `/` で分割した場合に何列目がチケット番号であるかの指定
# `{1 列目}/{2 列目}/{3 列目}/...`
TICKET_COL=1
# GitHub 向けのブランチのプレフィクス
# `{issue-}123`
GITHUB_BRANCH_PREFIX="issue-"
# GitHub 向けのコミットログのプレフィクス
GITHUB_ISSUE_PREFIX="#"
# チケット番号のプレフィクス
# `{ISS-}123`
TICKET_PREFIX="ISS-"

# ブランチ名を取得
# https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git#answer-12142066
branch=$(git rev-parse --abbrev-ref HEAD)
# Issue, チケットの番号
ticket_number=$(echo $branch | perl -p -e "s/(($GITHUB_BRANCH_PREFIX|$TICKET_PREFIX)(\d+))?.*/\$3/g")
# GitHub 向けのブランチ中の Issue
github_issue=$(echo $branch | perl -p -e "s/(($GITHUB_BRANCH_PREFIX)(\d+))?.*/\$1/g")
# Jira などのチケット番号
ticket=$(echo $branch | perl -p -e "s/(($TICKET_PREFIX)(\d+))?.*/\$1/g")
# ブランチ自体にチケット番号が含まれているかの確認
ticket_exists=$(echo $ticket | perl -p -e "s/^(${TICKET_PREFIX})?.*/\$1/g")

# https://zenn.dev/choimake/articles/e0865a4fac37ab
case "${COMMIT_SOURCE}" in
commit) # use -c/-C/--amend
  :     # 何もしない
  ;;
*)
  # GitHub の Issue 番号が含まれていた場合
  if [ -n "$github_issue" ]; then
    # GitHub の場合は `#` に番号を付与
    perl -p -i.bak -e "if (1 .. 1) { s/\A(${GITHUB_BRANCH_PREFIX}\d+)?\s*/${GITHUB_ISSUE_PREFIX}${ticket_number} /g }" $COMMIT_MSG_FILE
    cat $COMMIT_MSG_FILE
  fi
  # Jira などのチケット番号が含まれていた場合
  if [ -n "$ticket" ]; then
    # GitHub の場合は `#` に番号を付与
    perl -p -i.bak -e "if (1 .. 1) { s/\A(${TICKET_PREFIX}\d+)?\s*/${ticket} /g }" $COMMIT_MSG_FILE
    cat $COMMIT_MSG_FILE
  fi
  ;;
esac
