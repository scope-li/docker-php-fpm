FROM php:7.3-fpm
LABEL maintainer="Scope GmbH <info@scope.li>"

# Install tools and libs.
RUN apt-get update && apt-get install -y \
    wget curl unzip git htop nano \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev libzip-dev libicu-dev

# Install php extension.
RUN docker-php-ext-install gd mysqli pdo pdo_mysql zip opcache intl

# Install and enable xdebug.
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install composer and symfony phar.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony
