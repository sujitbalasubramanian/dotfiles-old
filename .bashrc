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

source ~/Downloads/softwares/alacritty/extra/completions/alacritty.bash
#fzf completion
if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/doc/fzf/examples/completion.bash
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

