## Tugas 7

**Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.**

Dalam Flutter, setiap elemen antarmuka pengguna disebut sebagai *widget*. Segala hal seperti teks, tombol, tata letak, hingga keseluruhan aplikasi tersusun dari widget. Untuk membentuk tampilan aplikasi, Flutter menggunakan struktur hierarki yang disebut *widget tree*. Sesuai namanya, *widget tree* menggambarkan susunan berbentuk pohon, di mana setiap simpul (node) merepresentasikan sebuah widget. Konsep ini digunakan Flutter untuk menyusun UI berdasarkan hubungan antarwidget yang bersifat hirarkis, yaitu relasi induk dan anak (*parent-child relationship*). Struktur ini mempermudah pengelolaan tampilan karena Flutter hanya akan membangun ulang bagian yang berubah ketika ada interaksi pengguna, seperti saat data diperbarui atau tombol ditekan. Dengan begitu, pembaruan tampilan menjadi lebih efisien.

Dalam struktur ini, satu widget dapat bertindak sebagai *parent* yang membungkus satu atau beberapa *child*. *Parent widget* berperan dalam mengatur posisi, ukuran, dan perilaku dari widget anaknya, sedangkan *child widget* merupakan widget yang berada di dalam *parent*. Misalnya, pada contoh `Center(child: Text("hi"))`, widget *Text* adalah *child* dari *Center*, dan *Center* mengatur agar teks tersebut muncul di tengah layar. Ada widget yang hanya bisa memiliki satu *child* seperti *Center*, *Container*, atau *Padding*, tetapi ada pula yang dapat menampung banyak *child* melalui properti *children*, contohnya *Row*, *Column*, *GridView*, dan *ListView*. Satu widget juga bisa berperan ganda sebagai *parent* dan *child* sekaligus, tergantung pada posisinya di dalam *widget tree*. Dengan demikian, *widget tree* membentuk hierarki di mana akar (root) menjadi induk utama dari keseluruhan widget lain di bawahnya.

---

**Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**

### Widget pada *menu.dart*

* **Scaffold**: Widget utama yang menjadi kerangka dasar halaman, menyediakan struktur untuk *AppBar*, *Body*, dan komponen lain seperti *FloatingActionButton*.
* **AppBar**: Menampilkan bagian atas halaman atau *header* yang berisi judul aplikasi, dalam proyek ini menampilkan teks “TokoOlahraga BeliYuk”.
* **Text**: Digunakan untuk menampilkan tulisan di layar dan dapat dikustomisasi dengan warna, gaya huruf, serta ukuran.
* **Padding**: Memberikan jarak di sekitar widget yang dibungkusnya. Contohnya `Padding(padding: const EdgeInsets.all(16))` memberi jarak 16 piksel dari tepi layar.
* **Column**: Menyusun elemen secara vertikal dari atas ke bawah, digunakan untuk menata konten di halaman utama.
* **SizedBox**: Menyediakan ruang kosong di antara widget dengan tinggi atau lebar tertentu.
* **Card**: Menampilkan elemen dalam bentuk kartu dengan efek bayangan untuk tampilan lebih menonjol, seperti kartu berisi data diri.
* **Row**: Menyusun elemen secara horizontal, misalnya untuk menampilkan ikon dan teks secara sejajar.
* **Icon**: Menampilkan ikon dari pustaka *Icons*, misalnya ikon profil atau tombol menu.
* **RichText** & **TextSpan**: Menampilkan teks dengan beberapa gaya berbeda dalam satu baris, contohnya untuk membedakan teks nama tebal dan biasa.
* **GridView.count**: Mengatur tampilan dalam bentuk grid dengan jumlah kolom tertentu, misalnya tiga menu utama.
* **Material**: Menyediakan efek dan tampilan khas *Material Design*, seperti bayangan dan warna latar.
* **InkWell**: Memberikan efek gelombang (*ripple effect*) ketika elemen disentuh.
* **Container**: Bertindak sebagai wadah yang bisa mengatur ukuran, warna, atau margin dari widget anaknya.
* **SnackBar** & **ScaffoldMessenger**: Menampilkan notifikasi sementara di bagian bawah layar sebagai respon interaksi pengguna.
* **Center**: Memposisikan widget anak tepat di tengah ruang yang tersedia.

