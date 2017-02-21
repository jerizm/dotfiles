#█▓▒░ load configs
for config (~/.zsh/*.zsh) source $config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if hash awless 2>/dev/null; then
  source <(awless completion zsh)
fi

