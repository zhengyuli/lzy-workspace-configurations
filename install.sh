#!/bin/bash

#---------------------------------------------------------------------------------
# Name: install.sh
# Purpose:
#
# Time-stamp: <2018-12-11 10:04:43 Tuesday by lli>
#
# Author: zhengyu li
# Created: 2014-03-26
#
# Copyright (c) 2014 zhengyu li <lizhengyu419@gmail.com>
#---------------------------------------------------------------------------------

source /etc/profile
export LC_ALL=C

set -e

OS_NAME=""
BASE_DIR=$(cd $(dirname $0); pwd)
EMACS_CONFIG_FILE=$HOME/.emacs

package_exists() {
    if which $1 >> /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

check_platform() {
    if package_exists "brew"; then
        OS_NAME="mac"
    elif package_exists "apt-get"; then
        OS_NAME="ubuntu"
    elif package_exists "yum"; then
        OS_NAME="centos"
    fi

    if [ "$OS_NAME" != "" ]; then
        return 0
    else
        return 1
    fi
}

if check_platform; then
	echo "Start to setup workspace configurations for ${OS_NAME} ... .. ."
else
	echo "Unsupported system, only support mac, ubuntun and centos!"
    exit 1
fi

if [ "$OS_NAME" != "mac" ]; then
	echo "Setup fonts ... .. ."
    sudo mkdir -p /usr/share/fonts/custom-fonts
    sudo cp -v fonts/Monaco.ttf /usr/share/fonts/custom-fonts/
    echo "Waiting, flushing font cache..."
    sudo fc-cache -f -v
fi

echo "Setup emacs configurations ... .. ."
cp -f ${BASE_DIR}/emacs-configurations/init.el ${BASE_DIR}/.emacs.local
sed -i -e s:_EMACS_CONFIG_ROOT_PATH_:${BASE_DIR}/emacs-configurations/:g ${BASE_DIR}/.emacs.local
if [ -e $EMACS_CONFIG_FILE ]; then
    rm $EMACS_CONFIG_FILE
fi
ln -sf ${BASE_DIR}/.emacs.local $EMACS_CONFIG_FILE

echo "Success!!"
