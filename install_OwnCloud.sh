# dependencies
apt-get install apache2 mariadb-server libapache2-mod-php5
apt-get install php5-gd php5-json php5-mysql php5-curl
apt-get install php5-intl php5-mcrypt php5-imagick

# download server
wget https://download.owncloud.org/community/owncloud-9.1.0.tar.bz2
md5sum owncloud-9.1.0.tar.bz2
tar -xjf owncloud-x.y.z.tar.bz2

# copy to web server
cp -r owncloud /var/www/

# see http://localhost/owncloud