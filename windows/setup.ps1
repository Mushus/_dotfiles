## Set up variables

# dotfiles directory
Set-Variable -Name path_dotfiles -Value $env:USERPROFILE\dotfiles -Option Constant
# dotfiles temporary directory
Set-Variable -Name path_dotfiles_tmp -Value $path_dotfiles\windows\tmp -Option Constant
# dotfiles external lib directory
Set-Variable -Name path_dotfiles_scripts -Value $path_dotfiles\windows\scripts
# dotfiles Add-Font script
Set-Variable -Name path_dotfiles_fonts -Value $path_dotfiles_scripts\Fonts.ps1
# vscode user directory
Set-Variable -Name path_code_user -Value $env:USERPROFILE\AppData\Roaming\Code\User -Option Constant
# vscode settings.json path
Set-Variable -Name path_code_setting_json -Value $code_user\settings.json -Option Constant

## Uninstall default apps
# Skype
Get-AppxPackage *skypeapp* | Remove-AppxPackage

## Install Chocorately

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y googlechrome
choco install -y firefox
choco install -y git
choco install -y golang
choco install -y msys2
choco install -y vscode
choco install -y wsltty
choco install -y 7zip
# msys2があると mingw は不要
# choco install -y mingw
choco install -y googlejapaneseinput

## Update Windows Settings

## 登録されている拡張子は表示しない
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name HideFileExt -value 0
## 隠しファイルを表示する
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name Hidden -value 1
## タスクバーのコルタナを表示しない
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -name SearchboxTaskbarMode -value 0
## スタート画面を全画面表示
# 見つからなかった
## WSL を使用可能な状態に設定する
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

## environment settings

## Checkout dotfiles
if (-not(Test-Path $path_dotfiles)) {
    git clone https://github.com/Mushus/dotfiles.git $path_dotfiles
}

## Install VSCode Extension

## Edit Inteface
code --install-extension akamud.vscode-theme-onedark
code --install-extension gruntfuggly.activitusbar
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension ms-ceintl.vscode-language-pack-ja
## Editor Highter
code --install-extension shardulm94.trailing-spaces
code --install-extension coenraads.bracket-pair-colorizer
code --install-extension wayou.vscode-todo-highlight
## Input Support
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
## Features
code --install-extension formulahendry.terminal
code --install-extension editorconfig.editorconfig

## Create Simlink settings.json
If (-not(Test-Path $path_code_user)) {
    New-Item $path_code_user -ItemType Directory
}
If (Test-Path $path_code_setting_json) {
    Remove-Item $path_code_setting_json
}
New-Item -Type SymbolicLink -Path $path_code_setting_json -Value $path_dotfiles\windows\vscode\settings.json

## Install fonts

powershell $path_dotfiles_fonts

## Install scoop
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')
# Ready to use extra bucket
scoop bucket add extras
# Install concfg
scoop install concfg


## Configure Terminal
concfg import https://raw.githubusercontent.com/lukesampson/concfg/master/presets/onedark.json

