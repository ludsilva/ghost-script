#!/bin/bash

### Script para instalar o Nginx, MySQL, Node.JS

# Update
sudo apt-get update && sudo apt-get upgrade -y

# Instalar o Nginx
sudo apt-get install nginx -y

sudo ufw allow 'Nginx Full'

# Instalar o MySQL
sudo apt-get install mysql-server -y

# Instalar o nodejs
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash

## Instalando
sudo apt-get install nodejs -y

### IP Tables
sudo apt-get install iptables-persistent -y 

sudo iptables -I INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT

sudo netfilter-persistent save

### Ghost CLI
sudo npm install ghost-cli@latest -g

## Criar diretório
sudo mkdir -p /var/www/ghost

sudo chown $(whoami):$(whoami) /var/www/ghost

sudo chmod 775 /var/www/ghost

cd /var/www/ghost

ghost install