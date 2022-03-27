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

# anyenv
eval "$(anyenv init -)"

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# prompt

#PROMPT='
#[%B%F{red}%n@%m%f%b:%F{green}%c%f:%F{cyan}%?%f]%F{cyan}$vcs_info_msg_0_%f
#%F{yellow}$%f '

local prompt_hostname="%F{082}%B%n%b%f"
local prompt_location="%F{081}%B%~%b%f"
local prompt_mark="%B%F{208}%(!,#,$) %f%b"
local status_code="%(?,,%F{208}:%f%B%F{red}%?%f%b)"
local number_of_jobs="%(1j.%F{208}:%f%F{226}%B%j%b%f.)"

PROMPT="
[${prompt_location}%B"'$vcs_info_msg_0_'"%b${number_of_jobs}${status_code}]
${prompt_mark}"
