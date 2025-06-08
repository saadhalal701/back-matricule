<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;
 class Admin extends Authenticatable{
use HasApiTokens, Notifiable; 
     protected $fillable = 
    [ 
        'username',
        'email',
        'password',
        
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
            
        ];
    }

    

}
