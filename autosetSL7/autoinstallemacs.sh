#!/bin/bash
# autoinstallemacs.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:13:19 2017 (+0800)
# Last-Updated: 五 6月  2 14:43:50 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 9
# URL: http://wuhongyi.cn -->

emacsfilename="emacs-24.5"

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

rm -f ${emacsfilename}.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/emacs/${emacsfilename}.tar.gz

if [ ! -f "${emacsfilename}.tar.gz" ]; then
    echo "文件 ${emacsfilename}.tar.gz 未下载成功"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${emacsfilename}.tar.gz
cd ${emacsfilename}
./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf ${emacsfilename}

# 
# autoinstallemacs.sh ends here