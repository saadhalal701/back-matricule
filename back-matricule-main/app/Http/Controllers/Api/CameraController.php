<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Camera;
use App\Models\Station;


class CameraController extends Controller{

public function store(Request $request){
     $request->validate([
        'nom' => 'required|string',
        'localisation' => 'required|string',
        'ip' => 'required|string|unique:cameras,ip',
        'mdp' => 'required|string|min:4',

    ]);

$station = Station::whereRaw('LOWER(localisation) = ?', [strtolower($request->localisation)])->first();
 if (!$station) {
        return response()->json(['message' => 'No matching station found for this localisation.'], 404);
    }
    Camera::create([
        'nom' => $request->nom,
        'localisation' => $request->localisation,
        'ip' => $request->ip,
        'mdp' => $request->mdp,
        
    ]);
        return response()->json(['message' => 'Camera created successfully'], 201);


}
 public function rechercher( $request){
         $camera = Camera::where('nom', 'like', '%' . $request . '%')
            ->orWhere('localisation', 'like', '%' . $request . '%')
             ->get();

         if ($camera->isEmpty()) {
             return response()->json(['message' => 'No cameras found'], 404);
         }

         return response()->json($camera, 200);

     }
}