# husky-settings

husky の設定などを記述

## 内容

### prepare-commit-msg

ブランチ名から `/` を区切り文字としてチケット番号を抽出してコミットメッセージに反映させる。

- [#1 husky の導入から prepare-commit-msg の設定まで](https://github.com/ysKuga/husky-settings/issues/1)

```sh
$ git branch 
* issue-1/XXX
```

チケット番号のプレフィクスを `issue-` とした場合に、\
コミット時に `"issue-1 コミットメッセージ"` として自動的にチケット番号が付加される。

<details>
<summary>prepare-commit-msg 設定</summary>

`scripts/prepare-commit-msg.sh` にて使用している以下の変数に指定する必要がある。

```sh
# ブランチ名を `/` で分割した場合に何列目がチケット番号であるかの指定
# `{1 列目}/{2 列目}/{3 列目}/...`
TICKET_COL=1
# チケット番号のプレフィクス
# `{ISS-}123`
TICKET_PREFIX="#"
```

</details>
