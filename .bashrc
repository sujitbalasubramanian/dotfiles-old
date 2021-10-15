# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#history
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoredups
export PROMPT_COMMAND='history -a'
HISTSIZE=1000000 
HISTFILESIZE=1000000

# shopt
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# append to the history file, don't overwrite it
shopt -s histappend
shopt -s autocd 

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ( \1)/'; 
}

#PS1='\u@\h:\w\$ '
#PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '
#PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\][\w] \[\033[00m\]\$ '
PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\]\w\[\033[01;33m\]$(parse_git_branch) \[\033[00m\]\$ '
#PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\]\w \[\033[01;33m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "git::( "; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)$(if git rev-parse --git-dir > /dev/null 2>&1; then echo ") "; fi)\[\033[00m\]\$ '
# ➜ ➞ ➔ ➤ 

#colorscript bin
colorscript exec ghosts

## ALIAS

#confrimation to overwrite or delete
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

#color
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ld='ls -la'
alias tree='tree -C'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#apt
alias up='sudo apt update'
alias ug='sudo apt upgrade'
alias upug='sudo apt update && sudo apt upgrade'
alias apti='sudo apt install'
alias aptr='sudo apt remove'
alias aptar='sudo apt remove --autoremove'
alias apts='sudo apt search'

#youtube-dl
alias yta='youtube-dl -x --audio-format'

#shortcut
alias fd='fdfind'
alias bat='batcat --paging=never'

#extra alias
alias ccat='highlight --out-format=ansi --force'

#eye production settings
alias nlight='redshift-gtk -O'
alias knlight='redshift-gtk -x'

