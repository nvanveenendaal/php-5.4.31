#!/bin/bash

# Make sure you are up to date
yum -y update && yum -y install wget

# Install EPEL repository
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Get us a clean working directory
mkdir /php
cd /php

# Install PHP dependencies
yum -y install gcc make gcc-c++ cpp kernel-headers.x86_64 libxml2-devel openssl-devel \
    bzip2-devel libjpeg-devel libpng-devel freetype-devel openldap-devel postgresql-devel \
    aspell-devel net-snmp-devel libxslt-devel libc-client-devel libicu-devel gmp-devel curl-devel \
    libmcrypt-devel unixODBC-devel pcre-devel sqlite-devel db4-devel enchant-devel libXpm-devel \
    mysql-devel readline-devel libedit-devel recode-devel libtidy-devel libtool-ltdl-devel
    
