<?php
namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\OcrResult;
use Illuminate\Database\Eloquent\Model;

class Paiement extends Model{

    protected $fillable = [
    'matricule',
    'user_id',
    'ocr_result_id',
    'montant',
    'date_paiement',
    'status',
];

public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
public function ocrResult()
    {
        return $this->belongsTo(OcrResult::class, 'ocr_result_id');
    }
}