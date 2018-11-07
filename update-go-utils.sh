#!/bin/bash

# github.com/mdempsky/gocode

PKGS='github.com/github/hub
github.com/seletskiy/go-makepkg
github.com/stamblerre/gocode
github.com/rogpeppe/godef
golang.org/x/tools/cmd/goimports
github.com/josharian/impl
github.com/maruel/panicparse
github.com/zmb3/gogetdoc
github.com/godoctor/godoctor
github.com/jstemmer/gotags
github.com/derekparker/delve/cmd/dlv
github.com/ValeLint/vale
github.com/stapelberg/expanderr
github.com/posener/complete/gocomplete
github.com/sourcegraph/go-langserver
github.com/cweill/gotests/...
github.com/davidrjenni/reftools/...
github.com/kovetskiy/transline
golang.org/x/tools/cmd/godoc
github.com/fatih/gomodifytags
github.com/google/codesearch/cmd/...
github.com/peco/peco/...
github.com/golang/dep/cmd/dep
github.com/justjanne/powerline-go
github.com/golangci/golangci-lint/cmd/golangci-lint
'

for pkg in $PKGS; do echo updating $pkg; go get -u $pkg; done

echo "installing gocomplete"
gocomplete -install -y
