<?php

use App\Http\Controllers\Admin\AppearanceController;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\CategoryController as AdminCategoryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\OrderController as AdminOrderController;
use App\Http\Controllers\Admin\PaymentBankController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\ShippingCostController;
use App\Http\Controllers\AboutController;
use App\Http\Controllers\CaraBelanjaController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/{slug}', [ProductController::class, 'show'])->name('products.show');
Route::get('/cara-belanja', CaraBelanjaController::class)->name('cara-belanja');
Route::get('/tentang-kami', AboutController::class)->name('about');
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
Route::post('/cart/add', [CartController::class, 'add'])->name('cart.add');
Route::post('/cart/update', [CartController::class, 'update'])->name('cart.update');
Route::post('/cart/remove', [CartController::class, 'remove'])->name('cart.remove');
Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
Route::post('/checkout/shipping-cost', [CheckoutController::class, 'shippingCost'])->name('checkout.shipping-cost');
Route::post('/checkout/process', [CheckoutController::class, 'process'])->name('checkout.process');
Route::get('/order/success/{order}', [OrderController::class, 'success'])->name('order.success');
Route::get('/order/track', [OrderController::class, 'track'])->name('order.track');
Route::post('/order/track', [OrderController::class, 'search'])->name('order.search');
Route::get('/order/{order}', [OrderController::class, 'show'])->name('order.show');
Route::post('/midtrans/notification', [MidtransController::class, 'notification'])->name('midtrans.notification');
Route::post('/order/payment-finish/{order}', [CheckoutController::class, 'paymentFinish'])->name('order.payment-finish');

Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'login'])->middleware('throttle:5,1');
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    Route::middleware('auth')->group(function () {
        Route::get('/', DashboardController::class)->name('dashboard');
        Route::get('/settings', [SettingController::class, 'edit'])->name('settings');
        Route::post('/settings', [SettingController::class, 'update']);
        Route::get('/appearance', [AppearanceController::class, 'edit'])->name('appearance');
        Route::post('/appearance', [AppearanceController::class, 'update']);
        Route::get('/orders', [AdminOrderController::class, 'index'])->name('orders');
        Route::get('/orders/{order}', [AdminOrderController::class, 'show'])->name('orders.show');
        Route::post('/orders/{order}/payment', [AdminOrderController::class, 'payment'])->name('orders.payment');
        Route::post('/orders/{order}/status', [AdminOrderController::class, 'status'])->name('orders.status');
        Route::resource('payment-banks', PaymentBankController::class);
        Route::resource('shipping-costs', ShippingCostController::class);
        Route::resource('categories', AdminCategoryController::class);
        Route::resource('products', AdminProductController::class);
    });
});
