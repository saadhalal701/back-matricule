<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Api\OcrResultController;
use App\Http\Controllers\Api\RechargeController;

// Authentication routes
Route::post('/login', [AuthenticatedSessionController::class, 'store'])
    ->name('login');

Route::post('/register', [RegisteredUserController::class, 'store'])
    ->name('register');  // Fixed: Changed from 'login' to 'register'

Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware('auth:sanctum')  // Changed from 'auth' to 'auth:sanctum'
    ->name('logout');

// Authenticated API routes
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    
    Route::get('/ocr-results', [OcrResultController::class, 'indexForAuthenticatedUser']);
    Route::post('/recharger-solde', [RechargeController::class, 'store'])->name('recharge');
    Route::get('/recharges', [RechargeController::class, 'index'])->name('recharges');

});