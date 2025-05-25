<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class OcrResult extends Model
{
     protected $table = 'resultats_ocr';
    protected $fillable = [
        'matricule',
        'date_detection',
        'nom_station',
        'chemin_photo',
        'chemin_image_ocr',
    ];
    public function user()
{
    return $this->belongsTo(User::class, 'matricule', 'matricule');
}

}

