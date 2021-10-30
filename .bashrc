# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# shopt
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend   # append to the history file, don't overwrite it
shopt -s autocd 

# set vi mode in bash
set -o vi

#history
HISTCONTROL=ignoredups # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=10000000 
HISTFILESIZE=10000000
HISTFILE=~/.history
export PROMPT_COMMAND='history -a' # appends history line by line in history file

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ( \1)/'; 
}

# PS1='\u@\h:\w \$ '
#PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '
#PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\][\w] \[\033[00m\]\$ '
PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\]\w\[\033[01;33m\]$(parse_git_branch) \[\033[00m\]\$ '
# PS1='\[\033[01;34m\]\u \[\033[01;32m\]➜ \[\033[01;36m\]\w \[\033[01;33m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "git::( "; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)$(if git rev-parse --git-dir > /dev/null 2>&1; then echo ") "; fi)\[\033[00m\]\$ '
# ➜ ➞ ➔ ➤ 

#alacritty completion
source ~/Downloads/softwares/alacritty/extra/completions/alacritty.bash

#fzf completion
if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/doc/fzf/examples/completion.bash
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

#shell alias
source ~/.config/shell/alias

#colorscript bin
colorscript exec ghosts
