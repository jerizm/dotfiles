if (( $+commands[go] )) ; then
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOBIN
  alias go-cover='go test -cover -test.v=true -test.coverprofile=coverage.out && sed -i -e "s#.*/\(.*\.go\)#\./\\1#" coverage.out && go tool cover -html coverage.out -o coverage.html'
fi
