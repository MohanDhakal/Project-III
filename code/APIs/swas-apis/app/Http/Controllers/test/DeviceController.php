<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Device;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class DeviceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Device::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $device=new Device();
        $device->name=$request->name;
        $device->os=$request->os;
        $device->chipset=$request->chipset;
        $device->camera=$request->camera;
        $result=$device->save();
     //validate the data with some validation technique
        if($result)
        return ['result'=>'data has been saved'];
        else
        return ['result'=>'operation faild'];
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id=null)
    {
        return $id?Device::find($id):Device::all();
        //
    }
    public function getByName(Request $request){
        // $os=Input::get('os','abc');
        $name=$request->os;
        
        return DB::table('devices')->where('os',$name)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        
        $rules=array(
            "camera"=>"required"
        );
        $validator=Validator::make($request->all(),$rules);
        if($validator->fails()){
            return $validator->errors();
        }

        $device=Device::find($id);
        $device->camera=$request->camera;
        $result=$device->save();

        // $validator=Validator::($request->all(),$rules);
        
     
        if($result)
        return ['result'=>'data has been updated'];
        else
        return ['result'=>'operation faild'];
        


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
