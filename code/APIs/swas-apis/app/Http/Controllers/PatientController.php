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
        if($result){
            $patient = Patient::where('phone', $request->phone)->first();
            json_encode($patient);
            return $patient;    
        }
        else
        return ['result'=>'operation failed'];

    }
    function getPatient(Request $request){
        $phone=$request->phone;
        $user = DB::table('patients')->where('phone', $phone)->first();
        if($user==null){
            return ['status'=>false];
        }
        return json_encode($user);
    }
    
}
