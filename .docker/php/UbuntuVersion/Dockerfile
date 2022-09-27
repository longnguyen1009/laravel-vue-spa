FROM ubuntu:20.04

RUN apt-get update
#RUN apt-get -y install epel-release

COPY ../nginx.repo /etc/yum.repos.d/nginx.repo

RUN apt install -y nginx php-fpm supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

COPY ../server.conf /etc/nginx/conf.d/default.conf

#RUN #apt -y install software-properties-common
#RUN #add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y curl

RUN apt-get -y install php7.4

RUN apt-get install -y php-cli php-json php-common php-pgsql  \
    php-zip php-gd php-mbstring  \
    php-curl php-xml php-bcmath  \
    php-soap php-xmlrpc php-intl  \
    php-fpm php-pdo php-ctype

RUN mkdir -p /run/php-fpm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_16.x
RUN apt-get install -y nodejs
RUN apt-get install -y npm

COPY ../supervisord.conf /etc/supervisord.conf

COPY ../entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN adduser vietis
RUN chown -R vietis:vietis /var/www/html

# Work direction
WORKDIR /var/www/html

EXPOSE 80
#EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

ENTRYPOINT ["/entrypoint.sh"]
