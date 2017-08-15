#█▓▒░ load configs
for config (~/.zsh/*.zsh) source $config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (( $+commands[awsless] )) ; then
  source <(awless completion zsh)
fi

