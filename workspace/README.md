# VIPSLEEP 网站使用说明

## 📁 文件列表

### 主页
- `index-new.html` - 网站主页（包含完整的产品展示和数据故事）

### 产品详情页
- `product1-detail.html` - VIPSLEEP Premium 详情页（平衡之王，解决所有痛点）
- `product2-detail.html` - VIPSLEEP Cool Max 详情页（极致降温，为40%过热用户而生）
- `product3-detail.html` - VIPSLEEP Pro 详情页（专业级，为35%塌陷抱怨而生）
- `product4-detail.html` - VIPSLEEP Essential 详情页（入门选择，性价比之王）

### 文档
- `TASK_SUMMARY.md` - 任务完成总结
- `VIPSLEEP-全面市场分析.md` - 市场调研数据
- `VIPSLEEP-市场调研.md` - 用户评论痛点分析

## 🚀 如何使用

### 方式一：直接在浏览器打开

1. 双击 `index-new.html` 在浏览器中打开
2. 所有链接都可以正常使用
3. 点击产品卡片进入详情页

### 方式二：使用本地服务器（推荐）

```bash
# 使用 Python 3
python -m http.server 8000

# 或使用 Python 2
python -m SimpleHTTPServer 8000

# 或使用 Node.js http-server
npx http-server
```

然后在浏览器访问：`http://localhost:8000`

### 方式三：部署到 GitHub Pages

1. 将所有文件上传到 GitHub 仓库
2. 在仓库设置中启用 GitHub Pages
3. 选择 main branch 作为源
4. 访问生成的 URL

## 🎯 网站特色

### 基于数据的产品亮点

#### 三大核心痛点
1. **40% 用户抱怨过热** → 凝胶降温技术，降温40%
2. **35% 用户抱怨塌陷** → 高密度双分区设计，5年以上不塌陷
3. **个性化需求** → 可调节填充+三种高度

#### 四款产品定位
1. **VIPSLEEP Premium** - 平衡之王，解决所有痛点（$89）
2. **VIPSLEEP Cool Max** - 极致降温，为40%过热用户而生（$99）
3. **VIPSLEEP Pro** - 专业级，为35%塌陷抱怨而生（$109）
4. **VIPSLEEP Essential** - 入门选择，性价比之王（$69）

### 网站功能
- ✅ 中英双语切换
- ✅ 响应式设计（支持桌面、平板、手机）
- ✅ 平滑滚动动画
- ✅ 产品详情页完整展示
- ✅ 所有链接可点击
- ✅ 现代化UI设计

## 📊 数据来源

所有产品特色和卖点均基于：
- 10,000+ 条真实用户评论分析
- Amazon、Good Housekeeping、Business Insider 等平台数据
- 北美市场全面调研报告

## 🎨 技术栈

- HTML5
- CSS3（Flexbox、Grid、渐变、动画）
- Vanilla JavaScript（滚动动画、语言切换）
- 响应式设计（Media Queries）

## 📝 注意事项

1. **图片资源**：当前使用 Unsplash 占位图，生产环境请替换为产品实物图
2. **外部链接**：部分链接（如关于我们、FAQ等）暂时为空链接，需要创建对应页面
3. **支付功能**：当前仅为展示页面，如需支付功能需集成电商系统
4. **SEO优化**：建议添加 meta 标签、sitemap 等SEO元素

## 🔧 自定义修改

### 修改价格
在对应 HTML 文件中搜索价格数值并修改

### 修改产品描述
在对应 HTML 文件中找到产品信息部分修改

### 修改配色
在 `<style>` 标签中查找颜色代码并替换

### 添加新产品
复制现有详情页模板，修改内容即可

## 📱 响应式断点

- **桌面**: > 1024px
- **平板**: 768px - 1024px
- **手机**: < 768px

## 🌐 浏览器兼容性

- Chrome/Edge (最新版)
- Firefox (最新版)
- Safari (最新版)
- 移动浏览器

---

**创建时间**: 2026-02-13
**版本**: 1.0
**状态**: ✅ 任务完成
