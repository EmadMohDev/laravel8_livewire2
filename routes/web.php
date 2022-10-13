<?php

use App\Models\Post;
use App\Http\Livewire\ShowPost;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\NotificationController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['middleware'=>'auth'],function (){

    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');


    Route::get('/posts', function () {
        return view('posts');
    })->name('posts');

});




 Route::get('/{slug}', ShowPost::class)->name('show-post');  // here we call livewire component directly



require __DIR__.'/auth.php';




/*
laravel firebase :

https://techvblogs.com/blog/firebase-push-notification-laravel

FIREBASE_SERVER_KEY=AAAAroXaB8w:APA91bGVgrOw-MfjdgnQfpBJKg5GJfr1nmazQ_iLvb6UNByiJGvTPtSPODvrGupTpB8HhtoLSnSmkdA1dTXTsXIhNihLw4o7GISxPtQ_bguyFEKN9MdTgSFrJ7z0rnjryAaOn99qVMo5


*/


// push notification with firebase
Route::get('/home', [NotificationController::class, 'index'])->name('home');
Route::patch('/fcm-token', [NotificationController::class, 'updateToken'])->name('fcmToken');
Route::post('/send-notification',[NotificationController::class,'notification'])->name('notification');
