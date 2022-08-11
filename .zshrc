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

# colorful manual
type less &>/dev/null && export MANPAGER='less -R'
_man(){
    env LESS_TERMCAP_mb=$(tput bold; tput setaf 2) \
        LESS_TERMCAP_md=$(tput bold; tput setaf 6) \
        LESS_TERMCAP_me=$(tput sgr0) \
        LESS_TERMCAP_so=$(tput bold; tput setaf 7; tput setab 4) \
        LESS_TERMCAP_se=$(tput rmso; tput sgr0) \
        LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) \
        LESS_TERMCAP_ue=$(tput rmul; tput sgr0) \
        LESS_TERMCAP_mr=$(tput rev) \
        LESS_TERMCAP_mh=$(tput dim) \
        LESS_TERMCAP_ZN=$(tput ssubm) \
        LESS_TERMCAP_ZV=$(tput rsubm) \
        LESS_TERMCAP_ZO=$(tput ssupm) \
        LESS_TERMCAP_ZW=$(tput rsupm) \
        GROFF_NO_SGR=1 \
        man "$@"
}
alias man="_man"

# texlive pathes
#export MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man
export INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info
export PATH=/usr/local/texlive/2022/bin/universal-darwin:$PATH

# starship
eval "$(starship init zsh)"

# anyenv
eval "$(anyenv init -)"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/tsudo/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
