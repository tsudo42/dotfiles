#!/usr/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    # misc settings
    if [[ ! -d "$HOME/.dotbackup/misc" ]];then
      command mkdir -p "$HOME/.dotbackup/misc"
    fi
    ## keybindings
    local keybindings_dir=$HOME/'Library/KeyBindings'
    if [[ ! -d "$keybindings_dir" ]];then
      command mkdir -p "$keybindings_dir"
    fi
    local f=$dotdir/misc/DefaultKeyBinding.dict
    if [[ -L "$keybindings_dir/`basename $f`" ]];then
      command rm -f "$keybindings_dir/`basename $f`"
    fi
    if [[ -e "$keybindings_dir/`basename $f`" ]];then
      command mv "$keybindings_dir/`basename $f`" "$HOME/.dotbackup/misc/"
    fi
    command cp $f "$keybindings_dir"
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir
command printf "\033[32;1m Install completed!!!! \033[0m\n"
