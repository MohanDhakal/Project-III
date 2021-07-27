<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BgHistory extends Model
{
    use HasFactory;

    protected $fillable = [
        'userId',
        'value',
    ];

}
