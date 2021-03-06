# Download PHP
wget http://nl1.php.net/distributions/php-5.4.31.tar.gz -O /php/php-5.4.31.tar.gz

# Extract PHP
tar xzvf /php/php-5.4.31.tar.gz

# Move to unpacked folder
cd /php/php-5.4.31

# Configure PHP build script
./configure \
    --with-libdir=lib64 \
    --cache-file=./config.cache \
    --prefix=/php/php-5.4.31 \
    --with-config-file-path=/php/php-5.4.31/etc \
    --disable-debug \
    --with-pic \
    --disable-rpath \
    --with-bz2 \
    --with-curl \
    --with-freetype-dir=/php/php-5.4.31 \
    --with-png-dir=/php/php-5.4.31 \
    --enable-gd-native-ttf \
    --without-gdbm \
    --with-gettext \
    --with-gmp \
    --with-iconv \
    --with-jpeg-dir=/php/php-5.4.31 \
    --with-openssl \
    --with-pspell \
    --with-pcre-regex \
    --with-zlib \
    --enable-exif \
    --enable-ftp \
    --enable-sockets \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-sysvmsg \
    --enable-wddx \
    --with-kerberos \
    --with-unixODBC=/usr \
    --enable-shmop \
    --enable-calendar \
    --with-libxml-dir=/php/php-5.4.31 \
    --enable-pcntl \
    --with-imap \
    --with-imap-ssl \
    --enable-mbstring \
    --enable-mbregex \
    --with-gd \
    --enable-bcmath \
    --with-xmlrpc \
    --with-ldap \
    --with-ldap-sasl \
    --with-mysql=/usr \
    --with-mysqli \
    --with-snmp \
    --enable-soap \
    --with-xsl \
    --enable-xmlreader \
    --enable-xmlwriter \
    --enable-pdo \
    --with-pdo-mysql \
    --with-pear=/php/php-5.4.31/pear \
    --with-mcrypt \
    --without-pdo-sqlite \
    --with-config-file-scan-dir=/php/php-5.4.31/php.d \
    --without-sqlite3 \
    --enable-intl
    
# Build & Install
make && make install

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