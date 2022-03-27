export LANG=en_US.UTF-8

# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# delete the duplicate history
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# auto-complete
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

## auto-complete ignores case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## pack auto-complete lists
setopt list_packed

## colorful auto-complete
autoload colors
zstyle ':completion:*' list-colors ''

# auto-correction
setopt correct

# silent mode
setopt no_beep

# directory stack
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# starship
eval "$(starship init zsh)"

# anyenv
eval "$(anyenv init -)"
