#!/usr/bin/env bash
# 根据参数应用配置。
set -e

ROOTDIR=$(pwd)

cd "$ROOTDIR/build/openwrt"

# 将种子配置文件复制为当前的 .config
cp $ROOTDIR/openwrt/seed/$1.seed .config

make defconfig
