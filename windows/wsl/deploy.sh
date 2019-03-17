#!/bin/sh

## Variables
# current directory
DIR=`dirname ${0}`

## Set up zsh
# Making zsh the default shell
echo "[zsh as a default shell]"
chsh -s $(which zsh)
# Make .zshrc
if [ -e ~/.zshrc ]; then
    rm -f ~/.zshrc
fi
ln -s $DIR/.zshrc ~/.zshrc

## Install Zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# zcompinit で警告が出るため雑にパーミッションを絞る
chmod -R 755 ~/.zplug
