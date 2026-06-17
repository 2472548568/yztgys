#!/bin/bash

set -e

if [ $# -lt 1 ]; then
  echo "用法: $0 <公共素材库路径>"
  echo ""
  echo "示例:"
  echo "  $0 ~/MockAssets"
  exit 1
fi

SOURCE_DIR="$1"
TARGET_DIR="原型/后台管理端/系统名称/assets/images/mock"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "错误: 公共素材库不存在: $SOURCE_DIR"
  exit 1
fi

mkdir -p "$TARGET_DIR"

echo "正在同步后台 mock 素材..."
echo "来源: $SOURCE_DIR"
echo "目标: $TARGET_DIR"

rsync -av --exclude ".DS_Store" "$SOURCE_DIR"/ "$TARGET_DIR"/

echo "同步完成。"
