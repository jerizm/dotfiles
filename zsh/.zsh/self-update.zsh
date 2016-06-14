#!/usr/bin/env zsh

zmodload zsh/datetime

export dotfiles="${ZDOTDIR:-$HOME}/dotfiles"
export DISABLE_UPDATE_PROMPT=true

function _current_epoch() {
  echo $EPOCHSECONDS
}

function _update_dotfiles_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! ~/.dotfiles-update
}

function _upgrade_dotfiles() {
  echo $dotfiles
  env dotfiles=$dotfiles /bin/sh $HOME/.zsh/tools/upgrade-dotfiles.sh
  # update the dotfiles file
  _update_dotfiles_update
}

epoch_target=$UPDATE_dotfiles_SECONDS
if [[ -z "$epoch_target" ]]; then
  # Default to old behavior
  epoch_target=43200
fi

# Cancel upgrade if the current user doesn't have write permissions for the
# dotfiles directory.
[[ -w "$dotfiles" ]] || return 0

# Cancel upgrade if git is unavailable on the system
whence git >/dev/null || return 0

if [ -f ~/.dotfiles-update ]
then
  . ~/.dotfiles-update

  if [[ -z "$LAST_EPOCH" ]]; then
    _update_dotfiles_update && return 0;
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]
  then
    if [ "$DISABLE_UPDATE_PROMPT" = "true" ]
    then
      _upgrade_dotfiles
    else
      echo "Would you like to check for dotfiles updates? [Y/n]: \c"
      read line
      if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
        _upgrade_dotfiles
      else
        _update_dotfiles_update
      fi
    fi
  fi
else
  # create the dotfiles file
  _update_dotfiles_update
fi
