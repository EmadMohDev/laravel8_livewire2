<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Kutia\Larafirebase\Facades\Larafirebase;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Hash;



class NotificationController extends Controller
{
    /**
     * Write code on Method
     *
     * @return response()
     */
    public function index()
    {
        return view('pushNotification');
    }



    public function updateToken(Request $request){
        try{
            $faker = Faker::create();

            User::firstOrCreate(['device_token' => $request->token], [
                'name' => $faker->name,
                'email' => $faker->email(),
                'password' => Hash::make('123456'),
                'mobile_token' => $request->token
            ]);
            return response()->json(['success'=>true]);
        }catch(\Exception $e){
            report($e);
            return response()->json(['success'=>false],500);
        }
    }





    public function notification(Request $request){
        $request->validate([
            'title'=>'required',
            'message'=>'required'
        ]);

        try{
            $fcmTokens = User::whereNotNull('fcm_token')->pluck('fcm_token')->toArray();

            //Notification::send(null,new SendPushNotification($request->title,$request->message,$fcmTokens));

            /* or */

            //auth()->user()->notify(new SendPushNotification($title,$message,$fcmTokens));

            /* or */

            Larafirebase::withTitle($request->title)
                ->withBody($request->message)
                ->sendMessage($fcmTokens);

            return redirect()->back()->with('success','Notification Sent Successfully!!');

        }catch(\Exception $e){
            report($e);
            return redirect()->back()->with('error','Something goes wrong while sending notification.');
        }
    }


}
