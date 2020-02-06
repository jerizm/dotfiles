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

export PATH="$PATH:$HOME/.rvm/bin:$HOME/.cargo/bin"

source $(which aws)_zsh_completer.sh

