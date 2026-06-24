<?php

namespace Tests\Feature;

use App\Models\Order;
use App\Models\PaymentBank;
use App\Models\Product;
use App\Models\ShippingCost;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class OrderTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        $this->seed();
    }

    private function createOrder(): Order
    {
        $product = Product::first();
        $shipping = ShippingCost::first();
        $bank = PaymentBank::first();

        $this->postJson('/cart/add', ['product_id' => $product->id, 'qty' => 1]);

        $this->post('/checkout/process', [
            'customer_name' => 'Test User',
            'customer_phone' => '08123456789',
            'customer_email' => 'test@example.com',
            'shipping_address' => 'Jl. Test No. 1',
            'shipping_city' => $shipping->id,
            'payment_method' => 'bank_' . $bank->id,
        ]);

        return Order::first();
    }

    public function test_order_success_page(): void
    {
        $order = $this->createOrder();

        $response = $this->get("/order/success/{$order->id}");
        $response->assertStatus(200);
        $response->assertSee($order->order_number);
        $response->assertSee('Instruksi Pembayaran');
    }

    public function test_order_track_page(): void
    {
        $response = $this->get('/order/track');
        $response->assertStatus(200);
        $response->assertSee('Lacak Pesanan');
    }

    public function test_order_search_by_number(): void
    {
        $order = $this->createOrder();

        $response = $this->post('/order/track', [
            'q' => $order->order_number,
        ]);

        $response->assertRedirect("/order/{$order->id}");
    }

    public function test_order_search_by_phone(): void
    {
        $order = $this->createOrder();

        $response = $this->post('/order/track', [
            'q' => $order->customer_phone,
        ]);

        $response->assertRedirect("/order/{$order->id}");
    }

    public function test_order_search_not_found(): void
    {
        $response = $this->post('/order/track', [
            'q' => 'INV/ZZZZZZZZ',
        ]);

        $response->assertRedirect('/order/track');
    }

    public function test_order_detail_page(): void
    {
        $order = $this->createOrder();

        $response = $this->get("/order/{$order->id}");
        $response->assertStatus(200);
        $response->assertSee($order->order_number);
        $response->assertSee($order->customer_name);
    }
}
