if ! command -v -- "fnm" > /dev/null 2>&1; then
    printf "fnm not found\n"
else
    export NODE_ENV=dev
    alias node_global="npm ls -g --depth=0 | grep -oP ' \K(.*)(?=@)'"
    # fnm
    export PATH=/home/jerry/.fnm:$PATH
    eval "`fnm env`"
    eval "$(npm completion 2>/dev/null)"
    export NODE_OPTIONS=--openssl-legacy-provider
    fnm-reinstall-packages-from () { npm install -g $(fnm exec --using=$1 npm list -g | grep "├──\|└──" | awk '{gsub(/@[0-9.]+/, "", $2); print $2}' | tr '\n' ' ' | sed 's/ $//') }
fi
