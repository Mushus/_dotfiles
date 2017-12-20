# カラフルなll
alias ll='ls -al --color=auto'

# カラフルなgrep
alias grep='grep --color'

# rm した時に間違わないように
alias rm='rm -i'

# 読みやすいdf
alias df='df -h'

# 読みやすいps
alias ps='ps --sort=start_time'

# bashのprefix?を短く見やすくする
export PS1='\[\e[0;36m\]\u@\H\[\e[0;0m\]:\[\e[0;34m\]\W\[\e[0;0m\]$ '
