#!/bin/sh

wget https://download.jetbrains.com/python/pycharm-community-2018.3.1.tar.gz -O /tmp/pycharm-community.tar.gz
tar -xzf /tmp/pycharm-community.tar.gz -C /opt
rm /tmp/pycharm-community.tar.gz
