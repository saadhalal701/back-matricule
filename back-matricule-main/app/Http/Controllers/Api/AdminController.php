<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Admin;
use App\Models\Camera;
use App\Models\OcrResult;
use App\Models\Station;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

use Illuminate\Http\JsonResponse;

class AdminController extends Controller
{
    public function ajouteradmin(Request $request):JsonResponse
    {
        $request->validate([
            'username' => ['required', 'string', 'max:255', 'unique:admins,username'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:admins,email'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()]
        ]);

       $admin = Admin::create([
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            
        ]);

        $token = $admin->createToken('api-token')->plainTextToken;

        return Response()->json([
            'user' => $admin,
            'token' => $token,
        ], 201);
    
    }
    public function users()
    {
        $users = User::all();
        return response()->json($users);
    }
    public function supprimer_user($id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
        $user->delete();
        return response()->json(['message' => 'User deleted successfully'], 200);
    }
    public function cameras()
    {
        $cameras = Camera::all(); 
        return response()->json($cameras);
    }

    public function stations()
    {
        $stations = Station::all(); 
        return response()->json($stations);
    }

     public function rechercher_camera( $request){
         $camera = Camera::where('nom', 'like', '%' . $request . '%')
            ->orWhere('localisation', 'like', '%' . $request . '%')
             ->get();

         if ($camera->isEmpty()) {
             return response()->json(['message' => 'No cameras found'], 404);
         }

         return response()->json($camera, 200);

     }

      public function rechercher_station( $request){
         $stations = Station::where('nomStation', 'like', '%' . $request . '%')
             ->get();

         if ($stations->isEmpty()) {
             return response()->json(['message' => 'No stations found'], 404);
         }

         return response()->json($stations, 200);

     }


    public function rechercher_user( $request){
         $users = User::where('name', 'like', '%' . $request . '%')
             ->orWhere('email', 'like', '%' . $request . '%')
             ->get();

         if ($users->isEmpty()) {
             return response()->json(['message' => 'No users found'], 404);
         }

         return response()->json($users, 200);

     }
    public function adminHistorique()
{
    $ocrResults = OcrResult::with('user')
        ->get()
        ->filter(function ($ocr) {
            return $ocr->user !== null; 
        })
        ->values(); 

    return response()->json([
        'resultats_ocr' => $ocrResults->map(function ($ocr) {
            return [
                'id' => $ocr->id,
                'date_detection' => $ocr->date_detection,
                'nom_station' => $ocr->nom_station,
                'chemin_photo' => $ocr->chemin_photo,
                'chemin_image_ocr' => $ocr->chemin_image_ocr,
                'user_name' => $ocr->user->name ?? 'Unknown User',
                'matricule' => $ocr->matricule,
                'montant' => $ocr->montant,
            ];
        }),
    ]);
}
}