# **Tugas 7: Elemen Dasar Flutter**

Nama    : Amanda Christie Tarigan

NPM     : 2106751322

Kelas   : PBP-D

## 👩🏻‍💻 **Stateless Widget dan Stateful Widget** 👩🏻‍💻

Stateless widget adalah widget yang bersifat statis, artinya state dari widget tersebut tidak dapat diubah setelah widget tersebut dibuat. Contoh dari stateless widget adalah Icon, IconButton, dan Text. Misalnya, kita mempunyai widget text yang berisi "Belajar Flutter menyenangkan", maka widget text tersebut akan selalu sama mulai dari text dibuat hingga aplikasi dijalankan.

Stateful widget adalah widget yang bersifat dinamis, artinya state dari widget tersebut dapat diubah setelah widget tersebut dibuat. Jika terjadi event sebagai hasil interaksi oleh user, maka widget tersebut dapat memperbarui tampilannya sebagai respons dari pemicu tersebut. Contoh dari stateful widget adalah Checkbox, Radio, Slider, dan Form. 

## 📱 **Widget yang Dipakai** 📱

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

## 👆🏻 **Fungsi `setState()`** 👆🏻

Ketika state dari widget berubah, maka state object akan memanggil fungsi `setState()` untuk memberitahu widget bahwa ada object yang berubah pada state, sehingga framework akan menjalankan build ulang pada widget tersebut. Oleh karena itu `setState()` hanya dipanggil di Stateful Widget. 

Pada aplikasi counter_7, fungsi `setState()` berpengaruh pada variabel counter. Saat tombol + (increment) diklik, maka akan dipanggil fungsi `setState()` untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_incrementCounter` akan di-run kembali, `onPressed: _incrementCounter`. Kemudian variabel counter akan ditambah sebanyak satu satuan.

Saat tombol - (decrement) diklik, maka akan dipanggil fungsi `setState()` untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_decrementCounter` akan di-run kembali, `onPressed: _decrementCounter`. Kemudian variabel counter akan dikurangi sebanyak satu satuan.

## 📋 **Perbedaan const dan final** 📋

Dart memiliki sifat variabel immutable, yaitu variabel yang tidak bisa berubah setelah diinisialisasi. Jika kita mencoba untuk meng-assign kembali nilai pada variabel immutable, maka program akan menampilkan pesan error.

Variabel immutable dapat dideklarasikan dengan keyword `final` dan `const`. Keyword `final` dan `const` membuat perilaku variabel menjadi tidak dapat diubah setelah diinisialisasi sehingga tidak ada operasi apa pun yang dilakukan pada variabel tersebut untuk mengubah nilainya. 

Namun, perbedaan keduanya adalah `final` dapat digunakan untuk mendeklarasi variabel immutable yang nilai variabelnya sudah atau belum diketahui pada saat waktu kompilasi atau nilai variabel `final` akan diketahui pada saat run-time. Sementara, `const` dapat digunakan untuk mendeklarasi variabel immutable yang nilainya konstan dan harus sudah diketahui pada saat waktu kompilasi berjalan. Oleh karena itu, nilai dari variabel `const` harus sudah di-assign secara langsung.

## 🎊 **Implementasi Checklist dan Bonus** 🎊

✅ **Membuat sebuah program Flutter baru dengan nama counter_7** dengan cara membuka terminal dan masuk ke direktori sesuai dengan keinginan, lalu menjalankan perintah `flutter create counter_7`.

✅ **Mengubah tampilan program menjadi seperti pada soal.**
Untuk menampilkan tampilan program menjadi seperti pada soal, kita inisiasikan home dan membuat class `MyHomePage` dengan pengaturan `title: 'Program Counter'`. Untuk tampilan konten body akan diatur pada implementasi poin berikutnya.

✅ **Mengimplementasikan logika berikut pada program**

