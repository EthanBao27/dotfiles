#!/bin/bash

# Neovim手动安装脚本（支持GitHub镜像）
# 用法：ssh root@your-server 'bash -s' < install-neovim.sh

set -e

NEOVIM_VERSION="v0.11.3"
INSTALL_DIR="/usr/local"
TEMP_DIR="/tmp/neovim-install"

echo "=== Neovim手动安装脚本 ==="
echo "版本：$NEOVIM_VERSION"
echo "安装目录：$INSTALL_DIR"
echo "时间：$(date)"
echo

# 1. 检查系统信息
echo "1. 检查系统信息..."
OS="$(uname -s)"
ARCH="$(uname -m)"
echo "操作系统：$OS"
echo "架构：$ARCH"

# 2. 确定下载文件名
echo
echo "2. 确定下载文件..."
case "$ARCH" in
    x86_64)
        FILENAME="nvim-linux64.tar.gz"
        ;;
    aarch64)
        FILENAME="nvim-linux-arm64.tar.gz"
        ;;
    arm64)
        FILENAME="nvim-macos-arm64.tar.gz"
        ;;
    *)
        echo "不支持的架构：$ARCH"
        exit 1
        ;;
esac

echo "下载文件：$FILENAME"

# 3. 创建临时目录
echo
echo "3. 准备安装环境..."
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

# 4. 下载Neovim
echo
echo "4. 下载Neovim..."

# 定义下载URL
GITHUB_URL="https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/$FILENAME"

# 尝试不同的下载方式
download_success=false

# 方式1：使用curl + GitHub镜像
MIRRORS=(
    "https://github.com.cnpmjs.org"
    "https://hub.fastgit.xyz"
    "https://ghproxy.com/https://github.com"
)

for MIRROR in "${MIRRORS[@]}"; do
    MIRROR_URL="${GITHUB_URL//github.com/$MIRROR}"
    echo "尝试镜像：$MIRROR_URL"
    
    if curl -L -o "$FILENAME" "$MIRROR_URL" --connect-timeout 10 --max-time 300; then
        echo "✓ 下载成功"
        download_success=true
        break
    fi
done

# 方式2：使用wget
if ! $download_success && command -v wget >/dev/null; then
    echo "尝试使用wget下载..."
    if wget -O "$FILENAME" "$GITHUB_URL" --timeout=300 --tries=3; then
        echo "✓ 下载成功"
        download_success=true
    fi
fi

# 方式3：使用国内源
if ! $download_success; then
    echo "尝试使用国内源下载..."
    
    # 尝试一些国内镜像
    DOMESTIC_URLS=(
        "https://npmmirror.com/mirrors/neovim/$FILENAME"
        "https://mirrors.tuna.tsinghua.edu.cn/neovim/$FILENAME"
    )
    
    for URL in "${DOMESTIC_URLS[@]}"; do
        echo "尝试国内源：$URL"
        if curl -L -o "$FILENAME" "$URL" --connect-timeout 10 --max-time 300; then
            echo "✓ 下载成功"
            download_success=true
            break
        fi
    done
fi

if ! $download_success; then
    echo "✗ 所有下载方式都失败"
    echo "请手动下载Neovim并上传到服务器"
    echo "下载地址：$GITHUB_URL"
    exit 1
fi

# 5. 验证下载文件
echo
echo "5. 验证下载文件..."
if [ ! -f "$FILENAME" ]; then
    echo "✗ 下载文件不存在"
    exit 1
fi

FILE_SIZE=$(stat -c%s "$FILENAME" 2>/dev/null || stat -f%z "$FILENAME" 2>/dev/null)
echo "文件大小：$FILE_SIZE 字节"

# 6. 解压文件
echo
echo "6. 解压文件..."
tar -xzf "$FILENAME"
if [ ! -d "nvim-linux64" ]; then
    echo "✗ 解压失败，目录不存在"
    exit 1
fi

# 7. 安装Neovim
echo
echo "7. 安装Neovim..."

# 备份现有安装
if [ -d "$INSTALL_DIR/nvim" ]; then
    echo "备份现有Neovim安装..."
    mv "$INSTALL_DIR/nvim" "$INSTALL_DIR/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

# 复制文件
cp -r nvim-linux64/* "$INSTALL_DIR/"

# 8. 创建符号链接
echo
echo "8. 创建符号链接..."
ln -sf "$INSTALL_DIR/bin/nvim" /usr/local/bin/nvim
ln -sf "$INSTALL_DIR/bin/nvim" /usr/bin/nvim 2>/dev/null || true

# 9. 验证安装
echo
echo "9. 验证安装..."
if command -v nvim >/dev/null; then
    INSTALLED_VERSION=$(nvim --version | head -n1)
    echo "✓ Neovim安装成功"
    echo "版本：$INSTALLED_VERSION"
else
    echo "✗ Neovim安装失败"
    exit 1
fi

# 10. 配置环境变量
echo
echo "10. 配置环境变量..."
cat > /etc/profile.d/neovim.sh << EOF
# Neovim环境变量配置
export PATH="$INSTALL_DIR/bin:\$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
EOF

echo "✓ 环境变量配置完成"

# 11. 清理临时文件
echo
echo "11. 清理临时文件..."
cd /
rm -rf "$TEMP_DIR"

echo
echo "=== 安装完成 ==="
echo "Neovim已安装到：$INSTALL_DIR"
echo "可执行文件：$INSTALL_DIR/bin/nvim"
echo "请运行以下命令使环境变量生效："
echo "  source /etc/profile.d/neovim.sh"
echo "或者重新登录服务器"

# 12. 测试Neovim
echo
echo "12. 测试Neovim..."
if nvim --version >/dev/null 2>&1; then
    echo "✓ Neovim运行正常"
    echo "版本信息："
    nvim --version | head -n3
else
    echo "✗ Neovim运行异常"
fi

echo
echo "现在您可以重新运行remote-nvim连接了"