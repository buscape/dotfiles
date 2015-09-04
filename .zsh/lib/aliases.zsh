# Simplest job-logger, usage: now Working on Feature X
now() {
    echo $(date "+%Y-%m-%d %H:%M:%S") - "$@" >> $HOME/Documents/joberfassung.txt
}

boottime() {
  sysctl -a|grep kern.boottime
}

waketime() {
    syslog|grep DisplayDidWake| grep "$(date +"%b")\s$(date +"%e")" | head -n 1
}

waketimes() {
    syslog|grep DisplayDidWake
}

alias server='http-server -p 8000 && open http://localhost:8000'
alias fixdesc='ulimit -n 10240'
alias week="date +%V"

alias ..="cd .."
alias ...='cd ../..'
alias ll='ls -la'
alias lh='ls -lah'

alias ls="ls -G" # list
alias la="ls -Ga" # list all, includes dot files
alias ll="ls -Gl" # long list, excludes dot files
alias lla="ls -Gla" # long list all, includes dot files

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

# Get readable list of network IPs
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias flush="dscacheutil -flushcache" # Flush DNS cache

alias gzip="gzip -9n" # set strongest compression level as ‘default’ for gzip
alias ping="ping -c 5" # ping 5 times ‘by default’

alias redo='sudo !!' # redo as sudo