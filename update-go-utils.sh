#!/bin/bash

source ~/.profile

PKGS='golang.org/x/tools/gopls
github.com/mostlygeek/llama-swap
github.com/mhersson/mpls
golang.org/x/vuln/cmd/govulncheck
mvdan.cc/gofumpt
github.com/isacikgoz/tldr
github.com/gohugoio/hugo
golang.org/x/tools/cmd/goimports
github.com/josharian/impl
github.com/jstemmer/gotags
github.com/go-delve/delve/cmd/dlv
github.com/posener/complete/gocomplete
github.com/cweill/gotests/...
github.com/kovetskiy/transline
golang.org/x/tools/cmd/godoc
github.com/fatih/gomodifytags
github.com/google/codesearch/cmd/...
github.com/peco/peco/...
github.com/justjanne/powerline-go
honnef.co/go/tools/cmd/staticcheck
github.com/segmentio/golines
github.com/sqls-server/sqls
'

for pkg in $PKGS; do echo updating $pkg; GO111MODULE=on go install ${pkg}@latest; done
