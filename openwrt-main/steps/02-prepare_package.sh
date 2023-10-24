#!/usr/bin/env bash
# 将包准备好。
set -e

ROOTDIR=$(pwd)

cd "$ROOTDIR/build/openwrt"

# update & install feeds
./scripts/feeds update -a && ./scripts/feeds install -a

COMMENT="slave"
# Time stamp with $(date +%Y.%m.%d)
BUILD_DATE="$(date +%Y.%m.%d)"
echo "Write build date in openwrt : $BUILD_DATE"
echo -e '\nBuilt by Hentioe on '$BUILD_DATE \($COMMENT\)'\n' >>package/base-files/files/etc/banner
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='Built by Hentioe on $BUILD_DATE'" >>package/base-files/files/etc/openwrt_release

rm -rf .config
