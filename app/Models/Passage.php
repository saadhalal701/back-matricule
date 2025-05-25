<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Passage extends Model
{
    protected $fillable = [
    'matricule',
    'datetime',
    'station_name',
    'photo_path',
    'ocr_image_path',
];
public function user()
{
    return $this->belongsTo(User::class);
}
    //
}
