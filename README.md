# **Tugas 7: Elemen Dasar Flutter**

Nama    : Amanda Christie Tarigan

NPM     : 2106751322

Kelas   : PBP-D

## 👩🏻‍💻 **Stateless Widget dan Stateful Widget**

Stateless widget adalah widget yang bersifat statis, artinya state dari widget tersebut tidak dapat diubah setelah widget tersebut dibuat. Contoh dari stateless widget adalah Icon, IconButton, dan Text. Misalnya, kita mempunyai widget text yang berisi "Belajar Flutter menyenangkan", maka widget text tersebut akan selalu sama mulai dari text dibuat hingga aplikasi dijalankan.

Stateful widget adalah widget yang bersifat dinamis, artinya state dari widget tersebut dapat diubah setelah widget tersebut dibuat. Jika terjadi event sebagai hasil interaksi oleh user, maka widget tersebut dapat memperbarui tampilannya sebagai respons dari pemicu tersebut. Contoh dari stateful widget adalah Checkbox, Radio, Slider, dan Form. 

## 📱 **Widget yang Dipakai**

| No | Widget | Fungsi |
| -- | ------------- | ------------- |
| 1  | MaterialApp  | Mengatur segala route dan theme dari aplikasi |
| 2  | AppBar | Menampilkan bar aplikasi yang berisi title |
| 3  | Row  | Menampilkan widget-widget secara horizontal |
| 4  | Column  | Menampilkan widget-widget secara vertikal |
| 5  | Container  | Membungkus widget lain sehingga dapat diberikan nilai margin, padding, dan dekorasi |
| 6  | FloatingActionButton  | Membuat button yang dapat dimodifikasi event di dalamnya |
| 7  | Scaffold  | Membuat sebuah halaman pada flutter  |
| 8  | Spacer  | Membuat jarak antar widget |
| 9  | Icon  | Menggunakan icon yang telah disediakan |
| 10 | Text  | Menampilkan sebuah teks biasa |
| 11 | Center  | Agar posisi widget berada di tengah  |

## 👆🏻 **Fungsi `setState()`**

Ketika state dari widget berubah, maka state object akan memanggil fungsi `setState()` untuk memberitahu widget bahwa ada object yang berubah pada state, sehingga framework akan menjalankan build ulang pada widget tersebut. Oleh karena itu `setState()` hanya dipanggil di Stateful Widget. 

Pada aplikasi counter_7, fungsi `setState()` berpengaruh pada variabel counter. Saat tombol + (increment) diklik, maka akan dipanggil fungsi `setState()` untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_incrementCounter` akan di-run kembali, `onPressed: _incrementCounter`. Kemudian variabel counter akan ditambah sebanyak satu satuan.

Saat tombol - (decrement) diklik, maka akan dipanggil fungsi `setState()` untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_decrementCounter` akan di-run kembali, `onPressed: _decrementCounter`. Kemudian variabel counter akan dikurangi sebanyak satu satuan.

## 📋 **Perbedaan const dan final**

Dart memiliki sifat variabel immutable, yaitu variabel yang tidak bisa berubah setelah diinisialisasi. Jika kita mencoba untuk meng-assign kembali nilai pada variabel immutable, maka program akan menampilkan pesan error.

Variabel immutable dapat dideklarasikan dengan keyword `final` dan `const`. Keyword `final` dan `const` membuat perilaku variabel menjadi tidak dapat diubah setelah diinisialisasi sehingga tidak ada operasi apa pun yang dilakukan pada variabel tersebut untuk mengubah nilainya. 

Namun, perbedaan keduanya adalah `final` dapat digunakan untuk mendeklarasi variabel immutable yang nilai variabelnya sudah atau belum diketahui pada saat waktu kompilasi atau nilai variabel `final` akan diketahui pada saat run-time. Sementara, `const` dapat digunakan untuk mendeklarasi variabel immutable yang nilainya konstan dan harus sudah diketahui pada saat waktu kompilasi berjalan. Oleh karena itu, nilai dari variabel `const` harus sudah di-assign secara langsung.

## 🎊 **Implementasi Checklist dan Bonus**

✅ Membuat sebuah program Flutter baru dengan nama counter_7 dengan cara membuka terminal dan masuk ke direktori sesuai dengan keinginan, lalu menjalankan perintah `flutter create counter_7`.

✅ Mengubah tampilan program menjadi seperti pada soal.
Untuk menampilkan tampilan program menjadi seperti pada soal, kita inisiasikan home dan membuat class `MyHomePage` dengan pengaturan `title: 'Program Counter'`. Untuk tampilan konten body akan diatur pada implementasi poin berikutnya.

✅ Mengimplementasikan logika berikut pada program

1. Tombol + menambahkan angka sebanyak satu satuan.
Pertama, kita perlu mendeklarasikan variabel counter `int _counter = 0;`.
Kemudian, kita buat method untuk menambahkan angka sebanyak satu satuan. Ketika tombol + diklik, maka fungsi `setState()` akan dipanggil dari method berikut ini. 
```
void _incrementCounter() {
    setState(() {
      _counter++;
    });
}
```

2. Tombol - mengurangi angka sebanyak satu satuan.
Kita buat method untuk mengurangi angka sebanyak satu satuan. Ketika tombol - diklik, maka fungsi `setState()` akan dipanggil dari method berikut ini. 
```
void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
}
```

3. Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.
```
else ...[
    const Text(
        'GANJIL',
        style: TextStyle(color: Colors.blue),
    )
]
```
Jika hasil modulo counter dengan 2 tidak sama dengan nol (kondisi lainnya dari poin 4), maka teks yang ditampilkan adalah "GANJIL" dan diberi attribute style dengan warna biru. 

4. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.
```
if (_counter % 2 == 0) ...[
    const Text(
        'GENAP',
        style: TextStyle(color: Colors.red),
    )
]
```
Jika hasil modulo counter dengan 2 sama dengan nol, maka teks yang ditampilkan adalah "GENAP" dan diberi attribute style dengan warna merah. 

5. Angka 0 dianggap sebagai angka genap. Jika counter bernilai 0, maka akan masuk ke kondisi poin 4 karena `0 % 2 == 0` dan teks yang ditampilkan adalah "GENAP". 

6. BONUS: Menyembunyikan/menghilangkan tombol - apabila counter bernilai 0.
```
if (_counter != 0) ...[
    FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove))
], 
const Spacer(),
    FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add))
])
```
Jika nilai counter tidak sama dengan 0, maka tombol yang akan ditampilkan adalah tombol + dan -. Sementara, jika nilai counter sama dengan 0, maka tombol yang akan ditampilkan hanya tombol +.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
