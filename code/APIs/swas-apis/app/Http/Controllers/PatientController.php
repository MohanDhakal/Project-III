<?php

namespace App\Http\Controllers;

use App\Models\Patient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class PatientController extends Controller
{
    function addPatient(Request $request){

        $patient=new Patient();
        $patient->name=$request->name;
        $patient->phone=$request->phone;
        $result=$patient->save();
 
        if($result)
        return ['result'=>'data has been saved'];
        else
        return ['result'=>'operation failed'];

    }
    function getPatient(Request $request){
        $phone=$request->phone;
        $user = DB::table('patients')->where('phone', $phone)->first();
        return json_encode($user);
    }
    
}
