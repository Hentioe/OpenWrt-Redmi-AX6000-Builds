#!/usr/bin/env bash
# 将包准备好。
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=main

cd "$ROOTDIR/build/openwrt"

# update & install feeds
./scripts/feeds update -a && ./scripts/feeds install -a

COMMENT="slave"
# Time stamp with $(date +%Y.%m.%d)
BUILD_DATE="$(date +%Y.%m.%d)"
BANNER_EXTRA=$($ROOTDIR/tools/render_tpl $ROOTDIR/openwrt-$OPENWRT_BRANCH/banner_extra -v build_date=$BUILD_DATE)
echo "Write build date in openwrt : $BUILD_DATE"
echo -e "\n$BANNER_EXTRA ($COMMENT)\n" >>package/base-files/files/etc/banner
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='$BANNER_EXTRA'" >>package/base-files/files/etc/openwrt_release

rm -rf .config
