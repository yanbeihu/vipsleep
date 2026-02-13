#!/bin/bash

# VIPSLEEP 网站部署脚本 - GitHub Pages

TOKEN=""
USERNAME="yanbeihu98"

echo "🚀 准备部署 VIPSLEEP 网站到 GitHub Pages..."
echo "👤 用户名: $USERNAME"
echo ""

# 检查是否提供了 token
if [ -z "$TOKEN" ]; then
    echo "⚠️  请提供 GitHub Personal Access Token"
    echo ""
    echo "如何获取 Token："
    echo "1. 访问: https://github.com/settings/tokens"
    echo "2. 点击 'Generate new token' → 'Generate new token (classic)'"
    echo "3. 勾选 'repo' 权限"
    echo "4. 生成后复制 token 发给我"
    echo ""
    exit 1
fi

# 创建临时目录
TEMP_DIR=$(mktemp -d)
echo "📁 创建临时目录..."

# 复制网站文件
cp /workspace/projects/workspace/vipsleep-website.html "$TEMP_DIR/index.html"

cd "$TEMP_DIR"

# 初始化 Git 仓库
echo "🔧 初始化 Git 仓库..."
git init
git config user.name "VIPSLEEP"
git config user.email "vipsleep@yanbeihu98.com"

# 添加文件
git add .
git commit -m "Initial commit - VIPSLEEP website"

# 创建 GitHub 仓库
echo "📦 创建 GitHub 仓库..."
curl -X POST \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d '{"name":"vipsleep","description":"VIPSLEEP Premium Pillows - Better Sleep for Everyone","public":true}' \
    2>/dev/null

# 添加远程仓库
git remote add origin https://$TOKEN@github.com/$USERNAME/vipsleep.git

# 推送到 GitHub
echo "🚀 推送到 GitHub..."
git push -u origin main --force

# 启用 GitHub Pages
echo "🌐 启用 GitHub Pages..."
curl -X PUT \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/$USERNAME/vipsleep/pages \
    -d '{"source":{"branch":"main","path":"/"}}' \
    2>/dev/null

echo ""
echo "✅ 部署完成！"
echo ""
echo "🌐 您的网站地址："
echo "   https://$USERNAME.github.io/vipsleep"
echo ""
echo "⏳ 可能需要 1-2 分钟才能访问，请稍候..."
echo ""

# 清理临时目录
cd /workspace/projects/workspace
rm -rf "$TEMP_DIR"
