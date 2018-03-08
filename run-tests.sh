#!/bin/bash

# any subsequent error will exit
set -e

# don't use dupl and safesql for CI
gometalinter --disable-all --deadline 5m --vendor ./... \
 --enable=deadcode --enable=errcheck --enable=gas \
 --enable=goconst --enable=gocyclo --enable=goimports --enable=golint \
 --enable=gosimple --enable=gotype --enable=gotypex --enable=ineffassign \
 --enable=interfacer --enable=lll --enable=maligned --enable=megacheck \
 --enable=misspell --enable=nakedret --enable=staticcheck \
 --enable=structcheck --enable=unconvert --enable=unparam --enable=unused \
 --enable=varcheck --enable=vet

go test ./... -cover -bench=. -test.benchtime=3s -test.benchmem;