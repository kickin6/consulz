# Use the official Golang image to create a build artifact.
FROM golang:1.18 as builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the Go files
COPY consulz.go ./
COPY consulz_test.go ./

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -o /consulz

# Start a new stage from scratch
FROM alpine:latest  
WORKDIR /root/

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /consulz .

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the binary program produced by `go install`
CMD ["./consulz"]
