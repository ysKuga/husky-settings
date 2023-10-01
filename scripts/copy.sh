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
cp -r $SOURCE_DIR/scripts/husky/ $TARGET_DIR/scripts/.

echo "以下を実行してください。"
echo ""
echo "- npx husky install"
echo ""
echo "以下の記述を package.json の scripts に追加してください。"
echo ""
echo "    \"prepare\": \"sh ./scripts/prepare.sh\","
echo ""
