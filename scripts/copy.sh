#!/usr/bin/env sh

echo "husky の設定"

# 当ファイルのディレクトリのパス
SCRIPTS_DIR=$(
  cd "$(dirname "$0")"
  pwd
)
SOURCE_DIR=$(dirname $SCRIPTS_DIR)

# 設定対象となる実行ディレクトリ
TARGET_DIR=$(pwd)

# 移動先のディレクトリを確定する
mkdir -p $TARGET_DIR/scripts

# lefthook.yml の移動
cp $SOURCE_DIR/lefthook.yml $TARGET_DIR/lefthook.yml


# scripts 配下の移動
cp $SOURCE_DIR/scripts/prepare.sh $TARGET_DIR/scripts/prepare.sh
cp -r $SOURCE_DIR/scripts/husky/ $TARGET_DIR/scripts/.

