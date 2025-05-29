<?php

use Illuminate\Support\Facades\Route;

Route::get('/', [App\Http\Controllers\FrontController::class, 'pdf_view'])->name('pdf_view');

Route::get('/download/{id}', [App\Http\Controllers\FrontController::class, 'download'])->name('pdf_download');

Route::group(['middleware'=>'auth','role:Super Admin|Admin', 'prefix'=>'backend', 'as' => 'backend.'], function() {
    Route::get('/',[App\Http\Controllers\Admin\DashboardController::class, 'dashboard'])->name('dashboard');
    Route::resource('pdfs', App\Http\Controllers\Admin\PdfController::class);
});
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