**1. Tombol + menambahkan angka sebanyak satu satuan.** Pertama, kita perlu mendeklarasikan variabel counter `int _counter = 0;`. Kemudian, kita buat method untuk menambahkan angka sebanyak satu satuan. Ketika tombol + diklik, maka fungsi `setState()` akan dipanggil dari method berikut ini. 
```
void _incrementCounter() {
    setState(() {
      _counter++;
    });
}
```

**2. Tombol - mengurangi angka sebanyak satu satuan.** Kita buat method untuk mengurangi angka sebanyak satu satuan. Ketika tombol - diklik, maka fungsi `setState()` akan dipanggil dari method berikut ini. 
```
void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
}
```

**3. Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.**
```
else ...[
    const Text(
        'GANJIL',
        style: TextStyle(color: Colors.blue),
    )
]
```
Jika hasil modulo counter dengan 2 tidak sama dengan nol (kondisi lainnya dari poin 4), maka teks yang ditampilkan adalah "GANJIL" dan diberi attribute style dengan warna biru. 

**4. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.**
```
if (_counter % 2 == 0) ...[
    const Text(
        'GENAP',
        style: TextStyle(color: Colors.red),
    )
]
```
Jika hasil modulo counter dengan 2 sama dengan nol, maka teks yang ditampilkan adalah "GENAP" dan diberi attribute style dengan warna merah. 

**5. Angka 0 dianggap sebagai angka genap.** Jika counter bernilai 0, maka akan masuk ke kondisi poin 4 karena `0 % 2 == 0` dan teks yang ditampilkan adalah "GENAP". 

**6. BONUS: Menyembunyikan/menghilangkan tombol - apabila counter bernilai 0.**
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

# **Tugas 8: Flutter Form**

Nama    : Amanda Christie Tarigan

NPM     : 2106751322

Kelas   : PBP-D

## 🛡️ **Perbedaaan Navigator.push dan Navigator.pushReplacement** 🛡️

`Navigator.push` adalah suatu method yang digunakan untuk menimpa halaman sebelumnya dengan menambahkan rute atau page lain di atas page saat ini. Halaman baru ditampilkan di atas halaman sebelumnya. 
`Navigator.pushReplacement` adalah mengganti route yang ada di stack navigasi dengan route baru serta melakukan push page baru dan menghapus atau menghilangkan page/routing lama atau yang sebelumnya digunakan. Pada method `Navigator.push`, halaman sebelumnya masih dapat diakses jika sewaktu-waktu ingin diakses kembali. Berbeda halnya dengan `Navigator.pushReplacement` dimana page sebelumnya akan dihapus ketika page baru sudah ditambahkan sehingga page sebelumnya akan digantikan dengan page yang baru. Dengan begitu, halaman tidak dapat berpindahkan ke halaman sebelumnya.

## 📱 **Widget yang Dipakai** 📱

| No | Widget | Fungsi |
| -- | ------------- | ------------- |
| 1  | Card  | Membuat tampilan kotak-kotak dengan efek bayangan di tepi |
| 2  | TextButton | Menampilkan button yang dapat diberi tulisan |
| 3  | TextFormField  | Menampilkan fungsionalitas input text |
| 4  | Form  | Membuat fitur Form yang menerima input dari pengguna |
| 5  | Drawer  | Membuat fitur navigasi menuju page lain |
| 6  | DropdownButton  | Membuat button yang dapat memunculkan beberapa pilihan sebagai opsi input pemasukan atau pengeluaran |
| 7  | Expanded  | Mengatur size child widget agar mengisi tempat yang tersedia  |
| 8  | Dialog  | Menampilkan pop up window pada halaman aplikasi  |
| 9  | ListTile  | Menampilkan *single fixed-height row* yang menampung teks sebagai leading dan trailing  |
| 10  | ListView  | Menampilkan widget lain yang merupakan *child*-nya  |
| 11  | Padding  | Mengatur padding pada widget yang menjadi *child*-nya  |
| 12  | SizedBox  | Mengatur ukuran serta memberikan jarak antar widget  |

## 🎫 **Jenis-jenis event yang ada pada Flutter** 🎫

