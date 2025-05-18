<?php
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisteredUserController;

Route::post('/login', [AuthenticatedSessionController::class, 'store'])
    
    ->name('login');

    Route::post('/register', [RegisteredUserController::class, 'store'])
    
    ->name('login');
    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware('auth')
    ->name('logout');


Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});
