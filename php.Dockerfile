FROM php:7.4.3-apache
COPY app /var/www/html/
# RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y libicu-dev
RUN docker-php-ext-configure intl
# RUN docker-php-ext-install intl
RUN docker-php-ext-install intl mysqli pdo pdo_mysql