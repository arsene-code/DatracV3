<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {

            $table->id();

            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');

            $table->string('role')->default('SuperAdmin');


            $table->string('matricule')->nullable();
            $table->string('telephone')->nullable();
            $table->string('poste')->nullable();

            $table->string('adresse')->nullable();
            $table->string('ville')->nullable();

            $table->string('photo_url')->nullable();
            $table->string('api_token')->nullable();


            $table->string('code_secret')->nullable();
            $table->integer('active')->default('0');



            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
