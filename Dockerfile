FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git

WORKDIR $GOPATH/src/package/simple-hello-server/
COPY . .

RUN go build -o /go/bin/simple-hello-server simple-hello-server.go

############################

FROM scratch

COPY --from=builder /go/bin/simple-hello-server /bin/simple-hello-server

ENTRYPOINT ["/bin/simple-hello-server"]