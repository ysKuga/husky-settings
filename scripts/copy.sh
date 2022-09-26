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
mkdir -p $TARGET_DIR/.husky
mkdir -p $TARGET_DIR/scripts

# .husky 配下の移動
cp $SOURCE_DIR/.husky/pre-commit $TARGET_DIR/.husky/.
cp $SOURCE_DIR/.husky/prepare-commit-msg $TARGET_DIR/.husky/.

# scripts 配下の移動
cp $SOURCE_DIR/scripts/prepare.sh $TARGET_DIR/scripts/prepare.sh
cp $SOURCE_DIR/scripts/pre-commit.sh $TARGET_DIR/scripts/pre-commit.sh
cp $SOURCE_DIR/scripts/prepare-commit-msg.sh $TARGET_DIR/scripts/prepare-commit-msg.sh
