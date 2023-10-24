#!/usr/bin/env bash
# 此脚本用于本地构建测试。运行前建议执行 clean-full.sh 进行完整清理，因为当前的构建步骤脚本无法保证多次执行后的正确性。
export OPENWRT_BRANCH=main

# 开始执行完整的构建步骤
./openwrt-${OPENWRT_BRANCH}/steps/01_clone_openwrt.sh
./openwrt-${OPENWRT_BRANCH}/steps/02-prepare_package.sh
./openwrt-${OPENWRT_BRANCH}/steps/03-apply_config.sh slave
# 构建固件
(cd build/openwrt && make -j$(nproc) || {
    make -j1 V=s
    exit 1
})
