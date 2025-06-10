<?php

namespace App\Observers;

use App\Models\OcrResult;
use Illuminate\Support\Facades\Log;


use App\Models\User;
use App\Models\Paiement;
class ResultatOcrObserver
{
    
         public function created(OcrResult $ocr)
    {
         try {

        if (!$ocr->matricule || !$ocr->montant) {
            return;
        }

        $user = User::where('matricule', $ocr->matricule)->first();

        if (!$user) {
            return;
        }

        if ($user->solde < $ocr->montant) {
            // Optionally notify user or log it
            return;
        }

        // Deduct solde
        $user->decrement('solde', $ocr->montant);
            
        // Create payment
        Paiement::create([
            'user_id' => $user->id,
            'matricule' => $ocr->matricule,
            'ocr_result_id' => $ocr->id,
            'montant' => $ocr->montant,
            'date_paiement' => now(),
            'status' => 'payé',
        ]);
         Log::info('Payment processed successfully', [
             'id'=>Paiement::latest()->first()->id,
                'new_balance' => $user->fresh()->solde
            ]);
    } catch (\Exception $e) {
        Log::error("Erreur lors de la création du paiement via OCR Result", [
            'message' => $e->getMessage(),
            'trace' => $e->getTraceAsString(),
            'ocr_id' => $ocr->id ?? null,
        ]);
    }
    }
    

    /**
     * Handle the OcrResult "updated" event.
     */
    public function updated(OcrResult $ocrResult): void
    {
        //
    }

    /**
     * Handle the OcrResult "deleted" event.
     */
    public function deleted(OcrResult $ocrResult): void
    {
        //
    }

    /**
     * Handle the OcrResult "restored" event.
     */
    public function restored(OcrResult $ocrResult): void
    {
        //
    }

    /**
     * Handle the OcrResult "force deleted" event.
     */
    public function forceDeleted(OcrResult $ocrResult): void
    {
        //
    }
}
