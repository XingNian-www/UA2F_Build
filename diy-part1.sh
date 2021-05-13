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
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#添加UA2F
git clone https://github.com/Zxilly/UA2F.git package/UA2F

#更新queue
git clone https://github.com/openwrt/packages
rm -rf package/libs/libnetfilter-queue
cp -rf packages/libs/libnetfilter-queue package/libs/

# 追加内核设置
echo "CONFIG_IP_SET=y
CONFIG_IP_SET_HASH_IPPORT=y
CONFIG_IP_SET_MAX=256
CONFIG_NETFILTER=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NETFILTER_NETLINK_LOG=y
CONFIG_NETFILTER_XTABLES=y
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NF_CONNTRACK=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_NETLINK=y
CONFIG_NF_DEFRAG_IPV4=y
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_TABLES=y" >> target/linux/x86/config-5.4