### Widget pada *main.dart*

* **MaterialApp**: Menjadi *root widget* aplikasi berbasis *Material Design*, mengatur tema, judul, dan halaman awal.
* **MyApp (StatelessWidget)**: Membungkus keseluruhan aplikasi dan memanggil *MaterialApp*.
* **MyHomePage (StatelessWidget)**: Menyusun tampilan utama aplikasi dengan struktur *Scaffold*, *AppBar*, dan *Body*.

---

**Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.**

*MaterialApp* adalah widget utama yang menyediakan kerangka dasar aplikasi *Material Design*. Ia berfungsi sebagai *parent* yang membungkus seluruh komponen aplikasi Flutter dan mengatur tema global, struktur halaman, serta navigasi antarhalaman. Melalui properti seperti *theme*, *colorScheme*, dan *fontFamily*, pengembang dapat menentukan gaya visual aplikasi secara konsisten. Properti *home* digunakan untuk menentukan halaman pertama yang muncul saat aplikasi dijalankan.

Selain itu, *MaterialApp* juga mendukung navigasi antarhalaman melalui sistem *routes* dan *Navigator*. Fitur lain seperti *localizationsDelegates* dan *title* membantu dalam pengaturan bahasa serta nama aplikasi. Tanpa *MaterialApp*, banyak widget seperti *Scaffold*, *Theme.of(context)*, dan *SnackBar* tidak akan berfungsi dengan benar karena mereka membutuhkan konteks *Material Design*. Oleh sebab itu, *MaterialApp* hampir selalu ditempatkan sebagai *root widget* agar seluruh widget di bawahnya dapat menggunakan konteks dan tema global yang sama.

---

**Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**

Flutter membagi widget menjadi dua jenis utama: *StatelessWidget* dan *StatefulWidget*.

*StatelessWidget* digunakan untuk tampilan yang bersifat tetap dan tidak berubah meskipun ada interaksi pengguna. Semua data di dalamnya bersifat statis. Jika terjadi perubahan data, maka widget perlu dibuat ulang dari awal. Contohnya adalah tampilan teks, ikon, atau tombol yang tidak mengubah tampilannya ketika diklik. Karena itu, *StatelessWidget* cocok untuk bagian UI yang tidak bergantung pada data dinamis atau input pengguna.

Sebaliknya, *StatefulWidget* memiliki *state* yang dapat berubah selama aplikasi berjalan. Ia terdiri dari dua bagian: kelas *StatefulWidget* sebagai kerangka, dan kelas *State* yang menyimpan data dinamis. Jika terjadi perubahan pada data, Flutter memanggil `setState()` untuk memperbarui tampilan. Proses ini memungkinkan pembaruan UI tanpa perlu memuat ulang seluruh aplikasi. Contohnya adalah counter yang nilainya bertambah saat tombol ditekan, form input, atau tampilan dinamis lainnya. *StatefulWidget* digunakan saat tampilan memerlukan interaksi atau pembaruan data secara real-time.

---

**Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?**

*BuildContext* adalah objek yang merepresentasikan posisi suatu widget di dalam *widget tree*. Objek ini memungkinkan Flutter mengetahui di mana widget berada dan bagaimana hubungannya dengan widget lain di sekitarnya. Setiap widget di Flutter memiliki *BuildContext*-nya sendiri.

*BuildContext* digunakan untuk berbagai hal penting seperti mengambil tema aplikasi (`Theme.of(context)`), melakukan navigasi antarhalaman (`Navigator.push(context, ...)`), atau mengakses data dari widget *parent*. Flutter selalu menyertakan parameter *context* di dalam metode `build()` agar widget dapat mengakses informasi dari lingkungannya. Tanpa *BuildContext*, widget tidak bisa mengetahui letaknya dalam hierarki atau mengakses data yang diwariskan dari *ancestor*. Karena itu, *BuildContext* menjadi elemen penting yang menghubungkan antarwidget di dalam struktur aplikasi.

