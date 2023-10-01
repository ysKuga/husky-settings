# husky-settings

husky の設定などを記述

## 適用

適用対象のディレクトリより `scripts/copy.sh` を実行する。

当リポジトリと同一階層に対象がある場合

```sh
sh ../husky-settings/scripts/copy.sh
```

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
# GitHub 向けのブランチのプレフィクス
# `{issue-}123`
GITHUB_BRANCH_PREFIX="issue-"
# GitHub 向けのコミットログのプレフィクス
GITHUB_ISSUE_PREFIX="#"
# チケット番号のプレフィクス
# `{ISS-}123`
TICKET_PREFIX="ISS-"
```

</details>

## 使用ライブラリ

### [evilmartians/lefthook](https://github.com/evilmartians/lefthook)

husky のスクリプトの実行タイミングの調整に使用

- `lefthook.yml` で変更ファイルのパスにより実行内容を指定する。
- `.husk/` 配下は lefthook により自動で更新されるため手動での変更を行わない。
