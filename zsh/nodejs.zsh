if [[ -a /usr/local/bin/fnm ]]; then
    alias npminstall="rm -rf node_modules && npm install"

    alias node_tests="chokidar 'handlers/**/*.js' 'lib/**/*.js' 'test/**/*.js' 'handlers/**/*.ts' 'lib/**/*.ts' 'test/**/*.ts' -c 'if [[ {path} =~ ^test.* ]]; then npm test -- {path}; else npm test; fi;' --throttle 500 --debounce 1000"
    export NODE_ENV=dev
    eval "$(fnm env)"
fi
