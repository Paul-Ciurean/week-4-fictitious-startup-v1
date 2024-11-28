#!/bin/bash

# Update package lists
sudo apt update

# Install nginx
sudo apt install nginx -y

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Replace default welcome page
echo "<!DOCTYPE html>
<html>
<head>
    <title>Welcome To BabyGroot's Website</title>
</head>
<body>
    <h1>Welcome To BabyGroot's Website</h1>
</body>
</html>" | sudo tee /usr/share/nginx/html/index.html > /dev/null
