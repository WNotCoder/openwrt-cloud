# Add some actions
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,sing*,smartdns} feeds/packages/utils/v2dat feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang -b 1.26 feeds/packages/lang/golang


# 下载OpenClash Meta core及nikki ip file
# 确保目标文件夹存在
mkdir -p files/etc/openclash/core
mkdir -p files/etc/nikki/run
# 函数：错误处理
error_exit() {
    echo "错误：$1"
    exit 1
}
# 1. 下载并处理 OpenClash Meta core
echo "正在下载 OpenClash Meta core..."
wget -q https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz || error_exit "下载 OpenClash Meta core 失败"
echo "正在解压 OpenClash Meta core..."
tar -xzf clash-linux-arm64.tar.gz || error_exit "解压 OpenClash Meta core 失败"
echo "正在移动 OpenClash Meta core..."
mv clash clash_meta || error_exit "重命名 OpenClash Meta core 失败"
mv clash_meta files/etc/openclash/core/ || error_exit "移动 OpenClash Meta core 失败"
chmod 755 files/etc/openclash/core/clash_meta || error_exit "设置 OpenClash Meta core 权限失败"
echo "OpenClash Meta core downloaded"

# 2. 下载并处理 nikki ip file
echo "正在下载 nikki ip file..."
wget -q -O geoip.metadb https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country-without-asn.mmdb || error_exit "下载 nikki ip file 失败"
echo "正在移动 nikki ip file..."
mv geoip.metadb files/etc/nikki/run/ || error_exit "移动 nikki ip file 失败"
chmod 755 files/etc/nikki/run/geoip.metadb || error_exit "设置 nikki ip file 权限失败"
echo "nikki ip file downloaded"

echo "OpenClash Meta core and nikki ip file downloaded"


