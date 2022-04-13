<?php

use Illuminate\Support\Facades\Route;

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


//Auth::routes();

/* route vers page d'accueil du système */
Route::get('/', function () {
    return view('auth.login');
});
/* Fin routage vers accueil */


/* route du site */

Route::get('/', 'SiteController@home')->name('home');
Route::post('deconnexion/', 'SiteController@logout')->name('logout');

/* Fin routage du site */


Route::middleware(['auth'])->group(function() {

    ##############################################################################################
    #                                                                                            #
    #                                  SuperAdmin ROUTING                                              #
    #                                                                                            #
    ##############################################################################################

    /* Start Routing for SuperAdmin's User */
    Route::get('dashboard/superadmin', 'SuperAdminController@dashSuperAdmin')->name('dashSuperAdmin');

    Route::get('dashboard/superadmin/nos-actes', 'SuperAdminController@dashSuperAdminActes')->name('dashSuperAdminActes');
    Route::post('dashboard/superadmin/nouvel-acte', 'SuperAdminController@newActeSuperAdmin')->name('newActeSuperAdmin');
    Route::get('dashboard/superadmin/show-acte/{id}', 'SuperAdminController@showActeSuperAdmin')->name('showActeSuperAdmin');
    Route::get('dashboard/superadmin/edit-acte/{id}', 'SuperAdminController@editActeSuperAdmin')->name('editActeSuperAdmin');
    Route::post('dashboard/superadmin/update-acte', 'SuperAdminController@updateActeSuperAdmin')->name('updateActeSuperAdmin');


    
    /* End Routing for SuperAdmin's User */

    ##############################################################################################
    #                                                                                            #
    #                                  SUPERADMIN ROUTING                                        #
    #                                                                                            #
    ##############################################################################################


});

//Clear Cache facade value:
Route::get('/clear-cache', function() {
    $exitCode = Artisan::call('cache:clear');
    return '<h1>Cache facade value cleared</h1>';
});

//Reoptimized class loader:
Route::get('/optimize', function() {
    $exitCode = Artisan::call('optimize');
    return '<h1>Reoptimized class loader</h1>';
});

//Route cache:
Route::get('/route-cache', function() {
    $exitCode = Artisan::call('route:cache');
    return '<h1>Routes cached</h1>';
});

//Clear Route cache:
Route::get('/route-clear', function() {
    $exitCode = Artisan::call('route:clear');
    return '<h1>Route cache cleared</h1>';
});

//Clear View cache:
Route::get('/view-clear', function() {
    $exitCode = Artisan::call('view:clear');
    return '<h1>View cache cleared</h1>';
});

//Clear Config cache:
Route::get('/config-cache', function() {
    $exitCode = Artisan::call('config:cache');
    return '<h1>Clear Config cache cleared</h1>';
});

//Clear Config cache:
Route::get('/proc-open-error', function() {
    $exitCode = Artisan::call('vendor:publish', ['--tag' => 'flare-config']);
    return '<h1>Proc open error resolved -> Think to change parameters in config/flare.php !!!</h1>';
});

//Storage route link
Route::get('/any-route', function () {
	$exitCode = Artisan::call('storage:link');
    echo $exitCode; // 0 exit code for no errors.
});

Auth::routes();