---

**Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**

*Hot reload* adalah fitur yang memungkinkan pengembang melihat perubahan kode secara langsung tanpa memulai ulang aplikasi. Saat kode disimpan, Flutter hanya mengompilasi bagian yang berubah dan memperbarui tampilan menggunakan *Dart VM* tanpa menghapus *state* yang sedang berjalan. Prosesnya cepat, seringkali hanya membutuhkan waktu kurang dari satu detik, sehingga sangat membantu untuk menguji perubahan UI, memperbaiki bug kecil, atau menyesuaikan desain secara langsung.

Sementara itu, *hot restart* memuat ulang seluruh aplikasi dari awal dan menghapus seluruh *state*. Proses ini lebih lambat dibandingkan *hot reload* karena semua variabel dan data diinisialisasi ulang, tetapi tetap lebih cepat daripada menjalankan ulang aplikasi secara manual. *Hot restart* digunakan ketika perubahan melibatkan logika inisialisasi, variabel global, atau struktur aplikasi utama yang tidak bisa diperbarui hanya dengan *hot reload*.

Berikut versi **parafrase** dari teks yang kamu berikan, dengan makna dan isi tetap sama namun gaya penulisan lebih ringkas dan natural:


## Tugas 8

### **Perbedaan antara Navigator.push() dan Navigator.pushReplacement()**

Meskipun terlihat serupa, `Navigator.push()` dan `Navigator.pushReplacement()` memiliki fungsi yang berbeda dalam pengelolaan navigasi halaman pada Flutter. Keduanya menggunakan widget `Navigator` yang bekerja berdasarkan prinsip stack, di mana halaman terakhir yang dibuka berada di posisi paling atas.
`Navigator.push()` berfungsi untuk menambahkan halaman baru di atas halaman aktif, sehingga pengguna masih dapat kembali ke halaman sebelumnya dengan `Navigator.pop()`. Dalam aplikasi **Football Shop**, metode ini cocok digunakan saat pengguna menekan tombol *Tambah Produk*, karena setelah mengisi form, mereka masih bisa kembali ke halaman utama. Dengan demikian, `Navigator.push()` sesuai untuk situasi di mana pengguna mungkin ingin kembali ke halaman sebelumnya.
Sebaliknya, `Navigator.pushReplacement()` menggantikan halaman aktif dengan halaman baru tanpa menumpuknya. Halaman lama akan dihapus dari stack sehingga tidak bisa diakses kembali. Pada **Football Shop**, metode ini ideal setelah pengguna menekan tombol *Save* di form penambahan produk. Setelah data tersimpan, pengguna diarahkan langsung ke halaman utama tanpa bisa kembali ke form. Pendekatan ini efisien dan memberikan pengalaman pengguna yang lebih baik untuk alur satu arah seperti pengisian form. Jadi, `Navigator.pushReplacement()` cocok digunakan ketika pengguna tidak perlu kembali ke halaman sebelumnya.

---

### **Pemanfaatan Scaffold, AppBar, dan Drawer untuk Konsistensi Struktur Halaman**

