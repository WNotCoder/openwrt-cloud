# Add some actions
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,sing*,smartdns} feeds/packages/utils/v2dat feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang -b 1.26 feeds/packages/lang/golang

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
wget -q -O geoip.metadb https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country-without-asn.mmdb || echo "Error: Failed to download geoip.metadb"
echo "nikki ip file downloaded"