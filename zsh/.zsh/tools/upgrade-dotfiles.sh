#!/usr/bin/env zsh

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
  ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

printf "${BLUE}%s${NORMAL}\n" "Updating dotfiles"
cd "$dotfiles"
echo "updating $dotfiles"
if git pull && git submodule update --init --recursive
then
  printf "${BLUE}%s\n" "Hooray! dotfiles has been updated and/or is at the current version."
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
fi

if which tput >/dev/null 2>&1; then
  printf "${BLUE}%s${NORMAL}\n" "Updating pass"
  echo "updating pass"
  if pass git pull
  then
    printf "${BLUE}%s\n" "Hooray! pass has been updated."
  else
    printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
  fi
fi
