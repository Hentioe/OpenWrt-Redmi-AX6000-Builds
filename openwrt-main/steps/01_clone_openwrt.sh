#!/usr/bin/env bash
# 克隆原始仓库的主分支，输出最新的提交信息。
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=23.05

# 创建构建目录
echo "Creating build directory..."
cd $ROOTDIR
mkdir build
cd build

# 克隆 OpenWRT 仓库
git clone -b main --depth=1 https://git.openwrt.org/openwrt/openwrt.git openwrt

# 输出最新的提交信息
echo "Latest OpenWrt commit:"
(cd openwrt && git log -1)
