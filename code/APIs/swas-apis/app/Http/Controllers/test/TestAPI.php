<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestAPI extends Controller
{
    function getData(){
        return ['name'=>'mohan','email'=>'mohan@gmail.com','phone'=>'98756567897'];
    }
}
