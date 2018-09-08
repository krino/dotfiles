autoload colors zsh/terminfo
colors

precmd() { print "" }

PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# Auto start tmux
if [ "$TMUX" = "" ]; then tmux; fi

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
