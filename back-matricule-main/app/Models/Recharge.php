<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Recharge extends Model
{
     protected $fillable = [
        'user_id',
        'numero_carte',
        'date_expiration',
        'cvv',
        'montant',
    ];
    //
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
