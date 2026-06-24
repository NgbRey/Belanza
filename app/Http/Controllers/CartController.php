<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        $cart = session()->get('cart', []);
        $items = [];
        $total = 0;

        foreach ($cart as $key => $item) {
            $product = Product::find($item['id']);
            if (! $product) {
                continue;
            }
            $items[] = [
                'key' => $key,
                'product' => $product,
                'size' => $item['size'] ?? null,
                'color' => $item['color'] ?? null,
                'qty' => $item['qty'],
                'subtotal' => $product->final_price * $item['qty'],
            ];
            $total += $product->final_price * $item['qty'];
        }

        return view('cart.index', compact('items', 'total'));
    }

    public function add(Request $request)
    {
        $product = Product::findOrFail($request->product_id);
        $cart = session()->get('cart', []);
        $itemKey = $product->id.'-'.$request->size.'-'.$request->color;
        $size = $request->size;
        $color = $request->color;

        if (isset($cart[$itemKey])) {
            $cart[$itemKey]['qty'] += $request->qty ?: 1;
        } else {
            $cart[$itemKey] = [
                'id' => $product->id,
                'size' => $size,
                'color' => $color,
                'qty' => $request->qty ?: 1,
            ];
        }

        session()->put('cart', $cart);

        return response()->json([
            'success' => true,
            'count' => array_sum(array_column($cart, 'qty')),
            'message' => 'Produk ditambahkan ke cart',
        ]);
    }

    public function update(Request $request)
    {
        $cart = session()->get('cart', []);
        $itemKey = $request->key;

        if (isset($cart[$itemKey])) {
            $cart[$itemKey]['qty'] = max(1, $request->qty);
            session()->put('cart', $cart);
        }

        $cart = session()->get('cart', []);
        $totalQty = array_sum(array_column($cart, 'qty'));

        return response()->json([
            'success' => true,
            'count' => $totalQty,
        ]);
    }

    public function remove(Request $request)
    {
        $cart = session()->get('cart', []);
        unset($cart[$request->key]);
        session()->put('cart', $cart);

        return response()->json(['success' => true]);
    }

    public function checkout(Request $request)
    {
        $cart = session()->get('cart', []);
        if (empty($cart)) {
            return redirect()->route('cart.index')->with('error', 'Cart kosong');
        }

        $name = $request->name;
        $phone = $request->phone;
        $address = $request->address;
        $items = [];
        $total = 0;

        foreach ($cart as $itemKey => $item) {
            $product = Product::find($item['id']);
            if (! $product) {
                continue;
            }
            $subtotal = $product->final_price * $item['qty'];
            $total += $subtotal;
            $size = $item['size'] ? " - Ukuran {$item['size']}" : '';
            $color = $item['color'] ? " - Warna {$item['color']}" : '';
            $items[] = "{$product->name}{$size}{$color} - Qty {$item['qty']} - Rp ".number_format($subtotal, 0, ',', '.');
        }

        $message = "Halo, saya ingin memesan:\n\n";
        foreach ($items as $i => $item) {
            $message .= ($i + 1).". {$item}\n";
        }
        $message .= "\nTotal: Rp ".number_format($total, 0, ',', '.');
        $message .= "\n\nNama: {$name}";
        $message .= "\nNo. HP: {$phone}";
        $message .= "\nAlamat: {$address}";

        $waNumber = setting('wa_number', '6280000000000');
        $url = "https://wa.me/{$waNumber}?text=".urlencode($message);

        session()->forget('cart');

        return redirect()->away($url);
    }
}
