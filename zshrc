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
setxkbmap -option ctrl:nocaps

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
if [ -f '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc' ]; then 
  source '/home/giovanni/Downloads/google-cloud-sdk-198.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc'; 
fi

export GOPATH=~/work/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# alias vim with nvim
alias vim=$(which nvim)
alias vi=$(which nvim)

