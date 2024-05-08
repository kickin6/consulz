# Use the official Golang image to create a build artifact.
FROM golang:1.18 as builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the Go file
COPY hello.go .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -o hello hello.go

# Start a new stage from scratch
FROM alpine:latest  
WORKDIR /root/

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/hello .

# Run the binary program produced by `go build`
CMD ["./hello"]
