#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Download OpenClash Meta core
mkdir -p files/etc/openclash/core
cd files/etc/openclash/core
wget -q https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz
tar -xzf clash-linux-arm64.tar.gz
mv clash clash_meta
rm -f clash-linux-arm64.tar.gz
chmod +x clash_meta
echo "OpenClash Meta core downloaded and configured"

# Download nikki ip file
mkdir -p files/etc/nikki/run
cd files/etc/nikki/run
wget -O https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip-lite.dat
wget -O https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat
wget -O https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/country-lite.mmdb
wget -O https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/GeoLite2-ASN.mmdb
echo "nikki ip file downloaded"
