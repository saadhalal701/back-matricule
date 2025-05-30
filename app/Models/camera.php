<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Camera extends Model
{
    use HasFactory;

    protected $fillable = 
    [ 'station_id',
        'nom',
        'localisation',
        'ip',
        'mdp',
    ];

    public function station()
    {
        return $this->belongsTo(station::class,'station_id');
    }
     public function setMdpAttribute($value)
    {
        $this->attributes['mdp'] = bcrypt($value);
    }
}
