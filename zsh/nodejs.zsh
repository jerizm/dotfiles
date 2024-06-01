if [[ -a /usr/local/bin/fnm ]]; then
    alias npminstall="rm -rf node_modules && npm install"

    alias node_tests="chokidar 'handlers/**/*.js' 'lib/**/*.js' 'test/**/*.js' 'handlers/**/*.ts' 'lib/**/*.ts' 'test/**/*.ts' -c 'if [[ {path} =~ ^test.* ]]; then npm test -- {path}; else npm test; fi;' --throttle 500 --debounce 1000"
    export NODE_ENV=dev
    alias node_global="npm ls -g --depth=0 | grep -oP ' \K(.*)(?=@)'"
    # fnm
    export PATH=/home/jerry/.fnm:$PATH
    eval "`fnm env`"
    eval "$(npm completion 2>/dev/null)"
    mkdir ~/.npm-global
    export NODE_OPTIONS=--openssl-legacy-provider
    # npm config set prefix '~/.npm-global'
fi
