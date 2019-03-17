#!/bin/sh

## Variables
# current directory
DIR=`dirname ${0}`

## Upgrade app
echo "[Upgrade app]"
apt-get update
apt-get upgrade

## Install apps
echo "[Install apps]"
apt-get install -y zsh
apt-get install -y make
apt-get install -y gcc

## Cleanup
echo "[Cleanup]"
apt autoremove -y