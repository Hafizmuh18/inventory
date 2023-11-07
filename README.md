# inventory

A new Flutter project.
Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
 Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
 Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)


---------------------------------Tugas 7---------------------------------  
1. - Stateless Widget : Widget yang digunakan ketika memerlukan sistem UI yang tidak dynamic, yaitu yang tidak memerlukan respon perubahan di tiap interaksi yang dilakukan. Perubahan yang terjadi pada stateless widget disebabkan oleh faktor-faktor external nya seperti diakibatkan oleh parentnya.  
- Statefull Widget : Widget yang digunakan jika kita memerlukan sistem UI yang dynamic dan interaktif, yang berarti ketika diinginkan untuk terjadi suatu perubahan di dalam UI tiap kali terjadi suatu interaksi. 
2. Widget yang digunakan : 
    - InkWell : Untuk memberikan efek responsif terhadap interaksi pengguna seperti ketika tombol atau area tampilan ditekan.  
    - Container : Widget dasar yang digunakan untuk mengatur tampilan dan layout serta dapat menggunakannya untuk mengatur ukuran, warna latar belakang, dan padding dari widget-child yang berada di dalamnya
    - Center : Widget yang meletakan posisi anaknya ke bagian tengah dirinya
    - Coloumn : Widget yang mengatur tampilan anaknya menjadi sebuah array yang vertikal
    - Icon : Wwidget yang digunakan untuk menampilkan ikon. Anda dapat memberikan ikon khusus yang ingin ditampilkan, misalnya, ikon dari Icons Flutter atau ikon kustom.
    - Text : Widget yang menampilakan text string dengan single style.
    - SingleChildScrollView : Widget yang digunakan untuk membuat area konten dapat di-scroll. Ini berguna saat Anda memiliki konten yang melebihi ukuran layar dan Anda ingin memastikan pengguna dapat menggulirnya
    - Padding : Widget yang mengatur padding dari anak-anaknya sesuai dengan padding yang diberikan.
    - GridView : Sebuah scrollable widget yang membentuk 2D array, widget yang digunakan untuk membuat grid layout dari widget. Anda dapat mengatur jumlah item per baris atau kolom, serta cara item akan tersusun.
3. Implementasi checklist :
    - Membuat file baru 'menu.dart' untuk menampilkan halaman menu, lalu membuat class 'MyHomePage' untuk mengatur tampilan dari halaman home.
    - Membuat 2 class baru yaitu class 'ShopItem' sebagai class untuk item dan class 'ShopCard' untuk mengatur model tampilan dari tiap item yang dibuat.
    - Membuat array item-item yang akan ditampilkan di halaman home.
    - Membuat widget-widget untuk mengatur tampilan dari home secara berurutan, mulai dari ScrollView lalu Padding hingga content item-item dari array yang dibuat.