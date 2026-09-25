#!/usr/bin/env bash

# main などへの push 抑止
# stdin: `<local ref> <local sha> <remote ref> <remote sha>`

# push 禁止対象 `|` で結合して複数指定する
forbidden="main"

while read -r local_ref local_sha remote_ref remote_sha; do
  if [[ "$remote_ref" =~ ^refs/heads/($forbidden)$ ]]; then
    echo "${remote_ref#refs/heads/} への push は禁止されています"
    exit 1
  fi
done
