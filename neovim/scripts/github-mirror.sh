#!/bin/bash

# GitHub镜像配置脚本
# 用法：ssh root@your-server 'bash -s' < github-mirror.sh

echo "=== GitHub镜像配置 ==="
echo "时间：$(date)"
echo

# 1. 配置Git使用国内镜像
echo "1. 配置Git镜像..."
git config --global url."https://github.com.cnpmjs.org".insteadOf "https://github.com"
git config --global url."https://hub.fastgit.xyz".insteadOf "https://github.com"
git config --global url."https://ghproxy.com/https://github.com".insteadOf "https://github.com"

echo "✓ Git镜像配置完成"
echo "当前Git配置："
git config --global --list | grep -E "(url|mirror)"

# 2. 创建GitHub镜像下载脚本
echo
echo "2. 创建GitHub镜像下载脚本..."
cat > /usr/local/bin/github-download << 'EOF'
#!/bin/bash

# GitHub镜像下载工具
# 用法：github-download <github-url> [output-file]

URL="$1"
OUTPUT="$2"

if [ -z "$URL" ]; then
    echo "用法：github-download <github-url> [output-file]"
    echo "示例：github-download https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux64.tar.gz"
    exit 1
fi

# 尝试不同的镜像源
MIRRORS=(
    "https://github.com.cnpmjs.org"
    "https://hub.fastgit.xyz"
    "https://ghproxy.com/https://github.com"
)

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

echo "✗ 所有镜像都失败，请检查网络或使用代理"
exit 1
EOF

chmod +x /usr/local/bin/github-download
echo "✓ GitHub下载工具已安装到 /usr/local/bin/github-download"

# 3. 配置环境变量
echo
echo "3. 配置环境变量..."
cat >> /etc/profile.d/github-mirror.sh << 'EOF'
# GitHub镜像配置
export GITHUB_MIRROR="https://github.com.cnpmjs.org"
export GIT_ALTERNATE_OBJECT_DIRECTORIES="$GIT_ALTERNATE_OBJECT_DIRECTORIES"
EOF

echo "✓ 环境变量配置完成"

# 4. 创建wget/curl配置
echo
echo "4. 创建wget/curl配置..."

# wget配置
cat >> /etc/wgetrc << 'EOF'
# GitHub镜像配置
header = Accept: */*
timeout = 300
tries = 3
EOF

# curl配置
cat >> /etc/curlrc << 'EOF'
# GitHub镜像配置
connect-timeout = 10
max-time = 300
retry = 3
retry-delay = 5
EOF

echo "✓ wget/curl配置完成"

# 5. 测试镜像连接
echo
echo "5. 测试镜像连接..."
MIRRORS=("github.com.cnpmjs.org" "hub.fastgit.xyz")

for MIRROR in "${MIRRORS[@]}"; do
    echo "测试镜像：$MIRROR"
    if curl -I "https://$MIRROR" --connect-timeout 5 >/dev/null 2>&1; then
        echo "✓ $MIRROR 连接正常"
    else
        echo "✗ $MIRROR 连接失败"
    fi
done

echo
echo "=== 配置完成 ==="
echo "使用方法："
echo "1. 使用 github-download 命令下载GitHub文件"
echo "2. Git操作会自动使用镜像源"
echo "3. 重启终端使环境变量生效"