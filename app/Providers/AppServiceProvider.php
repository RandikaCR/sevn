<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if( config('app.env') === 'live' || config('app.env') === 'development' ) {
            URL::forceScheme('https');
        }

        //Admin
        if ( request()->segment(1) == 'admin' ){

            view()->composer('*', function ($view) {
                // Get Orders Count
                /*$oc = new OrdersHelper();
                $oc = $oc->getPendingOrdersCount();
                $orderCount = $oc['count'];
                view()->share('navOrderCount', $orderCount);*/


            });

        }
    }
}
