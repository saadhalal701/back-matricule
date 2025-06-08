<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Recharge;
use App\Models\User;


class RechargeController extends Controller
{
   public function store(Request $request)
{
    $request->validate([
        'numero_carte' => 'required|string',
        'date_expiration' => 'required|string',
        'cvv' => 'required|string',
        'montant' => 'required|numeric|min:1',
    ]);

    $user = Auth::user();

    if (!$user) {
        return response()->json(['message' => 'Non authentifié'], 401);
    }

    Recharge::create([
        'user_id' => $user->id,
        'numero_carte' => $request->numero_carte,
        'date_expiration' => $request->date_expiration,
        'cvv' => $request->cvv,
        'montant' => $request->montant,
    ]);

    // Incrémentation du solde
    $user = User::find($user->id);
    $user->solde += $request->montant;
    $user->save();

    return response()->json([
        'message' => 'Recharge effectuée avec succès.',
        'nouveau_solde' => $user->solde,
    ]);

    
}
public function index()
{
    $user = Auth::user();
    $recharges = $user->recharges;

    return response()->json([
        'recharges' => $recharges,
    ]);
}

}
