# compile app
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -mod=vendor -o /app/hello main.go

# build app image
FROM scratch

# Copy our static executable.
COPY --from=builder /app/hello /app/hello

# Run the hello binary.
ENTRYPOINT ["/app/hello"]
