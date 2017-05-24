<?php

event('biashara.routing', app('router'));
$namespaceController = '\\'.'Tyondo\Biashara\Http\Controllers'.'\\';

Route::get('/', $namespaceController.'BiasharaFrontEndController@index')->name('biashara.index');
Route::get('/products', $namespaceController.'BiasharaFrontEndController@products')->name('biashara.products.list');
Route::get('/about', $namespaceController.'BiasharaFrontEndController@about')->name('biashara.about');
Route::get('/contact', $namespaceController.'BiasharaFrontEndController@contact')->name('biashara.contact');
Route::post('/contact', $namespaceController.'BiasharaFrontEndController@storeContact')->name('contact.store');

Route::group(['prefix'=>'auth'], function(){
    event('biashara.routing',app('router'));
    $namespaceController = '\\'.'Tyondo\Biashara\Http\Controllers\Auth'.'\\';
       Route::post('/login',$namespaceController.'LoginController@login')->name('biashara.auth.login');
       Route::post('/register',$namespaceController.'RegisterController@register')->name('biashara.auth.register');
});

Route::group(['prefix'=>'order'], function(){
    event('biashara.routing', app('router'));
    $namespaceController = '\\'.'Tyondo\Biashara\Http\Controllers'.'\\';

        Route::post('/details', $namespaceController.'BiasharaOrdersController@storeOrder');
        Route::get('/list', $namespaceController.'BiasharaOrdersController@index')->name('biashara.order.list');

        Route::get('/orders', $namespaceController.'BiasharaOrdersController@orders')->name('biashara.order.orders');
        Route::get('/orders/show/{id}', $namespaceController.'BiasharaOrdersController@orders')->name('biashara.order.orders.show');

        Route::get('/draft', $namespaceController.'BiasharaOrdersController@draftOrders')->name('biashara.order.draft');
        Route::get('/show/{id}', $namespaceController.'BiasharaOrdersController@draftOrders')->name('biashara.order.show');

        Route::get('/save/{orderNumberId}', $namespaceController.'BiasharaOrdersController@saveOrder')->name('biashara.order.save');
        Route::get('/delete/{orderNumberId}', $namespaceController.'BiasharaOrdersController@deleteOrder')->name('biashara.order.delete');

    Route::post('/update/single/product', $namespaceController.'BiasharaOrdersController@updateSingleProduct');
    Route::post('/delete/single/product', $namespaceController.'BiasharaOrdersController@deleteSingleProduct');
});
