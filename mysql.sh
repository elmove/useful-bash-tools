#!/bin/bash
# Remember to change the user, password and database name in the install sql and create database sections.


echo "-----------------"
echo "Full update"
apt update
apt full-upgrade -y

echo "-----------------"
echo "Install mysql"

echo "mysql-server mysql-server/root_password password yourpasswd" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password yourpasswd" | debconf-set-selections
apt install net-tools mysql-server mysql-client -y 

echo "------------------"
echo "Config socket & restart mysql"

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
systemctl restart mysql.service

echo "------------------"
echo "Create base datos"
mysql -uroot -pwordpress -h localhost -e "CREATE DATABASE yourdatabasename;"
mysql -uroot -pwordpress -h localhost -e "CREATE USER user@accessip IDENTIFIED BY 'yourpasswd'";
mysql -uroot -pwordpress -h localhost -e "GRANT ALL ON yourdatabase.* TO youruser@accesip";


echo "------ FIN ------"
