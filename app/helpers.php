<?php

use App\Models\Setting;

if (! function_exists('setting')) {
    function setting(string $key, mixed $default = null): mixed
    {
        static $all = null;
        if ($all === null) {
            $all = Setting::pluck('value', 'key')->all();
        }

        return $all[$key] ?? $default;
    }
}

if (! function_exists('generate_order_number')) {
    function generate_order_number(): string
    {
        do {
            $number = 'INV/' . strtoupper(\Illuminate\Support\Str::random(8));
        } while (\App\Models\Order::where('order_number', $number)->exists());

        return $number;
    }
}
