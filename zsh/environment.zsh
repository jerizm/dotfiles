#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$LOGNAME"
    mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'


if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
fi

KEYTIMEOUT=1

setopt RM_STAR_WAIT

export VISUAL=$EDITOR

# gdate
if [[ "$OSTYPE" != darwin* ]]; then
    alias gdate=date
fi
if [[ "$OSTYPE" == darwin* ]]; then
    alias sed=gsed
fi
if which oathtool >/dev/null 2>&1; then
    export DEVELOPMENT=true
    #mfa stuff move this later
    __mfakey () {
        key=$(pass otp "$1")
        echo $key
        if [[ -z "$2" ]]; then
            if [[ "$OSTYPE" = linux* ]]; then
                echo -n "$key" | xclip -selection clipboard
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


compdef _pass __mfakey


export DISABLE_UPDATE_PROMPT="true"

if command -v nvim 1>/dev/null 2>&1; then
    alias vim='nvim'
    export MANPAGER='nvim +Man!'
fi

if command -v maim 1>/dev/null 2>&1; then
    alias screenshot='maim -s | xclip -selection clipboard -t image/png'
fi

if command -v awsume 1>/dev/null 2>&1; then
    alias awsume='. awsume'
fi

ssh-add -l | grep -q id_rsa || ssh-add

if command -v eza 1>/dev/null 2>&1; then
    alias ld='eza -lD'
    alias lf='eza -lf --color=always | grep -v /'
    alias lh='eza -dl .* --group-directories-first'
    alias ll='eza -al --group-directories-first --sort=size'
    alias ls='eza -al --group-directories-first --color=always'
    alias lt='eza -al --sort=modified'
fi
{ ssh-add -A; } &>/dev/null
