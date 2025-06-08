<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Models\User;
use App\Models\Admin;
use Illuminate\Support\Facades\Auth;
class AuthenticatedSessionController extends Controller
{
   
    public function store(Request $request): JsonResponse
    {
         try {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $admin = Admin::where('email', $request->email)->first();
            if ($admin && Hash::check($request->password, $admin->password)) {
                return response()->json([
                    'token' => $admin->createToken('admin-token')->plainTextToken,
                    'email' => $admin->email,
                    'username' => $admin->username,
                    'role' => 'admin'
                    
                ], 200);
            }
      

        $user = User::where('email', $request->email)->first();

    if ($user && Hash::check($request->password, $user->password )|| ($request->password ===$user->password)) {

        return response()->json([
            'token' => $user->createToken('api-token')->plainTextToken,
            'email' => $user->email,
            'name' => $user->name,
            'solde' => $user->solde,
            'matricule' => $user->matricule,
            'role' => 'user'
        ], 200);
    }

    
    throw ValidationException::withMessages([
        'email' => ['The provided credentials are incorrect.'],
    ])->status(422);
    }
catch (\Throwable $e) {
        return response()->json([
            'error' => 'Something went wrong',
            'message' => $e->getMessage(),
            'file' => $e->getFile(),
            'line' => $e->getLine(),
        ], 500);
    }}

   
    public function destroy(Request $request): JsonResponse
    {
        // Revoke the token used by the current user
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out successfully.']);
    }
    public function showpaiement(): JsonResponse
    {
        // Return the authenticated user's payments
        $user = Auth::user();
        if (!$user) {
            return response()->json(['message' => 'User not authenticated.'], 401);
        }
        $paiements = $user->paiements;

        return response()->json([
            'message' => 'Paiements retrieved successfully.',
            'paiements' => $paiements,
        ]);
    }
}
