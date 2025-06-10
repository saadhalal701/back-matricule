<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Paiement;
class PaiementController extends Controller{
    public function store(Request $request){
        $request->validate([
             'user_id' => 'required|exists:users,id',
            'matricule' => 'required|string',
            'ocr_result_id' => 'nullable|exists:resultats_ocr,id',
            'montant' => 'required|numeric',
            'date_paiement' => 'required|date',
             'status' => 'required|in:payé,non_payé',
        ]);

  $user = User::findOrFail($request->user_id);
         if ($request->status === 'non_payé') {
        if ($user->solde < $request->montant) {
            return response()->json([
                'message' => 'Solde insuffisant pour effectuer ce paiement.'
            ], 400);
        }
          $user->decrement('solde', $request->montant);
    }

       $paiement= Paiement::create([
            'user_id' => $user->id,
      'matricule' => $request->matricule,
        'ocr_result_id' => $request->ocr_result_id,
        'montant' => $request->montant,
        'date_paiement' => $request->date_paiement,
        'status' => $request->status,
        ]);

 return response()->json([
        'message' => 'Paiement effectué avec succès.',
        'paiement' => $paiement,
        'nouveau_solde' => $user->fresh()->solde,
    ], 201);    }
   

    
}