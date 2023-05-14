FROM php:8.1-fpm-alpine

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

# Install dependencies
RUN install-php-extensions bcmath pdo_mysql mysqli gd exif pcntl zip

# IonCube installation
RUN curl -L -o /tmp/ioncube_loaders_lin_x86-64.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RUN tar zxpf /tmp/ioncube_loaders_lin_x86-64.tar.gz -C /tmp
RUN mv /tmp/ioncube/ioncube_loader_lin_8.1.so $(php -r "echo ini_get('extension_dir');")/ioncube_loader.so
RUN printf "zend_extension=ioncube_loader.so\n" > /usr/local/etc/php/conf.d/ioncube.ini
RUN rm -rf /tmp/ioncube*

# Install composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php-fpm"]

# Expose port 9000 and start php-fpm server
EXPOSE 9000
