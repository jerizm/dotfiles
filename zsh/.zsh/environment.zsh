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

export SUBLIME=subl
export VISUAL=$EDITOR

#aws stuff
export AWS_IAM_USERNAME=jwang && export AWS_IAM_ACCOUNT=061851502621

if which oathtool >/dev/null 2>&1; then
  export DEVELOPMENT=true
  #mfa stuff move this later
  __mfakey () {
    key=$(oathtool -b --totp $(pass 2fa/"$@"/code))
    echo $key
    if [[ "$OSTYPE" = linux* ]]; then
      echo "$key" | xsel -ib
    fi
    if [[ "$OSTYPE" = darwin* ]]; then
      echo $key | pbcopy
    fi
  }

  alias mfakey=__mfakey

  # generate pw alias
  alias passgen='pwgen -Bsy 28 1 | tr -d "\n" | pbcopy | pbpaste'

fi

{ ssh-add -A; } &>/dev/null

kill_pulse() {
  sudo kill $(ps aux | grep '[P]ulse' | awk '{print $2}')
}

# gdate
if [[ "$OSTYPE" != darwin* ]]; then
  alias gdate=date
fi

export DISABLE_UPDATE_PROMPT="true"

if command -v nvim 1>/dev/null 2>&1; then
  alias vim='nvim'
fi

if command -v yay 1>/dev/null 2>&1; then
  alias syu='curl -s https://www.archlinux.org/feeds/news/ | xmllint --xpath //item/title\ \|\ //item/pubDate /dev/stdin | sed -r -e "s:<title>([^<]*?)</title><pubDate>([^<]*?)</pubDate>:\2\t\1\n:g" && yay -Syu'
fi

ssh-add -l | grep -q id_rsa || ssh-add
