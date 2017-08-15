#!/bin/zsh

brew=/usr/local/bin/brew

if (( $+commands[pyenv] )) ; then
  pyenv local system
fi

$brew update
$brew upgrade
$brew cleanup
$brew doctor
