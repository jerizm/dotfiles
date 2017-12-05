if [[ -a ~/.nvm/nvm.sh ]]; then
  alias npminstall="rm -rf node_modules && npm install"

  alias node_tests="chokidar 'src/**/*.js' 'test/**/*.js' -c 'npm run lint && if [[ {path} =~ ^test.* ]]; then npm test -- {path}; else npm test; fi;' --throttle 500 --debounce 1000"

  export NVM_DIR="$HOME/.nvm"
  nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
    nvm "$@"
  }

  npm() {
    unset -f npm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm
    npm "$@"
  }
fi

export NODE_ENV=dev

# check for .nvmrc and use
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