Konsistensi tampilan sangat penting agar pengguna mudah memahami dan mengingat struktur aplikasi. Untuk mencapainya, digunakan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer`.
`Scaffold` menjadi kerangka utama di setiap halaman yang menyediakan struktur dasar bagi komponen seperti `AppBar` dan `Drawer`, memastikan tampilan antarhalaman seragam. `AppBar` digunakan di bagian atas untuk menampilkan judul halaman seperti *TokoOLahraga BeliYuk* atau *Add Product Form*, membantu pengguna mengenali konteks halaman yang sedang diakses.
Sementara itu, `Drawer` berfungsi sebagai menu navigasi di sisi kiri layar agar pengguna dapat berpindah antarhalaman dengan mudah. Dalam proyek ini, `Drawer` berisi dua opsi utama, yaitu *Halaman Utama* dan *Tambah Produk*. Penerapan `Drawer` yang konsisten di seluruh halaman membantu menjaga keseragaman tampilan dan memudahkan navigasi. Dengan kombinasi ketiganya, struktur halaman aplikasi menjadi konsisten, rapi, dan mudah digunakan.

---

### **Kelebihan Penggunaan Padding, SingleChildScrollView, dan ListView pada Form**

Untuk menampilkan elemen form dengan tampilan yang rapi dan nyaman, Flutter menyediakan berbagai layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView`.
`Padding` digunakan untuk memberikan jarak antar elemen agar tidak tampak sempit dan lebih enak dipandang. `SingleChildScrollView` memungkinkan halaman form dapat digulir ketika jumlah elemen banyak atau layar perangkat kecil, sehingga seluruh form tetap bisa diakses. Sedangkan `ListView` digunakan untuk menampilkan daftar elemen secara vertikal dan sudah mendukung fitur scroll bawaan, menjadikannya efisien untuk daftar yang panjang.
Dalam proyek **TokoOlahraga BeliYuk**, halaman *Add Product Form* memanfaatkan kombinasi `Padding` untuk jarak antar elemen, `SingleChildScrollView` agar bisa digulir, serta `Column` untuk menata komponen secara vertikal. Hasilnya, tampilan form menjadi rapi, responsif, dan nyaman di berbagai ukuran layar.

---

### **Penyesuaian Warna Tema agar Konsisten dengan Identitas Brand**

Agar aplikasi memiliki identitas visual yang kuat, pemilihan warna yang konsisten sangat penting. Dalam proyek ini, fitur `ThemeData` digunakan untuk menentukan *color scheme* utama di file `main.dart`.
Dua warna utama yang digunakan adalah biru tua sebagai *primary color* dan biru muda sebagai *secondary color*, menyesuaikan dengan identitas visual **TokoOlahraga BeliYuk** di website. Warna biru melambangkan semangat dan profesionalisme, sementara kombinasi biru tua dan muda memberikan kesan sporty dan modern.
Warna diterapkan secara konsisten di seluruh aplikasi — misalnya pada `AppBar`, tombol *Save*, dan `Drawer`. Untuk menerapkan warna sesuai tema, digunakan `Theme.of(context).colorScheme.primary` atau `.secondary`, memastikan setiap elemen mengikuti tema global. Dengan pendekatan ini, aplikasi **TokoOlahraga BeliYuk** memiliki identitas visual yang seragam, menarik, dan mudah dikenali pengguna.

## TUGAS 9 PBP

## **1. Alasan Membuat Model Dart saat Mengambil/Mengirim JSON**

Model Dart dibuat agar data JSON yang bentuknya bebas dapat diubah menjadi objek Dart yang memiliki tipe data jelas. Dengan model, setiap field memiliki tipe tertentu sehingga memastikan validasi tipe berjalan sejak compile-time.

Tanpa model dan hanya memakai `Map<String, dynamic>`:

* Validasi tipe dan null-safety tidak terjamin. Kesalahan baru tampak ketika aplikasi dijalankan.
* Rentan typo pada key JSON yang hanya berupa string.
* Sulit dikelola saat proyek makin besar.
* Perubahan API mengharuskan mencari dan memperbaiki key secara manual di banyak file.

Dengan model, struktur data terdokumentasi dengan baik, mudah dipelihara, dan didukung autocomplete IDE.

---

## **2. Fungsi package `http` dan `CookieRequest`**

**http** digunakan untuk membuat request HTTP biasa (GET, POST, dll). Pustaka ini tidak menyimpan sesi atau cookie apa pun, sehingga setiap permintaan bersifat stateless.

**CookieRequest** dari `pbp_django_auth` adalah pembungkus HTTP yang secara otomatis mengelola cookie session Django. Saat login, CookieRequest menyimpan cookie dari Django dan mengirimkannya lagi pada permintaan berikutnya.

**Intinya:**

* `http`: untuk request biasa, tidak mengelola sesi
* `CookieRequest`: menangani autentikasi, menjaga cookie Django tetap melekat di setiap request

