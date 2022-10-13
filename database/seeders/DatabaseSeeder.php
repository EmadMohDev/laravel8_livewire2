<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
/*
glob :
    (PHP 4 >= 4.3.0, PHP 5, PHP 7, PHP 8)
    https://www.php.net/manual/en/function.glob.php
    glob — Find pathnames matching a pattern
    */

         // to delete all images on a folder
         $images = glob(public_path('images/*.*')) ;   // get all images with any name *  and with any extension  .*
        foreach ($images as $image){
            unlink($image);
        }


         \App\Models\User::factory(10)->create();
         \App\Models\Post::factory(50)->create();
    }
}
