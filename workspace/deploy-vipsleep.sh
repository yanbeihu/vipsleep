#!/bin/bash

echo "🚀 开始部署 VIPSLEEP 网站..."

# 创建临时目录用于部署
TEMP_DIR=$(mktemp -d)
cp /workspace/projects/workspace/vipsleep-website.html "$TEMP_DIR/index.html"

cd "$TEMP_DIR"

# 初始化 Git 仓库
git init
git add index.html
git commit -m "Initial commit - VIPSLEEP website"

# 使用 GitHub API 创建仓库（如果提供了token）
if [ -n "$GITHUB_TOKEN" ]; then
    echo "📦 使用 GitHub API..."
    curl -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/repos \
        -d '{"name":"vipsleep-website","description":"VIPSLEEP Premium Pillows","public":true}' \
        2>/dev/null

    git remote add origin https://$GITHUB_TOKEN@github.com/$(git config user.name)/vipsleep-website.git
    git push -u origin main --force
    echo "✅ 网站已部署到 GitHub Pages!"
else
    echo "⚠️  需要设置 GITHUB_TOKEN 环境变量"
    echo "📝 请提供您的 GitHub Personal Access Token"
fi

cd /workspace/projects/workspace
rm -rf "$TEMP_DIR"
