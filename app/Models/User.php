<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\OcrResult;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory,HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * 
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
        'matricule',
        'solde',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int,string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */

     
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'matricule' => 'string',
        ];
    }
     public function ocrResults()
    {
        return $this->hasMany(OcrResult::class, 'matricule', 'matricule');
    }
   public function recharges(){
    return $this->hasMany(Recharge::class);
}
   public function incrementSolde(float $montant)
{
    $this->increment('solde', $montant);
    $this->refresh(); // rafraîchir le modèle avec la nouvelle valeur
}
      
 
}
