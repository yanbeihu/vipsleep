#!/bin/bash

echo "🚀 开始部署 VIPSLEEP 完整电商网站..."

# 创建临时目录用于部署
TEMP_DIR=$(mktemp -d)
cp /workspace/projects/workspace/vipsleep-ecommerce-full.html "$TEMP_DIR/index.html"

cd "$TEMP_DIR"

# 初始化 Git 仓库
git init
git add index.html
git commit -m "Deploy VIPSLEEP full ecommerce website"

# 使用 GitHub API 创建仓库（如果提供了token）
if [ -n "$GITHUB_TOKEN" ]; then
    echo "📦 使用 GitHub API..."

    # 检查仓库是否已存在，如果存在则跳过创建
    OWNER=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user | grep '"login"' | head -1 | cut -d'"' -f4)

    # 尝试创建仓库（忽略已存在错误）
    curl -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/repos \
        -d '{"name":"vipsleep","description":"VIPSLEEP Premium Pillows - Full Ecommerce Website","public":true}' \
        2>/dev/null

    git remote add origin https://$GITHUB_TOKEN@github.com/$OWNER/vipsleep.git
    git branch -M main
    git push -u origin main --force
    echo "✅ 网站已部署到 GitHub Pages!"
    echo "🌐 访问地址: https://$OWNER.github.io/vipsleep"
else
    echo "⚠️  需要设置 GITHUB_TOKEN 环境变量"
    echo "📝 请提供您的 GitHub Personal Access Token"
fi

cd /workspace/projects/workspace
rm -rf "$TEMP_DIR"
