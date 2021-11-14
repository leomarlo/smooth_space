FROM php:7.4.3-apache
COPY app /var/www/html/
RUN docker-php-ext-install mysqli pdo pdo_mysql