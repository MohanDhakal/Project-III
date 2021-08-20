<?php

use App\Http\Controllers\BgController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DeviceController;
use App\Http\Controllers\MealController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\ProfileController;
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

Route::post('/addPatient',[PatientController::class,'addPatient']);
Route::get('/getPatient',[PatientController::class,'getPatient']);


Route::post('/addProfile',[ProfileController::class,'addProfile']);
Route::get('/getProfile',[ProfileController::class,'getProfile']);
Route::put('/updateAge',[ProfileController::class,'updateAge']);
Route::put('/updateHeight',[ProfileController::class,'updateHeight']);
Route::put('/updateWeight',[ProfileController::class,'updateWeight']);
Route::put('/updateActivity',[ProfileController::class,'updateActivity']);




Route::post('/addBg',[BgController::class,'addBg']);
Route::post('/addMeal',[MealController::class,'addMeal']);

//send user id as query parameters.
Route::get('/getMeal',[MealController::class,'getMeal']);

