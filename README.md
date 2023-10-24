# OpenWrt Builds for Redmi AX6000

[![Build Status](https://ci.hentioe.dev/api/badges/Hentioe/OpenWrt-Redmi-AX6000-Builds/status.svg)](https://ci.hentioe.dev/Hentioe/OpenWrt-Redmi-AX6000-Builds)
[![Version](https://img.shields.io/badge/version-latest-skyblue)](https://github.com/openwrt/openwrt/tree/main)
[![Firmware Download](https://img.shields.io/badge/download-firmware-pink)](https://op.hentioe.dev/dist/)

构建适用于 Redmi AX6000 的最新 OpenWrt。

## 说明

本项目是补丁、构建脚本、CI 配置的集合。和 OpenWrt 官方构建的快照版有所差异，但仍是原汁原味的。构建分为从版（slave）和主版（master），分别适用于下级路由和主路由两个场景。

>此处的两个版本可能仅适合我自己，但仍具备一些参考性。

_**注意：当前此项目预构建的固件仅能在 stock 布局的 AX6000 上刷入，ubootmod 布局的机器请不要乱刷。**_

## 构建细节

- 本项目的构建过程和固件下载都托管于作者自己的服务器，非手动也非 GitHub Actions。
- 本项目始终拉取 [`main`](https://github.com/openwrt/openwrt/tree/main) 分支的最新代码执行构建，不固定在某个版本分支或某个提交上。服务器每周构建一次，这是[下载页面](https://op.hentioe.dev/dist/)。
- 添加了 LuCI 和中文，默认为 Material 主题。
- 其它的本地化修改，如：使用中国境内的 NTP 服务器，中国时区等。
- 默认启用无线，名称为 `MiWiFi`/`MiWiFi-5G`，密码为 `012345678`。地区皆为澳大利亚，可解锁更高功率。5G 启用 160MHz 频宽，如果搜索不到请自行修改调试或干脆设置为 80MHz。
- slave 版本软件少，启用 NFS 客户端和完整的 LXC 支持，防火墙允许来自 WAN 口的访问。使用 LXC 配合 NFS 可体验诸多常规 Linux 发行版，让 AX6000 秒变 ARM 服务器。此版本适合作为下级路由器固件使用。
- master 版本软件更多，但不启用 NFS/LXC 支持，禁止来自 WAN 口的访问。包含 frp、ddns、sqm、vnstat2 等软件。此版本适合作为环境中唯一的主路由器固件使用。
- 有其它值得说明的再继续补充。

## 关联文章

参考这些文章，可以理解本项目为何会定制某些内容，也可以让 AX6000 发挥更大的作用。

- [知乎回答：OpenWrt 能做哪些有趣的事？](https://www.zhihu.com/question/568604090/answer/3251350523)

## 结束语

有其它问题可创建 issue 跟我交流。
