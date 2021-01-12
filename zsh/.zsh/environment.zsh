#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
/usr/local/{bin,sbin}
$path
)

export SPACESHIP_AWS_SHOW=true
export ZSH="${ZDOTDIR:-$HOME}/.zprezto"

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# autoloads
autoload -U zmv

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

KEYTIMEOUT=1

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

export VISUAL=$EDITOR

if which oathtool >/dev/null 2>&1; then
  export DEVELOPMENT=true
  #mfa stuff move this later
  __mfakey () {
    key=$(oathtool -b --totp $(pass "$1"))
    echo $key
    if [[ -z "$2" ]]; then
      if [[ "$OSTYPE" = linux* ]]; then
        echo -n "$key" | wl-copy
      fi
      if [[ "$OSTYPE" = darwin* ]]; then
        echo $key | pbcopy
      fi
    fi
  }

  alias mfakey=__mfakey

  # generate pw alias
  alias passgen='pwgen -Bsy 28 1 | tr -d "\n" | pbcopy | pbpaste'

fi

{ ssh-add -A; } &>/dev/null

compdef _pass __mfakey

# gdate
if [[ "$OSTYPE" != darwin* ]]; then
  alias gdate=date
fi

export DISABLE_UPDATE_PROMPT="true"

if command -v nvim 1>/dev/null 2>&1; then
  alias vim='nvim'
  export MANPAGER='nvim +Man!'
fi

if command -v yay 1>/dev/null 2>&1; then
  alias syu='curl -L -s https://www.archlinux.org/feeds/news/ | xmllint --xpath //item/title\ \|\ //item/pubDate /dev/stdin | sed -r -e "s:<.*>([^<]*?)</.*>:\1:g" && yay -Syu'
fi

if command -v maim 1>/dev/null 2>&1; then
  alias screenshot='maim -s | xclip -selection clipboard -t image/png'
fi

if command -v awsume 1>/dev/null 2>&1; then
    alias awsume='. awsume'
fi

ssh-add -l | grep -q id_rsa || ssh-add

gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize \> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm -f out-static*.png
    else
      ffmpeg -i $1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}
alias ssh='TERM=xterm-256color ssh'

if (( $+commands[aws] )); then
    source $(which aws)_zsh_completer.sh
fi
