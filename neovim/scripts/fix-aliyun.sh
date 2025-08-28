#!/bin/bash

# 一键修复阿里云服务器网络和Neovim安装问题
# 用法：ssh root@your-server 'bash -s' < fix-aliyun.sh

set -e

echo "=== 阿里云服务器一键修复脚本 ==="
echo "时间：$(date)"
echo

# 1. 网络诊断和修复
echo "=== 1. 网络诊断和修复 ==="

# 配置DNS
echo "配置阿里云DNS..."
cp /etc/resolv.conf /etc/resolv.conf.backup 2>/dev/null || true
cat > /etc/resolv.conf << EOF
nameserver 223.5.5.5
nameserver 223.6.6.6
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

# 安装基本工具
echo "安装基本工具..."
if command -v apt >/dev/null; then
    apt update && apt install -y curl wget git
elif command -v yum >/dev/null; then
    yum update -y && yum install -y curl wget git
elif command -v dnf >/dev/null; then
    dnf update -y && dnf install -y curl wget git
fi

# 2. 配置GitHub镜像
echo
echo "=== 2. 配置GitHub镜像 ==="

git config --global url."https://github.com.cnpmjs.org".insteadOf "https://github.com"
git config --global url."https://hub.fastgit.xyz".insteadOf "https://github.com"
git config --global url."https://ghproxy.com/https://github.com".insteadOf "https://github.com"

# 创建GitHub下载工具
cat > /usr/local/bin/github-download << 'EOF'
#!/bin/bash
URL="$1"
OUTPUT="$2"
MIRRORS=("https://github.com.cnpmjs.org" "https://hub.fastgit.xyz" "https://ghproxy.com/https://github.com")
for MIRROR in "${MIRRORS[@]}"; do
    MIRROR_URL="${URL//github.com/$MIRROR}"
    echo "尝试镜像：$MIRROR_URL"
    if [ -n "$OUTPUT" ]; then
        if curl -L -o "$OUTPUT" "$MIRROR_URL" --connect-timeout 10 --max-time 300; then
            echo "✓ 下载成功：$OUTPUT"
            exit 0
        fi
    else
        if curl -L -O "$MIRROR_URL" --connect-timeout 10 --max-time 300; then
            echo "✓ 下载成功"
            exit 0
        fi
    fi
    echo "✗ 下载失败，尝试下一个镜像..."
done
echo "✗ 所有镜像都失败"
exit 1
EOF
chmod +x /usr/local/bin/github-download

# 3. 安装Neovim
echo
echo "=== 3. 安装Neovim ==="

NEOVIM_VERSION="v0.11.3"
INSTALL_DIR="/usr/local"
TEMP_DIR="/tmp/neovim-install"

mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

# 确定文件名
ARCH="$(uname -m)"
case "$ARCH" in
    x86_64) FILENAME="nvim-linux64.tar.gz" ;;
    aarch64) FILENAME="nvim-linux-arm64.tar.gz" ;;
    *) echo "不支持的架构：$ARCH"; exit 1 ;;
esac

# 下载Neovim
echo "下载Neovim $FILENAME..."
GITHUB_URL="https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/$FILENAME"

# 尝试多种下载方式
if command -v github-download >/dev/null; then
    github-download "$GITHUB_URL" "$FILENAME"
else
    # 手动尝试镜像
    MIRRORS=("https://github.com.cnpmjs.org" "https://hub.fastgit.xyz")
    for MIRROR in "${MIRRORS[@]}"; do
        MIRROR_URL="${GITHUB_URL//github.com/$MIRROR}"
        echo "尝试：$MIRROR_URL"
        if curl -L -o "$FILENAME" "$MIRROR_URL" --connect-timeout 10 --max-time 300; then
            echo "✓ 下载成功"
            break
        fi
    done
fi

# 解压和安装
if [ -f "$FILENAME" ]; then
    echo "解压和安装..."
    tar -xzf "$FILENAME"
    
    # 备份现有安装
    if [ -d "$INSTALL_DIR/nvim" ]; then
        mv "$INSTALL_DIR/nvim" "$INSTALL_DIR/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    cp -r nvim-linux64/* "$INSTALL_DIR/"
    ln -sf "$INSTALL_DIR/bin/nvim" /usr/local/bin/nvim
    ln -sf "$INSTALL_DIR/bin/nvim" /usr/bin/nvim 2>/dev/null || true
    
    # 配置环境变量
    cat > /etc/profile.d/neovim.sh << EOF
export PATH="$INSTALL_DIR/bin:\$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
EOF
    
    echo "✓ Neovim安装完成"
else
    echo "✗ Neovim下载失败"
    exit 1
fi

# 4. 验证安装
echo
echo "=== 4. 验证安装 ==="

if command -v nvim >/dev/null; then
    echo "✓ Neovim已安装"
    echo "版本：$(nvim --version | head -n1)"
else
    echo "✗ Neovim安装失败"
    exit 1
fi

# 清理
cd /
rm -rf "$TEMP_DIR"

echo
echo "=== 修复完成 ==="
echo "现在您可以在Neovim中运行 :RemoteStart 来连接远程服务器"
echo "如果仍有问题，请检查："
echo "1. 服务器防火墙设置"
echo "2. SSH连接是否正常"
echo "3. Neovim是否正确安装"