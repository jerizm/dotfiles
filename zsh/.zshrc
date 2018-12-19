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

export HOME_BIN="$HOME/bin"
export PATH="$HOME_BIN:$PATH"
# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi

export XDG_CONFIG_HOME="$HOME/.config"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jerry/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jerry/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jerry/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jerry/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
