FROM golang:latest as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /go/src/github.com/kozo002/save-my-slack
COPY . .
RUN go build cmd/save-my-slack/main.go

# runtime image
FROM alpine
COPY --from=builder /go/src/github.com/kozo002/save-my-slack /app

CMD /app/main $PORT
