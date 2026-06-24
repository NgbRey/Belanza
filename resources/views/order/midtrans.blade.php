@extends('layouts.app')

@section('title', 'Pembayaran Midtrans')

@section('content')
<div class="container py-5">
    <div class="text-center mb-4">
        <h1 class="section-heading text-center">Pembayaran Midtrans</h1>
        <p class="text-muted">Pesanan #{{ $order->order_number }}</p>
    </div>

    <div class="text-center">
        <p class="mb-4">Klik tombol di bawah untuk membuka popup pembayaran.</p>
        <button type="button" class="btn btn-primary btn-lg" id="pay-button">
            <i class="bi bi-credit-card"></i> Bayar Sekarang
        </button>
    </div>
</div>
@endsection

@push('scripts')
<script src="https://app.sandbox.midtrans.com/snap/snap.js"
        data-client-key="{{ config('midtrans.client_key') }}"></script>
<script>
document.getElementById('pay-button').onclick = function () {
    snap.pay('{{ $snapToken }}', {
        onSuccess: function(result) {
            fetch('{{ route("order.payment-finish", $order) }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    transaction_status: result.transaction_status,
                    transaction_id: result.transaction_id,
                    order_id: result.order_id
                })
            }).finally(function() {
                window.location.href = '{{ route("order.success", $order) }}';
            });
        },
        onPending: function(result) {
            window.location.href = '{{ route("order.success", $order) }}';
        },
        onError: function(result) {
            alert('Pembayaran gagal. Silakan coba lagi.');
            window.location.href = '{{ route("order.success", $order) }}';
        },
        onClose: function() {
            window.location.href = '{{ route("order.success", $order) }}';
        }
    });
};
</script>
@endpush
