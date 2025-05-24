FROM wordpress:php8.2-apache

# Install PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libwebp-dev libfreetype6-dev libzip-dev libicu-dev \
    ghostscript imagemagick libmagickwand-dev unzip curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd mysqli zip intl exif bcmath \
    && pecl install imagick && docker-php-ext-enable imagick

# Set Apache mods
RUN a2enmod rewrite expires

# Set working directory
WORKDIR /var/www/html

# Entrypoint and CMD are inherited from wordpress base image
