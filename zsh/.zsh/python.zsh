# pyenv
if (( $+commands[pyenv] )) ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  pyenv() {
    eval "$( command pyenv init - )"
    pyenv "$@"
  }
fi

