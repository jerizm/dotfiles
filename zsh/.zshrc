PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>$HOME/tmp/startlog.$$
    setopt xtrace prompt_subst
fi
#█▓▒░ load configs
for config (~/.zsh/*.zsh) source $config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (( $+commands[awsless] )) ; then
  source <(awless completion zsh)
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi
