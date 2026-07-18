#!/bin/bash
# Deploy script for Feahter's GitHub Pages (Hexo)
# Run from repo root: bash deploy.sh

set -e

echo "🔄 清理缓存 + 生成静态页..."
cd hexo && npx hexo clean && npx hexo generate && cd ..

echo "📦 复制到仓库根目录..."
# 保留旧目录结构和文件，但用新生成的覆盖
# hexo/public/ 包含所有生成的文件
rsync -a hexo/public/ ./ --exclude=hexo/ --exclude=.git --exclude=deploy.sh

echo "✅ 部署完成。"
echo ""
echo "如需推送到 GitHub:"
echo "  git add -A && git commit -m 'update' && git push"
