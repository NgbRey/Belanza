<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Midtrans\Config;
use Midtrans\Notification;

class MidtransController extends Controller
{
    public function notification()
    {
        Config::$serverKey = config('midtrans.server_key');
        Config::$isProduction = config('midtrans.is_production');

        try {
            $notif = new Notification();
        } catch (\Exception $e) {
            return response('OK', 200);
        }

        $transactionStatus = $notif->transaction_status;
        $orderId = $notif->order_id;

        $order = Order::where('order_number', $orderId)->first();
        if (! $order) {
            return response('Order not found', 404);
        }

        $this->updateOrderStatus($order, $transactionStatus);

        return response('OK', 200);
    }

    private function updateOrderStatus(Order $order, string $transactionStatus): void
    {
        $statusMap = [
            'capture' => 'paid',
            'settlement' => 'paid',
            'pending' => 'pending',
            'deny' => 'cancelled',
            'expire' => 'cancelled',
            'cancel' => 'cancelled',
        ];

        if (isset($statusMap[$transactionStatus])) {
            $newStatus = $statusMap[$transactionStatus];

            $order->payment_status = $newStatus;
            if ($newStatus === 'paid') {
                $order->order_status = 'confirmed';
                $order->paid_at = now();
            } elseif ($newStatus === 'cancelled') {
                $order->order_status = 'cancelled';
            }

            $order->save();
        }
    }
}
