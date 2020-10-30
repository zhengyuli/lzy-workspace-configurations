#!/bin/bash

#---------------------------------------------------------------------------------
# Name: install.sh
# Purpose: Emacs configurations setup script
#
# Time-stamp: <2020-10-30 10:34:53 Friday by lizhengyu>
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
cp -fv ${BASE_DIR}/init.el ${BASE_DIR}/.emacs.local

if [[ "$OSTYPE" == "darwin"* ]]; then
	sed -i '' s:_EMACS_CONFIG_ROOT_PATH_:${BASE_DIR}/:g ${BASE_DIR}/.emacs.local
else
	sed -i s:_EMACS_CONFIG_ROOT_PATH_:${BASE_DIR}/:g ${BASE_DIR}/.emacs.local
fi

if [ -e $EMACS_CONFIG_FILE ]; then
    rm $EMACS_CONFIG_FILE
fi
ln -sfv ${BASE_DIR}/.emacs.local $EMACS_CONFIG_FILE

echo "Success!!"
