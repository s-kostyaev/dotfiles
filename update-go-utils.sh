#!/bin/bash

# github.com/mdempsky/gocode

PKGS='github.com/stamblerre/gocode
golang.org/x/tools/cmd/goimports
github.com/josharian/impl
github.com/jstemmer/gotags
github.com/derekparker/delve/cmd/dlv
github.com/ValeLint/vale
github.com/posener/complete/gocomplete
github.com/cweill/gotests/...
github.com/davidrjenni/reftools/...
github.com/kovetskiy/transline
golang.org/x/tools/cmd/godoc
github.com/fatih/gomodifytags
github.com/google/codesearch/cmd/...
github.com/peco/peco/...
github.com/golang/dep/cmd/dep
github.com/justjanne/powerline-go
github.com/isacikgoz/tldr
honnef.co/go/tools/cmd/megacheck
'

for pkg in $PKGS; do echo updating $pkg; go get -u $pkg; done

echo "installing gocomplete"
gocomplete -install -y
