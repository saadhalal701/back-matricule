<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\OcrResult;

class OcrResultController extends Controller
{
    
    
    public function indexForAuthenticatedUser()
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json(['message' => 'Non authentifié'], 401);
        }
         

        $ocrResults = $user->ocrResults;

        return response()->json([
        'user' => [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'matricule' => $user->matricule,
        ],
        'resultats_ocr' => $ocrResults
    ]);
    }
}
