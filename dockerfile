# Use Ubuntu as the base image
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y python3

# Download and install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set the PORT environment variable
ENV PORT=10000

# Expose the specified port
EXPOSE $PORT

# Start code-server when the container starts
CMD ["code-server", "--bind-addr", "0.0.0.0:$PORT", "."]
