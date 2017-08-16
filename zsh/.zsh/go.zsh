if (( $+commands[go] )) ; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
  alias go-cover='go test -cover -test.v=true -test.coverprofile=coverage.out && sed -i -e "s#.*/\(.*\.go\)#\./\\1#" coverage.out && go tool cover -html coverage.out -o coverage.html'
fi
