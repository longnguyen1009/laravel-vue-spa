FROM centos:7

RUN yum -y update
RUN yum -y install epel-release

COPY nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y install nginx

COPY server.conf /etc/nginx/conf.d/default.conf

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

#RUN yum-config-manager --enable remi-php81
RUN yum-config-manager --enable remi-php74
RUN yum -y install php
RUN yum -y install php-xml php-common php-soap php-xmlrpc php-mbstring php-json php-gd php-mcrypt php-intl php-cli php-fpm \
                   php-pdo php-zip php-pgsql php-bcmath php-ctype php-openssl

RUN mkdir -p /run/php-fpm
RUN yum -y install python3-pip
RUN pip3 install --upgrade pip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_16.x
RUN yum -y install nodejs
RUN yum install -y npm

RUN pip3 install supervisor
COPY supervisord.conf /etc/supervisord.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN adduser vietis
RUN chown -R vietis:vietis /var/www/html
#RUN chown -R nginx:nginx /var/www/html/storage
#RUN usermod -a -G nginx vietis

# Work direction
WORKDIR /var/www/html

EXPOSE 80
#EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
