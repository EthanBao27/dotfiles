#!/bin/bash

# 阿里云服务器网络问题诊断和修复脚本
# 用法：ssh root@your-server 'bash -s' < network-fix.sh

echo "=== 阿里云服务器网络问题诊断和修复 ==="
echo "时间：$(date)"
echo

# 1. 网络连接测试
echo "1. 测试网络连接..."
echo "测试 GitHub 连接..."
timeout 10 curl -I https://github.com >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✓ GitHub 连接正常"
else
    echo "✗ GitHub 连接失败，需要配置代理或镜像"
fi

echo "测试 GitHub API 连接..."
timeout 10 curl -I https://api.github.com >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✓ GitHub API 连接正常"
else
    echo "✗ GitHub API 连接失败"
fi

# 2. DNS 测试
echo
echo "2. DNS 解析测试..."
nslookup github.com
if [ $? -eq 0 ]; then
    echo "✓ DNS 解析正常"
else
    echo "✗ DNS 解析失败，尝试使用其他DNS"
fi

# 3. 检查系统信息
echo
echo "3. 系统信息..."
echo "操作系统：$(cat /etc/os-release | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '"')"
echo "内核版本：$(uname -r)"
echo "架构：$(uname -m)"

# 4. 检查现有工具
echo
echo "4. 检查现有工具..."
command -v curl >/dev/null && echo "✓ curl 已安装" || echo "✗ curl 未安装"
command -v wget >/dev/null && echo "✓ wget 已安装" || echo "✗ wget 未安装"
command -v git >/dev/null && echo "✓ git 已安装" || echo "✗ git 未安装"
command -v nvim >/dev/null && echo "✓ neovim 已安装" || echo "✗ neovim 未安装"

# 5. 网络优化建议
echo
echo "5. 网络优化配置..."

# 备份原有配置
cp /etc/resolv.conf /etc/resolv.conf.backup 2>/dev/null

# 使用阿里云DNS
echo "配置阿里云DNS..."
cat > /etc/resolv.conf << EOF
nameserver 223.5.5.5
nameserver 223.6.6.6
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

# 配置Git代理（如果需要）
echo "配置Git镜像..."
git config --global url."https://github.com.cnpmjs.org".insteadOf "https://github.com"
git config --global url."https://hub.fastgit.xyz".insteadOf "https://github.com"

echo "✓ 网络优化配置完成"

# 6. 安装基本工具
echo
echo "6. 安装基本工具..."

# 检测包管理器
if command -v apt >/dev/null; then
    echo "检测到 apt 包管理器"
    apt update
    apt install -y curl wget git
elif command -v yum >/dev/null; then
    echo "检测到 yum 包管理器"
    yum update -y
    yum install -y curl wget git
elif command -v dnf >/dev/null; then
    echo "检测到 dnf 包管理器"
    dnf update -y
    dnf install -y curl wget git
else
    echo "未检测到支持的包管理器"
fi

echo
echo "=== 诊断完成 ==="
echo "建议："
echo "1. 如果仍然无法访问 GitHub，考虑使用 VPN 或代理"
echo "2. 可以使用国内镜像源下载软件"
echo "3. 检查安全组规则是否允许出站连接"