<?php

namespace App\Http\Controllers;

use App\Models\BgHistory;
use Illuminate\Http\Request;

class BgController extends Controller
{
    public function addBg(Request $request){
        $bg=new BgHistory();
        $bg->value=$request->value;
        $bg->userId=$request->userId;
        $result=$bg->save();
 
        if($result)
        return ['result'=>'data has been saved'];
        else
        return ['result'=>'operation failed'];

    }
}
