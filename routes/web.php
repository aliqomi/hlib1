<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return ('بسم الله الرحمن الرحیم به نام خدا');
});
Route::get('/health', function() {
    return response()->json([
        'status' => 'ok',
        'php' => phpversion(),
        'extensions' => get_loaded_extensions()
    ]);
});
