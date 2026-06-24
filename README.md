# 👕 Belanza — Fashion E-commerce

> Laravel 13 · Bootstrap 5 · Katalog Fashion Premium · Midtrans Payment · WhatsApp Checkout

Aplikasi toko online fashion dengan katalog produk, keranjang belanja, transaksi, manajemen ongkir, pembayaran Midtrans, dan checkout otomatis ke WhatsApp. **Fully responsive** — mobile, tablet, dan desktop.

---

## ✨ Fitur

### 🛍️ Frontend
- **Katalog produk** — grid responsif, filter kategori, search produk
- **Cart AJAX** — tambah/hapus/update qty tanpa reload
- **Varian produk** — pilih ukuran & warna via modal sebelum masuk keranjang
- **Flash sale countdown** — realtime, bisa diatur dari admin
- **Banner promo** — dinamis dari pengaturan admin
- **Checkout & transaksi** — form alamat, pilih pengiriman, Midtrans / bank transfer
- **Midtrans payment** — popup pembayaran (kartu kredit, VA, Alfamart, GoPay, dll.)
- **Bank Transfer** — checkout manual dengan konfirmasi via WhatsApp
- **Lacak pesanan** — cari pesanan via nomor WA, lihat status & timeline
- **Tentang Kami** — halaman statis dengan banner + konten (Trix editor) dari admin
- **Cara Belanja** — panduan belanja yang bisa diedit dari admin
- **Floating WhatsApp** — tombol WA fixed di semua halaman (kecuali checkout)

### 🔐 Admin Panel (`/admin`)
- **Produk** — CRUD dengan upload gambar, ukuran, warna (picker modal), harga diskon
- **Kategori** — CRUD dengan upload gambar
- **Pesanan** — daftar, detail, update status, konfirmasi pembayaran
- **Ongkos Kirim** — tarif per kota, weight-based (cost per kg)
- **Payment Bank** — kelola rekening untuk transfer manual
- **Halaman Tentang Kami** — upload banner + Trix editor konten
- **Halaman Cara Belanja** — upload banner + Trix editor konten
- **Pengaturan Toko** — brand, logo, WA, warna gold & accent, sosial media, flash sale, lokasi toko
- **Tampilan Toko** — SEO meta, hero section, CTA, banner promo

### ⚙️ Teknis
- **Midtrans Snap** — popup pembayaran + webhook server-to-server via `overrideNotifUrl`
- **Ongkir weight-based** — `base_cost + ceil(kg - 1) × cost_per_kg`
- **Tampilan dinamis** — hero, banner, warna, SEO meta semua dari database
- **No build tools** — Bootstrap statis di `public/bootstrap/`, tanpa Vite/Webpack/npm
- **Database driver** — session, cache, dan queue pakai database

---


## 🚀 Cara Install
> Pastikan database MySQL `Belanza` sudah dibuat. Migration akan membuat tabel-tabelnya otomatis.

```bash
# 1. Setup otomatis (install, .env, key, migrate)
composer run setup

# 2. Seed data awal (admin + contoh produk + ongkos kirim)
php artisan migrate:fresh --seed

# 3. Storage link (buat akses gambar produk)
php artisan storage:link

# 4. Jalankan
php artisan serve
```

Akses di **`http://localhost:8000`**.

### Reset Data

```bash
php artisan migrate:fresh --seed
```

### Midtrans (Opsional)

Isi di `.env` untuk mengaktifkan pembayaran Midtrans:

```env
MIDTRANS_ACTIVE=true
MIDTRANS_MERCHANT_ID=your_merchant_id
MIDTRANS_SERVER_KEY=Mid-server-xxx
MIDTRANS_CLIENT_KEY=Mid-client-xxx
MIDTRANS_IS_PRODUCTION=false   # true untuk production
```

Webhook notifikasi dikirim otomatis via `Config::$overrideNotifUrl` — tidak perlu setup di dashboard Midtrans.

---


## 🔑 Admin Panel

| URL | Email | Password |
|-----|-------|----------|
| `/admin` | `admin@Belanza.test` | `admin123` |

---

## 📱 Responsivitas

| Breakpoint | Grid Produk | Filter | Cart | Admin Sidebar |
|------------|-------------|--------|------|---------------|
| **Mobile** (< 768px) | 2 kolom → 1 kolom | Offcanvas | Card list | Offcanvas |
| **Tablet** (768–992px) | 2 kolom | Offcanvas | Card list | Offcanvas |
| **Desktop** (> 992px) | 3 kolom | Sidebar tetap | Table | Sidebar tetap |

