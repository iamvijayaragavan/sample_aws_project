#!/bin/bash
# Update all packages
yum update -y

# Install Nginx
yum install -y nginx

# Start Nginx service
systemctl start nginx

# Enable Nginx to start on boot
systemctl enable nginx