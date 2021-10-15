## export and sources
# set PATH to ~/bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH to ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$HOME/.local/bin:$PATH"

export GOPATH="$HOME/.local/share/go" 
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export DENO_INSTALL="/home/sujit/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

#export DOTNET_CLI_TELEMETRY_OPTOUT=1

export TERM="xterm-256color"

export FZF_DEFAULT_COMMAND="find"

source "$HOME/.cargo/env"

source "$HOME/Documents/scripts/env"

#fzf completion
if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/doc/fzf/examples/completion.bash
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

source ~/Downloads/softwares/alacritty/extra/completions/alacritty.bash

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

QT_QPA_PLATFORMTHEME=qt5ct

