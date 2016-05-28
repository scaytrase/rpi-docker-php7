FROM resin/rpi-raspbian:jessie
MAINTAINER Pavel Batanov <pavel@batanov.me>

RUN echo "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi" > /etc/apt/sources.list.d/raspbian_nonfree.list

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/php7.list
RUN echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu xenial main " >> /etc/apt/sources.list.d/php7.list

RUN gpg --keyserver keyserver.ubuntu.com --recv E5267A6C && gpg --export --armor E5267A6C | apt-key add -

RUN apt-get update
RUN apt-get install nano apt-utils php7.0 php7.0-fpm php7.0-curl php7.0-fpm php7.0-sqlite3 php7.0-json php7.0-cli php7.0-intl php7.0-mcrypt php7.0-xmlrpc php7.0-pgsql php7.0-common php7.0-xml php7.0-zip php7.0-mbstring php7.0-opcache

RUN sed -Ei 's/^listen.*/listen = 9000/' /etc/php/7.0/fpm/pool.d/www.conf

RUN service php7.0-fpm restart

EXPOSE 9000