Semua halaman diuji di Chrome DevTools (320px–1440px).

---

## 🧪 Testing

In-memory SQLite — tanpa database eksternal. **45 tests, 89 assertions — semuanya passing.**

```bash
composer run test
```

**Cakupan test:**
| Area | Tes |
|------|-----|
| Homepage | Homepage bisa diakses |
| Produk | Listing, kategori, search, detail, 404, sorting |
| Cart | Tambah, update qty, hapus, checkout, cart kosong |
| Order | Buat pesanan, lacak via nomor WA, Midtrans payment finish |
| Admin Auth | Login sukses/gagal, middleware redirect |
| Admin Produk | List, create, store, edit, update, delete |
| Admin Pengaturan | Baca & simpan settings, XSS stripped |
| Admin Tampilan | Baca & simpan appearance, auth required |
| Ongkos Kirim | Weight-based shipping cost calculation |
| Shipping Costs CRUD | List, create, edit, update, delete |

```bash
# Format kode
./vendor/bin/pint
```

---

## 🏗️ Struktur Penting

```
├── routes/web.php                                    # Semua routes
├── resources/views/
│   ├── layouts/app.blade.php                         # Frontend layout (header, navbar, footer, OG tags, variant modal)
│   ├── layouts/admin/                                # Admin layout + partials
│   ├── home/index.blade.php                          # Halaman depan (hero, flash sale, kategori, produk)
│   ├── products/                                     # Katalog + detail + card partial
│   ├── cart/index.blade.php                          # Keranjang AJAX
│   ├── order/                                        # Success, detail, lacak, midtrans pay page
│   ├── cara-belanja/                                  # Halaman cara belanja (Trix editor)
│   └── admin/                                        # CRUD produk, kategori, ongkir, payment bank, appearance, settings
├── public/
│   ├── css/custom.css                                # Custom styling
│   ├── js/cart.js                                    # Cart AJAX + variant modal
│   └── js/countdown.js                               # Countdown flash sale
├── app/
│   ├── Http/Controllers/
│   │   ├── CheckoutController.php                    # Checkout + Midtrans payment finish
│   │   ├── MidtransController.php                    # Webhook notification handler
│   │   ├── OrderController.php                       # Order tracking, detail
│   │   └── ...
│   ├── Services/MidtransService.php                  # Snap token, verify payment, override notif URL
│   └── helpers.php                                   # Helper setting()
├── config/midtrans.php                               # Konfig Midtrans env wrapper
├── storage/app/public/
│   ├── products/                                     # Upload gambar produk
│   └── categories/                                   # Upload gambar kategori
```

---

## ⚙️ Konfigurasi

### Warna & Brand (Admin → Pengaturan)

| Setting | Default | Keterangan |
|---------|---------|------------|
| Warna Gold | `#C2A56D` | CTA, badge, harga premium |
| Warna Accent | `#547A95` | Tombol sekunder, link aktif |
| Brand Name | Belanza | Tampil di navbar & footer |
| Brand Logo | — | Upload logo toko |
| WA Number | 6280000000000 | Tujuan checkout WhatsApp |
| Flash Sale End | End of today | Countdown flash sale |

### Tampilan Toko (Admin → Tampilan Toko)

| Setting | Default | Keterangan |
|---------|---------|------------|
| Site Title | Belanza | Judul tab browser & OG title |
| Site Description | Toko fashion premium... | Meta description & OG description |
| Hero Title | Koleksi Terbaru<br>Musim Ini | Teks utama hero banner (HTML ok) |
| Hero Subtitle | Temukan gaya terbaikmu... | Teks pendukung hero |
| Hero Image | Unsplash default | Gambar banner utama (upload) |
| CTA Text | Shop Now → | Teks tombol hero |
| CTA Link | /products | Tujuan tombol hero |
| Banner Title | Free Ongkir > Rp 200rb | Top bar promo |

---

## 🛠️ Tech Stack

- **Backend:** Laravel 13, PHP 8.3, MySQL
- **Frontend:** Bootstrap 5, CSS Variables, Google Fonts (Playfair Display + DM Sans)
- **Assets:** Bootstrap static files (`public/bootstrap/`) — **no Vite/npm**
- **Cart:** Session-based
- **Payment:** Midtrans Snap (popup) + Bank Transfer manual
- **Shipping:** Weight-based (cost per kg per kota)
- **Images:** Upload ke `storage/app/public/{products,categories}/` — akses via `$model->image_url`
- **Session/Cache/Queue:** Database driver
