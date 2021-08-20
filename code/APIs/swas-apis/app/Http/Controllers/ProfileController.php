<?php

namespace App\Http\Controllers;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class ProfileController extends Controller
{
    public function addProfile(Request $request){
        $profile=new Profile();
        $profile->userId=$request->userId;
        $profile->age=$request->age;
        $profile->gender=$request->gender;
        $profile->activity=$request->activity;
        $profile->height=$request->height;
        $profile->weight=$request->weight;
        $profile->allergy=$request->allergy;
        $result=$profile->save();
 
        if($result)
        return ['result'=>'data has been saved'];
        else
        return ['result'=>'operation failed'];

    }
    public function getProfile(Request $request){
        $userId=$request->userId;
        $user = DB::table('profiles')->where('userId', $userId)->first();
        return json_encode($user);
    }
    
    public function updateActivity(Request $request){
        $userId=$request->userId;
        $activity=$request->activity;
 
        $profile = Profile::find($userId);
        $profile->activity =$activity;
        $profile->save();
        if($profile)
        return ['status'=>'sucess'];
        else
        return ['status'=>'failure'];


    }
    public function updateHeight(Request $request){
        $userId=$request->userId;
        $height=$request->height;

        $profile = Profile::find($userId);
        $profile->height =$height;
        $profile->save();

        if($profile)
        return ['status'=>'sucess'];
        else
        return ['status'=>'failure'];

    }
    public function updateWeight(Request $request){
        $userId=$request->userId;
        $weight=$request->weight;

        $profile = Profile::find($userId);
        $profile->weight =$weight;
        $profile->save();

        if($profile)
        return ['status'=>'sucess'];
        else
        return ['status'=>'failure'];


    }
    public function updateAge(Request $request){
        $userId=$request->userId;
        $age=$request->age;

        $profile=Profile::find($userId);
        $profile->age=$age;
        $profile->save();

        if($profile)
        return ['status'=>'sucess'];
        else
        return ['status'=>'failure'];

    }
}
