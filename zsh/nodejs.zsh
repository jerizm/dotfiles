# fnm
FNM_PATH="/Users/jerry/.fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="/Users/jerry/.fnm:$PATH"
    export PATH="/Users/jerry/.npm-global/bin:$PATH"
    eval "$(fnm env --use-on-cd --shell zsh)"
    export NODE_ENV=development
    export NODE_OPTIONS=--openssl-legacy-provider
fi
