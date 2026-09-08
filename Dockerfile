FROM ubuntu:24.04

# Update packages and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your HTML page to Nginx's web directory
COPY index.html /var/www/html/index.html

# Nginx listens on port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]