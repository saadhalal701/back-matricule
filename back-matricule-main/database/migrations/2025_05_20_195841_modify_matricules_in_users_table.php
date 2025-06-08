<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
    if (!Schema::hasColumn('users', 'matricule')) {
        $table->string('matricule')->nullable()->after('phone');
    }
});

    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Supprimer matricule string
            $table->dropColumn('matricule');

            // Remettre la colonne matricules JSON
            $table->json('matricules')->nullable();
        });
    }
};
