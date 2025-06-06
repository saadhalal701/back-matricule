<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ocr_results', function (Blueprint $table) {
    $table->id();
    $table->string('matricule');
    $table->dateTime('datetime');
    $table->string('station_name');
    $table->string('photo_path')->nullable();
    $table->string('ocr_image_path')->nullable();
    $table->timestamps();
});

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ocr_results');
    }
};
