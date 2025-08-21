# fnm
FNM_PATH="/Users/jerry/.fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="/Users/jerry/.fnm:$PATH"
    export PATH="/Users/jerry/.npm-global/bin:$PATH"
    eval "$(fnm env --use-on-cd --shell zsh)"
    export NODE_ENV=development
    get-old-packages-from () { fnm exec --using=$2 npm list -g | grep "├──\|└──" | awk '{gsub(/@[0-9.]+/, "", $2); print $2}' | tr '\n' ' ' | sed 's/ $//' }
    fnm-reinstall-packages-from () { npm install -g $(fnm exec --using=$2 npm list -g | grep "├──\|└──" | awk '{gsub(/@[0-9.]+/, "", $2); print $2}' | tr '\n' ' ' | sed 's/ $//') }
fi
