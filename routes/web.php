<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;


//FRONTEND CONTROLLERS
use App\Http\Controllers\Frontend\FrontendController AS Frontend;


//BACKEND CONTROLLERS
use App\Http\Controllers\Backend\DashboardController AS BackendDashboard;


//1 - Frontend Routes
Route::group([ 'prefix' =>'/'], function () {

    Route::get('/', [Frontend::class, 'index'])->name('frontend.homepage');

    Route::post('/app-logout', [Frontend::class, 'appLogout'])->name('frontend.appLogout');

});


//2 - Auth Routes
Route::middleware('auth')->group(function () {

    //2 - Admin Routes
    Route::group([ 'prefix' =>'admin', 'middleware' => ['isAdmin']], function () {

        /*Route::resources([
            '/orders' => BackendOrders::class,
            '/products' => BackendProducts::class,
        ]);*/

        // D
        Route::get('/', [BackendDashboard::class, 'index'])->name('backend.dashboard');

        /*// O
        Route::post('/orders/status', [BackendOrders::class, 'status'])->name('backend.orders.status');

        // P
        Route::post('/products/status', [BackendProducts::class, 'status'])->name('backend.products.status');
        Route::post('/products/slug-generator', [BackendProducts::class, 'slugGenerator'])->name('backend.products.slugGenerator');
        Route::post('/products/image/delete', [BackendProducts::class, 'deleteImage'])->name('backend.products.deleteImage');
        Route::post('/products/image/set-primary', [BackendProducts::class, 'setPrimaryImage'])->name('backend.products.setPrimaryImage');
        Route::post('/products/upload-image', [BackendProducts::class, 'imageUpload'])->name('backend.products.imageUpload');

        // U
        Route::get('/users', [BackendUsers::class, 'index'])->name('backend.users.index');
        Route::get('/users/create', [BackendUsers::class, 'create'])->name('backend.users.create');
        Route::get('/users/edit/{id}', [BackendUsers::class, 'edit'])->name('backend.users.edit');
        Route::post('/users/store', [BackendUsers::class, 'store'])->name('backend.users.store');
        Route::post('/users/status', [BackendUsers::class, 'status'])->name('backend.users.status');*/


    });


});




Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
