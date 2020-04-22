FROM golang:1.13 AS builder

RUN apk update && apk add --no-cache git

WORKDIR $GOPATH/src/package/simple-hello-server/
COPY . .

RUN go build -o /bin/simple-hello-server simple-hello-server.go

############################

FROM golang:1.13

COPY --from=builder /bin/simple-hello-server /bin/simple-hello-server

ENTRYPOINT ["/bin/simple-hello-server"]
