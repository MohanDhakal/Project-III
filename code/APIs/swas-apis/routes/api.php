<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestAPI;
use App\Http\Controllers\DeviceController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/',[DeviceController::class,'index']);
Route::get('show/{id?}',[DeviceController::class,'show']);
Route::get('vehicleByName',[DeviceController::class,'getByName']);

Route::post('store',[DeviceController::class,'store']);
Route::put('update/{id}',[DeviceController::class,'update']);
Route::post('login',[UserController::class,'index']);