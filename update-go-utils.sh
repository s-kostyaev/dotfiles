#!/bin/bash

PKGS='github.com/github/hub
github.com/kovetskiy/manul
github.com/seletskiy/hastur
github.com/seletskiy/ash
github.com/reconquest/gunter
golang.org/x/tools/cmd/oracle
github.com/svent/sift
github.com/kisielk/errcheck
github.com/golang/lint/golint
github.com/reconquest/marvex
github.com/seletskiy/go-makepkg
github.com/nsf/gocode
github.com/tears-of-noobs/batrak
github.com/rogpeppe/godef
github.com/dougm/goflymake
github.com/alecthomas/gometalinter
github.com/bradfitz/goimports
github.com/fzipp/gocyclo
github.com/josharian/impl'

for pkg in $PKGS; do echo updating $pkg; go get -u $pkg; done
