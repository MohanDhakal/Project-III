<?php

namespace App\Http\Controllers;

use App\Models\Meal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;


class MealController extends Controller
{

    public function addMeal(Request $request){

        $response = Http::post('http://localhost:8888/setProfile', [
            'activity' => $request->activity,
            'gender' => $request->gender,
            'preference'=>$request->preference,
            'allergy'=>$request->allergy,
            'BMI'=>$request->BMI,
            'BMR'=>$request->BMR,
        ]);

        $userId=$request->userId;
        $meals=array();
        $meals=json_decode($response,true);
        foreach ($meals as $key => $value) {
            $meal=new Meal();
            $meal->name=$value['name'];
            $meal->userId=$userId;
            $meal->calorie=$value['calorie'];
            $meal->carbs=$value['carbs'];
            $meal->protein=$value['protein'];
            $meal->fat=$value['fat'];
            $meal->warning=$value['warning'];
            $meal->type=json_encode($value['types']);
            $meal->ingredients=json_encode($value['ingredients']);
            $meal->save();
        }        
        return   ['response'=>'okay']; 
    }
    public function getMeal(Request $request){
        $userId=$request->userId;
        $meals = Meal::where('userId',$userId)->orderBy('created_at','desc')->take(3)->get();
        return json_encode($meals,JSON_UNESCAPED_SLASHES);
    }
}
