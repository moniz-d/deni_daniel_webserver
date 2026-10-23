#!/bin/bash

PHP_INI="/etc/php.ini"
sudo sed -i 's/;date.timezone =.*/date.timezone = "Europe\/Lisbon"/' $PHP_INI
sudo sed -i 's/date.timezone =.*/date.timezone = "Europe\/Lisbon"/' $PHP_INI
sudo sed -i 's/upload_max_filesize =.*/upload_max_filesize = 20M/' $PHP_INI
sudo sed -i 's/post_max_size =.*/post_max_size = 25M/' $PHP_INI
sudo sed -i 's/memory_limit =.*/memory_limit = 256M/' $PHP_INI
sudo systemctl restart httpd

echo "=============================================================================="
echo "Script 9 executado com sucesso! PHP ajustado."
echo "=============================================================================="
