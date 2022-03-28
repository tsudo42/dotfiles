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
    # git setting files
    for f in $dotdir/git/.??*; do
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup/"
      fi
      command ln -snf $f $HOME
    done
    # vscode setting files
    local vscode_setting_dir=$HOME/'Library/Application Support/Code/User'
    if [[ ! -d "$vscode_setting_dir" ]];then
      command mkdir -p "$vscode_setting_dir"
    fi
    if [[ ! -d "$HOME/.dotbackup/vscode" ]];then
      command mkdir -p "$HOME/.dotbackup/vscode"
    fi
    for f in $dotdir/vscode/???*; do
      if [[ -L "$vscode_setting_dir/`basename $f`" ]];then
        command rm -f "$vscode_setting_dir/`basename $f`"
      fi
      if [[ -e "$vscode_setting_dir/`basename $f`" ]];then
        command mv "$vscode_setting_dir/`basename $f`" "$HOME/.dotbackup/vscode/"
      fi
      command ln -snf $f "$vscode_setting_dir"
    done
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
