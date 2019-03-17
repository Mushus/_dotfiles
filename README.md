# dotfiles

my dotfiles

## install

### windows

#### Host PC

Using PowerShell

```
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Mushus/dotfiles/master/windows/setup.ps1'))
```
#### WSL

Using PowerShell

```
bash -c "sudo bash `$(wslpath `"$env:USERPROFILE\dotfiles\windows\wsl\install.sh`") && bash `$(wslpath `"$env:USERPROFILE\dotfiles\windows\wsl\deploy.sh`")"
```

### Linux

TODO: it's not working
```
git clone https://github.com/Mushus/dotfiles.git && cd dotfiles
make init && make install
```

### Mac OS
