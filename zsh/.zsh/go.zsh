if [ "$(uname)" = "Darwin" ]; then
  export PATH=$PATH:$GOPATH/bin
fi


alias go-cover='go test -cover -test.v=true -test.coverprofile=c.out && sed -i -e "s#.*/\(.*\.go\)#\./\\1#" c.out && go tool cover -html c.out -o coverage.html'



