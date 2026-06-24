@extends('layouts.app')

@section('title', 'Lacak Pesanan')

@section('content')
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <h1 class="section-heading mb-4 text-center">Lacak Pesanan</h1>
            <p class="text-muted text-center mb-4">Masukkan nomor pesanan atau nomor HP untuk melacak status pesanan.</p>

            <form action="{{ route('order.search') }}" method="POST" class="card border-0 shadow-sm p-4">
                @csrf
                <div class="mb-3">
                    <label class="form-label">Nomor Pesanan / No. HP</label>
                    <input type="text" name="q" class="form-control form-control-lg @error('q') is-invalid @enderror"
                           value="{{ old('q') }}" required placeholder="INV/XXXXXXXX atau 08123456789">
                    @error('q')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <button type="submit" class="btn btn-primary-gold w-100 py-2">
                    <i class="bi bi-search"></i> Lacak Pesanan
                </button>
            </form>

            @if(session('error'))
            <div class="alert alert-danger mt-3">{{ session('error') }}</div>
            @endif

            @if(isset($orders))
            <div class="mt-4">
                <h5 class="fw-bold mb-3">Ditemukan {{ $orders->count() }} pesanan</h5>
                @foreach($orders as $o)
                @php
                    $statusLabels = [
                        'pending' => 'Menunggu Pembayaran',
                        'confirmed' => 'Dikonfirmasi',
                        'processed' => 'Diproses',
                        'shipped' => 'Dikirim',
                        'delivered' => 'Diterima',
                        'cancelled' => 'Dibatalkan',
                    ];
                    $statusBadges = [
                        'pending' => 'bg-warning text-dark',
                        'confirmed' => 'bg-info text-dark',
                        'processed' => 'bg-primary',
                        'shipped' => 'bg-success',
                        'delivered' => 'bg-success',
                        'cancelled' => 'bg-danger',
                    ];
                @endphp
                <a href="{{ route('order.show', $o) }}" class="text-decoration-none">
                    <div class="card border-0 shadow-sm mb-2">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <div class="fw-bold" style="color: var(--color-gold);">{{ $o->order_number }}</div>
                                <small class="text-muted">{{ $o->created_at->format('d M Y H:i') }}</small>
                            </div>
                            <span class="badge {{ $statusBadges[$o->order_status] ?? 'bg-secondary' }}">
                                {{ $statusLabels[$o->order_status] ?? $o->order_status }}
                            </span>
                        </div>
                    </div>
                </a>
                @endforeach
            </div>
            @endif
        </div>
    </div>
</div>
@endsection
