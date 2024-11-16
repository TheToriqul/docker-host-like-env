# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid user prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    nginx \
    mysql-server \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Add supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports for services (e.g., 80 for nginx, 3306 for MySQL)
EXPOSE 80 3306

# Start supervisord to run multiple services
CMD ["/usr/bin/supervisord"]
