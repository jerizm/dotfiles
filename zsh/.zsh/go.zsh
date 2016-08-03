if [ "$(uname)" = "Darwin" ]; then
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOPATH/bin
fi
