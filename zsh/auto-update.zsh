#!/usr/bin/env zsh
# Periodic-update runner shared by the zim/dotfiles/brew auto-updates.
# Each job supplies a precondition (skip entirely if it fails) and an
# upgrade command; _update_check handles the timestamp + lock bookkeeping.

zmodload zsh/datetime
zmodload zsh/system

export ZSH="${ZDOTDIR:-$HOME}/.zim"
export dotfiles="${ZDOTDIR:-$HOME}/dotfiles"
export DISABLE_UPDATE_PROMPT="true"

# _update_check <statefile> <epoch-target> <lockfile> <precondition-fn> <upgrade-fn>
#
# Runs <upgrade-fn> if more than <epoch-target> seconds have passed since the
# last run recorded in <statefile>. Uses zsystem flock (non-blocking) on
# <lockfile> so concurrent shells don't upgrade at the same time; a shell
# that loses the race leaves <statefile> untouched so the next shell retries.
function _update_check() {
  local statefile=$1 epoch_target=$2 lockfile=$3 precondition=$4 upgrade=$5

  $precondition || return 0

  if [[ ! -f $statefile ]]; then
    echo "LAST_EPOCH=$EPOCHSECONDS" >! $statefile
    return 0
  fi

  local LAST_EPOCH
  . $statefile

  if [[ -z "$LAST_EPOCH" ]]; then
    echo "LAST_EPOCH=$EPOCHSECONDS" >! $statefile
    return 0
  fi

  (( EPOCHSECONDS - LAST_EPOCH > epoch_target )) || return 0

  [[ -e $lockfile ]] || : >! $lockfile
  local lockfd
  if zsystem flock -t 0 -f lockfd $lockfile 2>/dev/null; then
    $upgrade
    echo "LAST_EPOCH=$EPOCHSECONDS" >! $statefile
    exec {lockfd}>&-
  fi
}

# --- zim ---
function _precondition_zim() { [[ -w "$ZSH" ]] && whence git >/dev/null }
function _upgrade_zim() { env ZSH=$ZSH zsh $HOME/.zsh/tools/upgrade.sh }

# --- dotfiles ---
function _precondition_dotfiles() { [[ -w "$dotfiles" ]] && whence git >/dev/null }
function _upgrade_dotfiles() { env dotfiles=$dotfiles /bin/sh $HOME/.zsh/tools/upgrade-dotfiles.sh }

# --- brew ---
function _precondition_brew() { whence brew >/dev/null }
function _upgrade_brew() { env BREW=$BREW /bin/sh $HOME/.zsh/tools/brew-upgrade.sh }

_update_check ~/.zsh-update      ${UPDATE_ZSH_SECONDS:-43200}      /tmp/.zsh-update.lock      _precondition_zim      _upgrade_zim
_update_check ~/.dotfiles-update ${UPDATE_DOTFILES_SECONDS:-43200} /tmp/.dotfiles-update.lock _precondition_dotfiles _upgrade_dotfiles
_update_check ~/.brew-update     ${UPDATE_BREW_SECONDS:-43200}     /tmp/.brew-update.lock     _precondition_brew     _upgrade_brew
