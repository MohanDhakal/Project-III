<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    use HasFactory;
    public $timestamps=false;
    protected $fillable = [
        'userId',
        'age',
        'gender',
        'activity',
        'height',
        'weight',
        'allergy',
    ];

}
