# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jerry/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jerry/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/jerry/.fzf/man* && -d "/Users/jerry/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/jerry/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jerry/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jerry/.fzf/shell/key-bindings.zsh"

