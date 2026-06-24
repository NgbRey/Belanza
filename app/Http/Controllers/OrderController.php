<?php

namespace App\Http\Controllers;

use App\Models\Order;

class OrderController extends Controller
{
    public function success(Order $order)
    {
        return view('order.success', compact('order'));
    }

    public function track()
    {
        return view('order.track');
    }

    public function search()
    {
        $query = request('q');

        $byOrderNumber = Order::where('order_number', $query)->first();
        if ($byOrderNumber) {
            return redirect()->route('order.show', $byOrderNumber);
        }

        $orders = Order::where('customer_phone', $query)
            ->orderBy('created_at', 'desc')
            ->get();

        if ($orders->isEmpty()) {
            return redirect()->route('order.track')->with('error', 'Pesanan tidak ditemukan');
        }

        if ($orders->count() === 1) {
            return redirect()->route('order.show', $orders->first());
        }

        return view('order.track', compact('orders'));
    }

    public function show(Order $order)
    {
        $order->load('items.product');
        return view('order.show', compact('order'));
    }
}
