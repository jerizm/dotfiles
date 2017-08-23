# pyenv
if (( $+commands[pyenv] )) ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  aws() {
    eval "$( command pyenv init - )"
    aws "$@"
  }
  pyenv() {
    eval "$( command pyenv init - )"
    pyenv "$@"
  }
fi

