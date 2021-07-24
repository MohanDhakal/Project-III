<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Device extends Model
{
    use HasFactory;
    // public $updatedAt=false;
    public $timestamps=false;

    protected $fillable = [
        'name',
        'os',
        'chipset',
        'camera'
    ];

}
