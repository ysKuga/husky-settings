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
# workspaces の格納対象
mkdir -p $TARGET_DIR/libs

# lefthook.yml の移動
cp $SOURCE_DIR/lefthook.yml $TARGET_DIR/lefthook.yml

# .husky 配下の移動
cp $SOURCE_DIR/.husky/pre-commit $TARGET_DIR/.husky/.
cp $SOURCE_DIR/.husky/prepare-commit-msg $TARGET_DIR/.husky/.

# scripts 配下の移動
cp $SOURCE_DIR/scripts/prepare.sh $TARGET_DIR/scripts/prepare.sh
cp -r $SOURCE_DIR/scripts/husky/ $TARGET_DIR/scripts/.
cp -r $SOURCE_DIR/package.json $TARGET_DIR/libs/husky-settings/.
cp -r $SOURCE_DIR/yarn.lock $TARGET_DIR/libs/husky-settings/.

echo "以下を実行してください。"
echo ""
echo "- npx husky install"
echo ""
echo "以下の記述を package.json の scripts に追加してください。"
echo ""
echo "    \"prepare\": \"sh ./scripts/prepare.sh\","
echo ""
echo "以下の記述を package.json の workspaces に追加してください。"
echo ""
echo "    \"workspaces\": [\"libs/husky-settings\"],"
echo ""
echo "libs/husky-settings/package.json の name を任意のものに変更してください。"
echo ""
echo "    \"name\": \"husky-settings\","
echo ""
