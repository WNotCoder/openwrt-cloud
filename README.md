# 基于ImmortalWrt构建的OpenWrt固件

> **用于主路由的OpenWrt固件，专注于主路由核心功能** \
> **适配路由：京东云亚瑟（RE-SS-01），其他路由未来可能会支持**

***

## 适用对象

适用于有NAS、AC、AP等网络设备，只希望主路由做好路由功能的用户。 \
不适用于将路由当作AIO设备的用户。

***

## 主要特性

### 🔓 聚焦主路由功能

精简所有WiFi、USB等与主路由功能无关的驱动及模块，只保留必要的功能。编译后固件大小不超过70MB，首次运行内容可用率65%。

### ⚡ 开箱即用

自带OpenClash核心、GEOIP数据库等需要联网下载的文件 \
解决想科学上网先需要科学上网下载插件这种鸡生蛋、蛋生鸡的问题。

### 🧩 便捷的测试功能

集成wget命令、curl命令、netspeedtest等便捷的测试功能，便于快速测试网络连接速度。

### 🔄 持续进化

其他特性边用边想。

***

## 集成的插件

* 功能插件

| 插件      | 用途                   |
| :------ | :-------------------- |
| 🏠 nikki | 科学上网 |
| 🌐 openclash | 科学上网 |
| 🔐 lucky | 反向代理 |
| 🎮 upnp | upnp |
| 🤖 vlmcsd | 微软激活 |
| 🤖 netspeedtest | 网络测速 |

* 系统插件

| 插件      | 用途                   |
| :------ | :-------------------- |
| 📁 filemanager | 简单文件管理 |
| 📁 ttyd | 网页终端 |
| 📁 diskman | 磁盘管理 |


***

## 需要注意的事项

1. 使用nikki需要关闭系统自带的DNS重定向功能（位置：网络-DNS-DNS重定向）。
2. 请勿开启路由/NAT卸载功能，NSS固件自身已支持，此项功能开启无论软硬都会导致使用OpenWrt系统自带的流量卸载功能，使NSS失效。
3. 管理地址：192.168.100.1，默认无密码

***

## 一些没集成的插件的考虑

1. 广告过滤类（如： AdGuard Home）。路由器的广告过滤功能基于DNS污染，会导致奇奇怪怪的问题。建议使用浏览器插件。
2. DNS解析类（如： smartDNS）。科学上网插件自身有DNS选择的功能，建议通过科学上网插件优化DNS服务器选择。
3. 内网穿透类（如： Tailscale）。自身能力不足，加入这类插件以后科学上网就不能用了，暂时没找到具体原因。
4. 其他插件。其他没添加的就是我自己不需要。

***

## 社区

- 📖 基于[ImmortalWrt官方](https://github.com/immortalwrt/immortalwrt)以及[VIKINGYFY的ImmortalWrt项目](https://github.com/VIKINGYFY/immortalwrt)编译
- 💬 NSS 支持代码来自于：[JiaY-shi](https://github.com/JiaY-shi)和[qosmio](https://github.com/qosmio)
- 🐙 云编译使用[p3terx](https://p3terx.com/archives/build-openwrt-with-github-actions.html)的云编译代码

***

## TODO：

- [ ] 删除 系统-Plugins 
- [ ] 光猫AP访问插件
- [ ] 剩下的空间还能用于哪些功能
- [ ] 使用预配置文件更改network文件