- onTap: event yang terjadi ketika widget di-*tap*.
- onPressed: event yang terjadi ketika widget di tekan.
- onChanged: event yang terjadi ketika widget diubah.
- onSaved: event yang terjadi ketika widget disimpan.
- onExit: event yang terjadi ketika ingin menutup aplikasi.

## ⚙️ **Cara kerja Navigator dalam "mengganti" halaman aplikasi Flutter** ⚙️

Navigator mengganti halaman dengan memanfaatkan sebuah Stack. Halaman yang ditampilkan di paling atas yang ditampilkan untuk user merupakan halaman yang terdapat pada top of stack. Mengganti halaman dapat memanfaatkan push untuk menimpa halaman sebelumnya, pushReplacement untuk mengganti halaman sebelumnya, pop untuk kembali ke halaman sebelumnya, dll. Navigator mengatur stack of route dengan menggunakan dua cara, yaitu `Navigator.push` dan `Navigator.pop`. Apabila user ingin berpindah ke halaman sebelumnya, dapat diterapkan operasi pop agar halaman yang pada saat itu berada paling atas dapat dikeluarkan sehingga halaman sebelumnya menggantikan posisinya menjadi top of stack. 

## 📋 **Implementasi Checklist** 📋
✅ Dengan menggunakan aplikasi counter_7 yang telah dibuat pada tugas sebelumnya, ditambahkan file `budget.dart`, `dataBudget.dart`, `drawer.dart`, dan `formBudget.dart` ke dalam folder `lib`.

✅ Menambahkan tiga tombol navigasi pada `drawer.dart` untuk ke halaman counter, halaman form, halaman yang menampilkan data budget yang telah di-input melalui form.

```Dart 
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 12,
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              // Route menu ke halaman form
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);
              // Route menu ke halaman data budget
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyDataPage()),
              );
            },
          ),
        ],
      ));
}
```

✅ Menambahkan models pada file baru `budget.dart` yang memanfaatkan struktur data seperti List untuk menyimpan data yang dibuat.
```Dart
class Budget {
  static List<Budget> budgets = [];
  String judul;
  int nominal;
  String tipe;
  DateTime date;

  Budget({
    required this.judul,
    required this.nominal,
    required this.tipe,
    required this.date,
  });

  static void addBudget({
    required judul,
    required nominal,
    required tipe,
    required date,
  }) {
    budgets.add(Budget(
      judul: judul,
      nominal: nominal,
      tipe: tipe,
      date: date,
    ));
  }
}
```

✅ Menambahkan file baru `dataBudget.dart` untuk menampilkan data budget semua judul, nominal, dan tipe budget yang telah ditambahkan pada form.

✅ Menambahkan file baru `formBudget.dart` untuk membuat Form dan Elemen Input. Di halaman form, terdapat widget input judul, nominal, tipe, date, dan button untuk submit form. Dengan menginisialisasi variabel elemen input dengan tipe data String berupa judul budget, tipe data int berupa nominal budget, tipe budget dengan pilihan pemasukan dan pengeluaran serta menambahkan button untuk menyimpan budget.

✅ Menjalankan proyek program Flutter dengan `flutter run` pada `cmd`.

✅ Melakukan `add-commit-push` proyek ke repositori `pbp-flutter-lab`.

## 🎊 **Implementasi Bonus** 🎊

✅ Menambahkan elemen date picker pada halaman form.
```Dart
TextButton(
  onPressed: (() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2999),
    ).then((value) {
      setState(() {
        _date = value;
      });
    });
  }),
```
✅ Menampilkan elemen date (format bebas) pada setiap elemen budget yang ada pada halaman data budget.
```Dart
  child: ListTile(
      title: Text("${budget.judul}\n${budget.nominal}"),
      subtitle: Text(budget.date.toString().split(' ')[0]),
      trailing: Text(budget.tipe)),
);
}).toList(),
```
✅ Refactor widget Drawer ke sebuah file terpisah.
```Dart
Widget build(BuildContext context) => Drawer(
      child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildMenuItems(context),
            ]),
      ),
    );
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
