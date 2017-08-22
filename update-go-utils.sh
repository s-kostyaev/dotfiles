#!/bin/bash

PKGS='github.com/github/hub
github.com/kisielk/errcheck
github.com/golang/lint/golint
github.com/seletskiy/go-makepkg
github.com/nsf/gocode
github.com/rogpeppe/godef
github.com/dougm/goflymake
github.com/alecthomas/gometalinter
github.com/bradfitz/goimports
github.com/fzipp/gocyclo
github.com/josharian/impl
github.com/maruel/panicparse
github.com/remyoudompheng/go-misc/deadcode
github.com/gordonklaus/ineffassign
github.com/mvdan/interfacer/cmd/interfacer
github.com/opennota/check/cmd/aligncheck
github.com/opennota/check/cmd/structcheck
github.com/opennota/check/cmd/varcheck
golang.org/x/tools/cmd/gotype
github.com/mibk/dupl
github.com/zmb3/gogetdoc
github.com/godoctor/godoctor
github.com/jstemmer/gotags
github.com/derekparker/delve/cmd/dlv
github.com/ValeLint/vale
sourcegraph.com/sqs/goreturns
'

for pkg in $PKGS; do echo updating $pkg; go get -u $pkg; done
