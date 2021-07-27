<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMealsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('meals', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->integer("userId");
            $table->string("name");
            $table->double("calorie")->nullable();
            $table->double("carbs")->nullable();
            $table->double("protein")->nullable();
            $table->double("fat")->nullable();
            $table->json('ingredients')->nullable();
            $table->string("warning")->nullable();
            //break,lun,din
            $table->json("type")->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('meals');
    }
}
