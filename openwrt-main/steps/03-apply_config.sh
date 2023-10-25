#!/usr/bin/env bash
# 根据参数应用配置。
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=main

cd "$ROOTDIR/build/openwrt"

# 创建配置文件目录
rm -rf files/etc/config/
mkdir -p files/etc/config/

# 复制配置文件
cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/config/system files/etc/config/
cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/config/firewall files/etc/config/
cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/config/wireless files/etc/config/

# 复制 menuconfig 的配置
cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/seed/$1.seed .config

# 应用 menuconfig 修改
make defconfig
