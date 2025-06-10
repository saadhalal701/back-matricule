<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Station;


class StationController extends Controller{

     public function store(Request $request){
         $request->validate([
        'nomStation' => 'required|string',
        'localisation' => 'required|string',
        'tarifStation' => 'required|numeric|min:0',
    ]);

      Station::create([
        'nomStation' => $request->nomStation,
        'localisation' => $request->localisation,
        'tarifStation' => $request->tarifStation,]);
        return response()->json([
            'message' => 'Station created successfully.',
        ], 201);

     }
     public function update(Request $request, $id){
         $station = Station::find($id);
         if (!$station) {
             return response()->json(['message' => 'Station not found'], 404);
         }

         $request->validate([
             'nomStation' => 'required|string',
             'localisation' => 'required|string',
             'tarifStation' => 'required|numeric|min:0',
         ]);

         $station->update([
             'nomStation' => $request->nomStation,
             'localisation' => $request->localisation,
             'tarifStation' => $request->tarifStation,
         ]);

         return response()->json(['message' => 'Station updated successfully', 'station' => $station], 200);
     }
     public function delete($id){
         $station = Station::find($id);
         if (!$station) {
             return response()->json(['message' => 'Station not found'], 404);
         }
         $station->delete();
         return response()->json(['message' => 'Station deleted successfully'], 200);
     }
     public function rechercher( $request){
         $stations = Station::where('nomStation', 'like', '%' . $request . '%')
             ->get();

         if ($stations->isEmpty()) {
             return response()->json(['message' => 'No stations found'], 404);
         }

         return response()->json($stations, 200);

     }
   

}


