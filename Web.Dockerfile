FROM php:7.2-apache

RUN docker-php-ext-install mysqli

COPY . /var/www/html

RUN chmod -R 777 /var/www/html/

RUN a2enmod rewrite



