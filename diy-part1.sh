#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#luci-app-dockerman up
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky
git clone https://github.com/sbwml/luci-app-openlist package/openlist
echo >> feeds.conf.default
sed -i '$a src-git modem https://github.com/kiddin9/kwrt-packages.git' feeds.conf.default
echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> feeds.conf.default
./scripts/feeds update qmodem
./scripts/feeds install -a -p qmodem
./scripts/feeds update -a && ./scripts/feeds install -a
./scripts/feeds install -a -f -p qmodem
./scripts/feeds update -a && ./scripts/feeds install -a
