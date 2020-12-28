FROM php:7.4-fpm


RUN apt-get update && apt-get install -y \
    curl \
    g++ \
    git \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libonig-dev\
    sudo \
    unzip \
    zip \
    libpq-dev \
    libzip-dev \
    zlib1g-dev \
    libwebp-dev \
    libxpm-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
    #   --with-png=/usr/include/ # No longer necessary as of 7.4; https://github.com/docker-library/php/pull/910#issuecomment-559383597
      --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-enable gd

RUN rm -rf /tmp/*

RUN docker-php-ext-install \
    bcmath \
    bz2 \
    calendar \
    iconv \
    intl \
    opcache \
    pdo_mysql \
    zip\
    mbstring 
