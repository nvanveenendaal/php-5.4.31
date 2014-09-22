# Create a default php.ini
mkdir /php/php-5.4.31/etc
cp -a /etc/php.ini /php/php-5.4.31/etc/php.ini

# Set the timezone
timezone=$(grep -oP '(?<=")\w+/\w+' /etc/sysconfig/clock)
sed -i "s#;date.timezone =#date.timezone = $timezone#" /php/php-5.4.31/etc/php.ini

# Register with Plesk
/usr/local/psa/bin/php_handler \
    --add \
    -displayname "5.4.31" \
    -path /php/php-5.4.31/bin/php-cgi \
    -phpini /php/php-5.4.31/etc/php.ini \
    -type fastcgi \
    -id "fastcgi-5.4.31"