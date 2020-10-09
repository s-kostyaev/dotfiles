#!/bin/bash

source ~/.profile
# github.com/mdempsky/gocode

echo "updating gopls"
GO111MODULE=on go get golang.org/x/tools/gopls@latest
echo "updating tldr"
GO111MODULE=on go get github.com/isacikgoz/tldr@latest
echo "updating hugo"
GO111MODULE=on go get github.com/gohugoio/hugo@latest

PKGS='golang.org/x/tools/cmd/goimports
github.com/josharian/impl
github.com/jstemmer/gotags
github.com/derekparker/delve/cmd/dlv
github.com/posener/complete/gocomplete
github.com/cweill/gotests/...
github.com/davidrjenni/reftools/cmd/fillstruct
github.com/kovetskiy/transline
golang.org/x/tools/cmd/godoc
github.com/fatih/gomodifytags
github.com/google/codesearch/cmd/...
github.com/peco/peco/...
github.com/golang/dep/cmd/dep
github.com/justjanne/powerline-go
honnef.co/go/tools/cmd/staticcheck
'

for pkg in $PKGS; do echo updating $pkg; go get -u $pkg; done
