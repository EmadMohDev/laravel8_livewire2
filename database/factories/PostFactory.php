<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
                'title' => $this->faker->sentence ,
                'body'=>$this->faker->paragraph ,
                'slug'=>$this->faker->slug ,
                // 'image' => $this->faker->image(public_path('images'), 640, 640, null, false, true),  // not working as http://lorempixel.com/ not working
              // 'image' => file_get_contents("https://source.unsplash.com/random" )  ,
               'image' =>  "01.jpg" ,
              'user_id'=>User::inRandomOrder()->first()->id


        ];
    }
}
