<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class station extends Model{
 use HasFactory;
 protected $fillable = [
        'nomStation',
        'localisation',
        'tarifStation',
    ];

     public function cameras()
    {
       return $this->hasMany(camera::class);
    }

}




