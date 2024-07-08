#!/usr/bin/env zsh

brew=$(which brew)

$brew update
$brew upgrade
$brew cleanup
$brew doctor
