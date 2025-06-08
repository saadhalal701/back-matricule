<?php

use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\StationController;
use App\Http\Controllers\Api\CameraController;
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
    ->name('register');  

Route::post('/ajouter_admin', [AdminController::class, 'ajouteradmin']) ->name('ajouter_admin');  

Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware('auth:sanctum')  
    ->name('logout');

Route::get('/users', [AdminController::class, 'users']);

Route::post('/stations', [StationController::class, 'store']);

Route::get('/cameras', [AdminController::class, 'cameras']);

Route::post('/cameras', [CameraController::class, 'store']);


Route::get('/stations', [AdminController::class, 'stations']);


Route::get('/rechercher-camera/{query}', [AdminController::class, 'rechercher_camera']);


Route::get('/rechercher-station/{query}', [AdminController::class, 'rechercher_station']);


Route::get('/rechercher-user/{query}', [AdminController::class, 'rechercher_user']);
Route::get('/ocr-results', [AdminController::class, 'adminHistorique']);
Route::middleware('auth:sanctum')->get('/user/paiements', [AuthenticatedSessionController::class, 'showpaiement']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/recharger-solde', [RechargeController::class, 'store'])->name('recharge');
    Route::get('/recharges', [RechargeController::class, 'index'])->name('recharges');

});