FROM php:8.1-apache

RUN apt-get update && apt-get install -y  \
    libfreetype6-dev \
    libjpeg-dev \
    libpng-dev \
    libwebp-dev \
    --no-install-recommends \
    && docker-php-ext-enable opcache \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install mysqli -j$(nproc) gd \
    && docker-php-ext-enable mysqli \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*