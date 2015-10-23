#!/bin/bash

PKGS='github.com/github/hub
github.com/kovetskiy/manul
github.com/seletskiy/hastur
github.com/seletskiy/ash
git.rn/devops/gunter
golang.org/x/tools/cmd/oracle
github.com/svent/sift
github.com/kisielk/errcheck
github.com/golang/lint/golint
github.com/reconquest/marvex
github.com/seletskiy/go-makepkg
github.com/nsf/gocode
github.com/tears-of-noobs/batrak
github.com/rogpeppe/godef'

for pkg in $PKGS; do echo updating $pkg; go get -u $pkg; done
