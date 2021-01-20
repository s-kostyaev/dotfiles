#!/bin/bash

source ~/.profile

PKGS='golang.org/x/tools/gopls
github.com/isacikgoz/tldr
github.com/gohugoio/hugo
golang.org/x/tools/cmd/goimports
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

for pkg in $PKGS; do echo updating $pkg; GO111MODULE=on go get ${pkg}@latest; done
