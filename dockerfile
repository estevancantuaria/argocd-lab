FROM golang:1.23.4-alpine AS builder

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o server main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
CMD ["./server"]