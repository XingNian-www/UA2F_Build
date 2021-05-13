#!/bin/bash

# 添加SSRP+
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> feeds.conf.default

# 添加OpenClash
git clone https://github.com/vernesong/OpenClash.git
cp -rf OpenClash/luci-app-openclash package/luci-app-openclash

# 添加UA2F
git clone https://github.com/Zxilly/UA2F.git package/UA2F

# 更新queue
git clone https://github.com/openwrt/packages
rm -rf package/libs/libnetfilter-queue
# 本地用cp命令可以方便git pull
cp -rf packages/libs/libnetfilter-queue package/libs/
