#!/bin/bash
# دستورات پیش از دپلوی
php artisan config:clear
php artisan cache:clear
php artisan optimize
composer install --no-dev --optimize-autoloader
npm install && npm run build
