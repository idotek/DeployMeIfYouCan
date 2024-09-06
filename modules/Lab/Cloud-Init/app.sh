#!/bin/bash -xe

sudo apt update 
sudo apt install apache2 -y
echo $(cat /etc/hostname) | sudo tee /var/www/html/index.html 