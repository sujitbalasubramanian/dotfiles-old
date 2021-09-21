# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export TERM="xterm-256color"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoredups

#infinite history
HISTSIZE=-1 HISTFILESIZE=-1

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

#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\][\w] \[\033[00m\]\$ '
PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\]\w\[\033[01;33m\]$(parse_git_branch) \[\033[00m\]\$ '
#PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\]\w \[\033[01;33m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo " "; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)$(if git rev-parse --git-dir > /dev/null 2>&1; then echo " "; fi)\[\033[00m\]\$ '
# ➜ ➞ ➔ ➤ 

if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/doc/fzf/examples/completion.bash
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

## ALIAS
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

#fzf
alias fzfe='vim $(fzf --preview "highlight --out-format=ansi --force {}")'
alias fzfo='xdg-open $(find -print | fzf --preview "highlight --out-format=ansi --force {}")'
alias fzfowd='xdg-open $(find -printf "%p %TY-%Tm-%Td %TH:%TM \n" | fzf --preview "highlight --out-format=ansi --force {1}" | awk "{print $1}")'

#shortcut
alias fd='fdfind'
alias bat='batcat'

#extra alias
alias ccat='highlight --out-format=ansi --force'

#eye production settings
alias nlight3='redshift-gtk -O 3000'
alias nlight35='redshift-gtk -O 3500'
alias nlight4='redshift-gtk -O 4000'
alias nlight45='redshift-gtk -O 4500'
alias nlight5='redshift-gtk -O 5000'
alias knlight='redshift-gtk -x'

