#!/usr/bin/env zsh

brew=$(which brew)

$brew update
$brew upgrade --yes
$brew cleanup
$brew doctor
