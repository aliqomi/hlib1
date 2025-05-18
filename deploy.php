<?php
namespace Deployer;

require 'recipe/laravel.php';

// تنظیمات پروژه
set('application', 'hlib');
set('repository', 'https://github.com/aliqomi/hlib.git');
set('git_tty', true);

// تنظیمات سرور
host('hlib.ir')
    ->set('remote_user', 'username')
    ->set('deploy_path', '/home/username/public_html/hlib.ir');
