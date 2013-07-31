# Filename:         ~/dotfiles/bash_aliases
# Last modified:    2013.07.31

alias acc='awk '\''{s+=$1} END {print s}'\'''   # Add up all numbers in a column
alias df='df -h'
alias egrep='egrep --color=auto --binary-files=without-match'
alias fgrep='fgrep --color=auto --binary-files=without-match'
alias findx='find . -type f -print0 | xargs -0 grep --line-number --color=auto --binary-files=without-match'
alias findxpy='find . -type f -and \( -name "*.py" -print0 \) | xargs -0 grep --line-number --color=auto --binary-files=without-match'
alias findxcpp='find . -type f -and \( -name "*.cpp" -print0 -or -name "*.h" -print0 \) | xargs -0 grep --line-number --color=auto --binary-files=without-match'
alias g='grep --line-number --color=auto --binary-files=without-match'
alias gerp='grep --color=auto --binary-files=without-match'
alias grep='grep --color=auto --binary-files=without-match'
alias gv='gvim -geometry 140x85 -O'
alias gvim='gvim -geometry 140x85 -O'
alias ll='ls -lahF --group-directories-first'
alias l='ls --color=auto --group-directories-first'
alias loc='locate -d $HOME/mlocate.db:/var/lib/mlocate/mlocate.db'
alias ls='ls --color=auto --group-directories-first'
alias m='make'
alias mc='make clean'
alias mount='mount | column -t'
alias mv='mv -i'
alias nsg='sudo netstat -anp | grep --line-number --color=auto'
alias psg='ps aux | grep -v grep | grep --line-number --color=auto'
alias rm_nfs='find . -name ".nfs*" -exec rm {} \;'
alias rm_orig='find . -name "*.orig" -exec rm {} \;'
alias sl='ls --color=auto --group-directories-first'
alias udb='updatedb -l 0 -o $HOME/mlocate.db -U $HOME'
alias vi='vim -O'
alias vim='vim -O'
alias vmi='vim -O'

# WFD aliases
alias cda='cd ~/world/worldfin/src/artofwar'
alias cdc='cd ~/world/callbus/src'
alias cdf='cd ~/world/worldfin/src/worldfin/filters'
alias cdk='cd ~/world/kelvin/src/kelvin'
alias cdm='cd ~/world/worldfin/src/markets'
alias cdp='cd ~/world/portal/lib'
# alias cds='cd ~/world/strategy/src'
# alias cdt='cd ~/world/testing/lib/worldtest'
# alias cdw='cd ~/world'
alias cdwf='cd ~/world/worldfin/src/worldfin'


