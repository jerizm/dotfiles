#!/usr/bin/env zsh

brew=/usr/local/bin/brew

if command -v pyenv 1>/dev/null 2>&1; then
  pyenv shell 3.6.2
fi

$brew update
$brew upgrade
$brew cleanup
$brew doctor
