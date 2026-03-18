#!/bin/bash
# Gump 数字孪生同步脚本
# 用法: ./sync.sh [commit-message]

set -e

REPO_DIR="/root/.openclaw/workspace/gump-digital-twin"
WORKSPACE="/root/.openclaw/workspace"

cd "$REPO_DIR"

# 同步核心文件
echo "📋 同步核心文件..."
cp "$WORKSPACE/SOUL.md" profile/
cp "$WORKSPACE/IDENTITY.md" profile/
cp "$WORKSPACE/AGENTS.md" config/
cp "$WORKSPACE/USER.md" config/
cp "$WORKSPACE/HEARTBEAT.md" config/
cp "$WORKSPACE/MEMORY.md" memory/
cp "$WORKSPACE/memory/"*.md memory/daily/ 2>/dev/null || true

# 同步技能
echo "🔧 同步技能..."
rm -rf skills/*
cp -r "$WORKSPACE/skills/"* skills/ 2>/dev/null || true

# 创建脱敏配置
echo "🔐 生成脱敏配置..."
cat "$WORKSPACE/../openclaw.json" | \
  sed 's/"apiKey": "sk-[^"]*"/"apiKey": "<REDACTED>"/g' | \
  sed 's/"appId": "[^"]*"/"appId": "<REDACTED>"/g' | \
  sed 's/"appSecret": "[^"]*"/"appSecret": "<REDACTED>"/g' | \
  sed 's/"token": "[^"]*"/"token": "<REDACTED>"/g' \
  > config/openclaw.config.json

# Git 操作
echo "📦 Git 提交..."
git add -A
MSG="${1:-Gump evolution sync $(date +%Y-%m-%d\ %H:%M)}"
git commit -m "$MSG" || echo "Nothing to commit"

echo "✅ 同步完成"
echo "💡 执行 'git push' 推送到远程"