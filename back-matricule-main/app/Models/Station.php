<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class station extends Model{
 use HasFactory;
  protected $primaryKey = 'idstation'; 
  
 public $timestamps = false; 
  protected $table = 'station';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
 protected $fillable = [
        'nomStation',
        'localisation',
        'tarifStation',
    ];

     public function cameras()
    {
       return $this->hasMany(Camera::class);
    }
  

}




