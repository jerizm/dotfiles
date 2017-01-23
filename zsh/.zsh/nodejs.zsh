if [[ -a ~/.nvm/nvm.sh ]]; then
  alias npminstall="rm -rf node_modules &&  npm cache clear && npm cache clean && yarn install"

  alias node_tests="chokidar 'src/**/*.js' 'test/**/*.js' -c 'npm run lint && if [[ {path} =~ ^test.* ]]; then npm test -- {path}; else npm test; fi;'"

  export NVM_DIR="/Users/$(whoami)/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
fi

export NODE_ENV=dev

