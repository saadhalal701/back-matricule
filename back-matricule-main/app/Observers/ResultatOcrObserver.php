<?php

namespace App\Observers;

use App\Models\OcrResult;

use App\Models\User;
use App\Models\Paiement;
class ResultatOcrObserver
{
    /**
     * Handle the OcrResult "created" event.
     */
   
         public function created(OcrResult $ocr)
    {
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
            'montant' => $ocr->montant,
            'date_paiement' => now(),
            'status' => 'payé',
        ]);
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
