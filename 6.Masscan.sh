#!/bin/bash
git clone https://github.com/offensive-security/masscan-web-ui
apt-get install apache2 php libapache2-mod-php php-xml postgresql php-pgsql
mv masscan-web-ui/* /var/www/html/
rm /var/www/html/index.html
systemctl start apache2
systemctl start postgresql

su - postgres
createuser -P masscan
createdb -T template0 -E UTF-8 -O masscan masscandb
ALTER USER masscan WITH SUPERUSER;

DROP TABLE IF EXISTS data;

cd /var/www/html/includes

vi /var/www/html/config.php
define('DB_DRIVER',         'pgsql');
define('DB_HOST',           '127.0.0.1');
define('DB_USERNAME',   'masscan');
define('DB_PASSWORD',   'changem3');
define('DB_DATABASE',   'masscandb');

\c masscandb
VACUUM data;

vi functions.php

# Comment Out line 14,15 and 16
// $q = "SELECT 1 FROM data";
// $stmt = $db->query($q);
// $tmp = $stmt->fetch($q);

wget https://kali.training/downloads/masscan.xml
php /var/www/html/import.php /root/masscan.xml

# To be reviewed
sudo vi /etc/apache2/sites-enabled/000-default.conf

AuthType Basic
AuthName "Restricted Content"
AuthUserFile /etc/apache2/htpasswd
Require valid-user

htpasswd -c /etc/apache2/htpasswd kali

