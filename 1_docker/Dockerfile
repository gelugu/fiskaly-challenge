FROM golang:1.24-alpine3.20 AS builder

RUN apk --update add ca-certificates

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /build/app .


FROM scratch AS app

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /build/app /app

ENTRYPOINT ["/app"]
