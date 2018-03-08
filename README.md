# goref

## Pre-requisites

* [go 1.10.0](https://golang.org/dl/)
* [docker](https://www.docker.com/)
* [gometalinter](https://github.com/alecthomas/gometalinter)

## Install

### Install go dep

```bash
go get -u github.com/golang/dep/cmd/dep
```

### Sync deps

```bash
dep ensure
```

### Install gometalinter

```bash
go get -u github.com/alecthomas/gometalinter
gometalinter --install
```

## Tests / linting

```bash
./run-tests.sh
```