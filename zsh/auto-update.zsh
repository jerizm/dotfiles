#!/usr/bin/env zsh

zmodload zsh/datetime

export ZSH="${ZDOTDIR:-$HOME}/.zprezto"
export DISABLE_UPDATE_PROMPT="true"

function _current_epoch() {
  echo $EPOCHSECONDS
}

function _update_zsh_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! ~/.zsh-update
}

function _upgrade_zsh() {
  env ZSH=$ZSH /bin/sh $HOME/.zsh/tools/upgrade.sh
  # update the zsh file
  _update_zsh_update
}

epoch_target=$UPDATE_ZSH_SECONDS
if [[ -z "$epoch_target" ]]; then
  # Default to old behavior
  epoch_target=43200
fi

# Cancel upgrade if the current user doesn't have write permissions for the
# prezto directory.
[[ -w "$ZSH" ]] || return 0

# Cancel upgrade if git is unavailable on the system
whence git >/dev/null || return 0

if [ -f ~/.zsh-update ]
then
  . ~/.zsh-update

  if [[ -z "$LAST_EPOCH" ]]; then
    _update_zsh_update && return 0;
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]
  then
    if [ "$DISABLE_UPDATE_PROMPT" = "true" ]
    then
      _upgrade_zsh
    else
      echo "Would you like to check for zim updates? [Y/n]: \c"
      read line
      if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
        _upgrade_zsh
      else
        _update_zsh_update
      fi
    fi
  fi
else
  # create the zsh file
  _update_zsh_update
fi
