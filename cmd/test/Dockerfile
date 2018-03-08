FROM golang:1.10.0 as build

COPY ./ $GOPATH/src/github.com/JohndeSmith/goref

RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR $GOPATH/src/github.com/JohndeSmith/goref
RUN dep ensure

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build -o /goref ./cmd/test/*.go

FROM alpine:3.7
LABEL Maintainer="Vincent Serpoul <vincent@serpoul.com>"

RUN apk add --no-cache ca-certificates apache2-utils sqlite

# https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker/35613430#35613430
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# copy binary into image
COPY --from=build /goref /app/

ENTRYPOINT ["/app/goref"]

# docker build ./ --rm -t test/goref-migrations:$COMMIT_HASH -f ./cmd/test/Dockerfile