autoload colors zsh/terminfo
colors

precmd() { print "" }

PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# Auto CD
setopt auto_cd

# Typo Correction
setopt correctall
alias git status='nocorrect git status'

# Remap Caps Lock with Ctrl
# use gnome tweaks

# Plugins
if [[ ! -f ~/.antigen.zsh ]]; then
  curl -o ~/.antigen.zsh -sL git.io/antigen
fi
source ~/.antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen apply

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc' ]; then 
  source '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc'; 
fi

# The next line enables shell command completion for gcloud.
#if [ -f '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc' ]; then 
  #source '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc'; 
#fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
  echo 'kubectl completion sourced'
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
