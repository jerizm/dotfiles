#!/usr/bin/env zsh

zmodload zsh/datetime
export DISABLE_UPDATE_PROMPT="true"
function _current_epoch() {
  echo $EPOCHSECONDS
}

function _update_brew_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! ~/.brew-update
}

function _upgrade_brew() {
  env BREW=$BREW /bin/sh $HOME/.zsh/tools/brew-upgrade.sh
  # update the brew file
  _update_brew_update
}

epoch_target=$UPDATE_BREW_SECONDS
if [[ -z "$epoch_target" ]]; then
  # Default to old behavior
  epoch_target=43200
fi

# Cancel upgrade if git is unavailable on the system
whence brew >/dev/null || return 0

if [ -f ~/.brew-update ]
then
  . ~/.brew-update

  if [[ -z "$LAST_EPOCH" ]]; then
    _update_brew_update && return 0;
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]
  then
    if [ "$DISABLE_UPDATE_PROMPT" = "true" ]
    then
      _upgrade_brew
    else
      echo "Would you like to check for brew updates? [Y/n]: \c"
      read line
      if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
        _upgrade_brew
      else
        _update_brew_update
      fi
    fi
  fi
else
  # create the brew file
	_update_brew_update
fi
