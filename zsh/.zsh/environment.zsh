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

export EDITOR='vim'
export VISUAL='vim'
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
export PATH=$PATH:/usr/local/go/bin:$HOME/Library/Python/2.7/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#aws stuff
export AWS_IAM_USERNAME=jwang && export AWS_IAM_ACCOUNT=061851502621

if [[ "$OSTYPE" = darwin* ]]; then
  export DEVELOPMENT=true
  #mfa stuff move this later
  __mfakey () {
    key=$(oathtool -b --totp $(pass 2fa/"$@"/code))
    echo $key
    echo $key | pbcopy
  }

  alias mfakey=__mfakey

  # generate pw alias
  genpasswd() {
    pwgen -Bs $1 1 |pbcopy |pbpaste; echo “Has been copied to clipboard”
  }
  # awssudo completion
  compctl -g "(`cut -d , -f 1 ~/.aws/awssudo.conf | tail -n +2 | tr '\n' ' '`)" awssudo

fi

{ ssh-add -A; } &>/dev/null

# gdate
if [[ "$OSTYPE" != darwin* ]]; then
  alias gdate=date
fi

