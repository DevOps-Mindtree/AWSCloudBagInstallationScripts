/usr/bin/apt-get update -y
wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
dpkg -i mysql-apt-config_0.6.0-1_all.deb
/usr/bin/apt-get update -y
export DEBIAN_FRONTEND=noninteractive
echo mysql-community-server mysql-server/root_password password welcome123 | debconf-set-selections 
echo mysql-community-server mysql-server/root_password_again password welcome123 | debconf-set-selections 
apt-get install mysql-server -y
service mysql start
