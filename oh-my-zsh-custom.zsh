# Auto CD
setopt auto_cd

# Auto start tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Remap Caps Lock with Ctrl
# use gnome tweaks

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc' ]; then 
  source '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc'; 
fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

export GOPATH=~/work/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export EDITOR=vim

# alias vim with nvim
alias vim=$(which nvim)
alias vi=$(which nvim)
alias v=$(which nvim)

alias t=$(which tmuxinator)

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
