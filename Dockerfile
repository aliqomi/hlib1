# استفاده از image پایه PHP با آپاچی
FROM php:8.2-apache

# تنظیم دایرکتوری کار
WORKDIR /var/www/html

# نصب پیش‌نیازهای سیستم
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_mysql zip

# نصب Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# کپی تمام فایل‌های پروژه (به جز مواردی که در .dockerignore مشخص شده)
COPY . .

# نصب وابستگی‌های PHP
RUN composer install --no-dev --optimize-autoloader

# تنظیم مجوزها
RUN chown -R www-data:www-data /var/www/html/storage
RUN chmod -R 775 storage bootstrap/cache

# پیکربندی آپاچی
COPY .docker/apache.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

# پورت مورد استفاده
EXPOSE 80
