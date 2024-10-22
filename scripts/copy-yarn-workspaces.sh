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
# workspaces の格納対象
mkdir -p $TARGET_DIR/libs

# lefthook.yml の移動
cp $SOURCE_DIR/lefthook.yml $TARGET_DIR/lefthook.yml

# scripts 配下の移動
cp $SOURCE_DIR/scripts/prepare.sh $TARGET_DIR/scripts/prepare.sh
cp -r $SOURCE_DIR/scripts/husky/ $TARGET_DIR/scripts/.
cp -r $SOURCE_DIR/package.json $TARGET_DIR/libs/husky-settings/.
cp -r $SOURCE_DIR/yarn.lock $TARGET_DIR/libs/husky-settings/.

echo "以下の記述を package.json の workspaces に追加してください。"
echo ""
echo "    \"workspaces\": [\"libs/husky-settings\"],"
echo ""
echo "libs/husky-settings/package.json の name を任意のものに変更してください。"
echo ""
echo "    \"name\": \"husky-settings\","
echo ""