---

## **3. Alasan CookieRequest Perlu Dibagikan ke Seluruh Komponen**

CookieRequest menyimpan status autentikasi (session cookie, status login). Jika tiap halaman membuat instance baru, informasi sesi akan hilang dan Django menganggap setiap request datang dari pengguna yang belum login.

Dengan membagikan satu instance yang sama menggunakan Provider:

* Status login konsisten
* Cookie sesi tidak hilang
* Semua halaman bisa mengakses endpoint yang membutuhkan autentikasi

---

## **4. Konfigurasi Konektivitas Flutter ↔ Django**

Beberapa konfigurasi diperlukan agar aplikasi Flutter dapat terhubung dengan Django, terutama ketika memakai emulator Android:

### **a. Menambah 10.0.2.2 di ALLOWED_HOSTS**

Emulator tidak dapat langsung mengakses `localhost` komputer host. Android menyediakan alamat khusus 10.0.2.2 untuk mengakses host machine. Django harus mengizinkan alamat ini.

### **b. Mengaktifkan CORS**

Django perlu diizinkan menerima permintaan dari domain/port berbeda (misalnya browser atau Flutter Web). Tanpa CORS, request dapat diblokir.

### **c. Pengaturan SameSite dan Cookie**

Agar cookie sesi dikirim saat akses lintas domain, perlu pengaturan seperti `SAMESITE=None`. Tanpa ini, cookie mungkin tidak dikirim sehingga sesi gagal terbentuk.

### **d. Menambahkan Permission Internet di Android**

Android memblokir akses jaringan tanpa izin eksplisit. Tanpa permission ini, semua request akan gagal.

**Jika konfigurasi salah:** aplikasi bisa mengalami error seperti *Connection refused*, *403 Forbidden*, hingga gagal login karena cookie tidak dikirim.

---

## **5. Alur Pengiriman dan Penampilan Data**

1. Pengguna memasukkan data ke form Flutter.
2. Flutter memvalidasi lalu mengubah data menjadi JSON.
3. Flutter mengirim POST ke Django melalui CookieRequest.
4. Django memproses data, membuat objek baru, lalu mengirim respons JSON.
5. Flutter melakukan GET untuk mengambil daftar data dari Django.
6. JSON dari Django diubah menjadi model Dart.
7. Data ditampilkan pada UI Flutter menggunakan widget seperti ListView atau FutureBuilder.

---

## **6. Mekanisme Autentikasi (Register → Login → Logout)**

### **Register**

* Flutter mengirim data pendaftaran ke Django.
* Django membuat pengguna baru dan mengembalikan respons.
* Pengguna diarahkan ke halaman login.

### **Login**

* Flutter mengirim username dan password via `request.login()`.
* Django memverifikasi dan membuat session.
* Cookie session dikirim ke Flutter dan disimpan oleh CookieRequest.
* Flutter menandai bahwa pengguna sudah login dan masuk ke menu utama.

### **Logout**

* Flutter memanggil `request.logout()`.
* Django menghapus sesi.
* CookieRequest menghapus cookie lokal.
* Pengguna diarahkan kembali ke halaman login.

---

## **7. Langkah Implementasi Tugas**

1. Mengatur Django untuk menerima request dari Flutter: menambah `django-cors-headers`, mengatur `ALLOWED_HOSTS` dan konfigurasi CORS/cookie.
2. Membuat endpoint login, register, dan logout yang merespons JSON.
3. Di Flutter, memasang provider, http, dan pbp_django_auth serta mengaktifkan izin internet Android.
4. Membagikan instance CookieRequest dengan Provider agar status login konsisten.
5. Membuat form login dan register yang berkomunikasi dengan endpoint Django.
6. Membuat model Dart untuk memetakan JSON ke objek Dart.
7. Membuat halaman daftar produk dan form input produk yang berkomunikasi melalui GET/POST menggunakan CookieRequest.
8. Menambahkan fitur filtering “My Products” menggunakan username dari sesi login.
9. Menambahkan navigasi untuk mengakses semua fitur.


