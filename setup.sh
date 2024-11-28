#!/bin/bash

sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo sed -i 's/Welcome to nginx/Welcome To BabyGroot's website/g' /usr/share/nginx/html/index.html
sudo systemctl restart nginx

