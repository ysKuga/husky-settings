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
# `/` によりブランチ名を分割してチケット番号を取得
ticket=$(echo $branch | cut -d / -f $TICKET_COL)
# ブランチ自体にチケット番号が含まれているかの確認
ticket_exists=$(echo $ticket | perl -p -e "s/^(${TICKET_PREFIX})?.*/\$1/g")

# https://zenn.dev/choimake/articles/e0865a4fac37ab
case "${COMMIT_SOURCE}" in
commit) # use -c/-C/--amend
  :     # 何もしない
  ;;
*)
  # ブランチ名に $TICKET_PREFIX を含んだチケット番号が存在していた場合
  if [ -n "$ticket_exists" ]; then
    # チケット番号をコミットメッセージの前に挿入する
    # `^${TICKET_PREFIX}\d+\s*` により別のチケット番号の入力を置き換え
    perl -p -i.bak -e "if (1 .. 1) { s/\A(${TICKET_PREFIX}\d+)?\s*/${ticket} /g }" $COMMIT_MSG_FILE
    cat $COMMIT_MSG_FILE
  fi
  ;;
esac
