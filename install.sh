#!/bin/bash

#---------------------------------------------------------------------------------
# Name: install.sh
# Purpose:
#
# Time-stamp: <2019-03-15 10:40:35 Friday by lli>
#
# Author: zhengyu li
# Created: 2014-03-26
#
# Copyright (c) 2014 zhengyu li <lizhengyu419@gmail.com>
#---------------------------------------------------------------------------------

source /etc/profile
export LC_ALL=C

set -e

BASE_DIR=$(cd $(dirname $0); pwd)
EMACS_CONFIG_FILE=$HOME/.emacs

echo "Setup emacs configurations ... .. ."
cp -fv ${BASE_DIR}/emacs-configurations/init.el ${BASE_DIR}/.emacs.local
sed -i -e s:_EMACS_CONFIG_ROOT_PATH_:${BASE_DIR}/emacs-configurations/:g ${BASE_DIR}/.emacs.local
if [ -e $EMACS_CONFIG_FILE ]; then
    rm $EMACS_CONFIG_FILE
fi
ln -sfv ${BASE_DIR}/.emacs.local $EMACS_CONFIG_FILE

echo "Success!!"
