<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Camera extends Model
{
    use HasFactory,Notifiable;
 public $timestamps = false; 
  protected $table = 'cameras';
    protected $fillable = 
    [ 
        'nom',
        'localisation',
        'ip',
        'mdp',
    ];

     /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int,string>
     */
  protected $hidden = [
        'mdp',
        
    ];
     /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */


    public function station()
    {
        return $this->belongsTo(Station::class,'station_id');
    }
     protected function casts(): array
    {
        return [
          
            'mdp' => 'hashed',
            
        ];
    }
}
