# check platform
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='darwin'
fi

if [[ $platform == 'freebsd' || $platform == 'darwin' ]]; then

  # for mac
  # カラフルなll
  alias ll='ls -laG'

elif [[ $platform == 'linux' ]]; then

   # for linux
   # カラフルなll
  alias ll='ls -la --color'

  # 読みやすいps
  alias ps='ps --sort=start_time'

fi

# カラフルなgrep
alias grep='grep --color'

# rm した時に間違わないように
alias rm='rm -i'

# 読みやすいdf
alias df='df -h'

# bashのprefix?を短く見やすくする
export PS1='\[\e[01;36m\]\u@\H\[\e[0;0m\]:\[\e[01;34m\]\W\[\e[0;0m\]$ '


export LANG=ja_JP.UTF-8

# 環境毎の設定は別で管理できるように
test -r ~/.bashrc_env && . ~/.bashrc_env
