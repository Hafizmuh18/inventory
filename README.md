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

----------------------------------------- TUGAS 8 -----------------------------------------

1. Perbedaan utama dari Navigator.push() dan Navigator.pushReplacement() adalah pada Navgator.push(), layar yang baru akan dimasukan ke tumpukan stack dari layar-layar yang ada, sehingga jika ada pemanggilan Navigator.pop(), ayar akan kembali ke dalam layar sebelumnya. Sedangkan untuk Navigator.pushReplacement(), layar baru akan dimasukan ke dalam stack/tumpukan layar dengan menggantikan layar yang saat ini ditampilkan, sehingga ketika layar yang baru tersebut di Navigator.pop() ia tidak akan kembali ke layar yang sebelumnya, karena layar yang sebelumnya sudah tidak ada di dalam stack.
Contoh :
- Pada Navigator.push(), misalkan pada saat ini kita berada pada layar MainPage, dan terjadi 
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);
Maka halaman layar akan berganti menampilkan SecondPage, tetapi jika terjadi pemanggilan Navigator.pop(), halaman akan kembali menampilkan MainPage karena MainPage masih terdapat di dalam stack.
- Pada Navigator.pushReplacement(), jika layar saat ini menampilkan MainPage, lalu dilakukan pemanggilan
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);
Maka lyar akan menampilkan SecondPage dengan menggantikan posisi MainPage di dalam stack, jadi jika terjadi pemanggila Navigatot.pop(), layar tidak akan kembali menampilkan MainPage, karena MainPage sudah tidak terdapat di dalam stack.

2. Layout widget:
- Align : Widget yang meletakan posisi anaknya di dalam dirinya sendiri secara opsional mengukur dirinya ssendiri berdasarkan ukuran anaknya tersebut.
- Center : Widget yang meletakan anaknya di tengah-tengah dari dirinya sendiri.
- Container : Widget yang menggabungkan painting, positioning dan sizing dari widget-widget di dalamnya.
- Padding : Widget yang memasukan anak-anak di dalamnya sesuai dengan padding yang diberikan.
- Colomn : Widget yang menampilkan anak-anaknya dengan pemodelan array yang vertikal.
- GridView : Widget di dalam flutter yang ddigunakan untuk menampilkan anak-anaknya dengan pemodelan tata letak grid.
- Row : Widget yang menampilkan anak-anaknya dengan pemodelan array yang horizontal.

3. 

Pada kode yang diberikan, Anda menggunakan beberapa elemen input pada formulir (form). Berikut adalah elemen-elemen input yang digunakan dan penjelasannya:

- TextFormField untuk Nama (_name):

Tipe Input: String
Tujuan: Digunakan untuk mengambil input nama peralatan.
Validasi: Diperiksa apakah input tidak kosong.
TextFormField untuk Power (_power):

- TextFormField untuk Power (_power):

Tipe Input: String (diubah menjadi int dalam _power)
Tujuan: Mengambil input daya peralatan.
Validasi: Diperiksa apakah input tidak kosong dan apakah dapat diubah menjadi integer.
TextFormField untuk Amount (_amount):

- TextFormField untuk Amount (_amount):

Tipe Input: String (diubah menjadi int dalam _amount)
Tujuan: Mengambil input jumlah peralatan.
Validasi: Diperiksa apakah input tidak kosong dan apakah dapat diubah menjadi integer.
TextFormField untuk Type (_type):

- TextFormField untuk Type (_type):

Tipe Input: String
Tujuan: Mengambil input jenis peralatan.
Validasi: Diperiksa apakah input tidak kosong.
TextFormField untuk Skill (_skill):

- TextFormField untuk Skill (_skill):

Tipe Input: String
Tujuan: Mengambil input keterampilan yang terkait dengan peralatan.
Validasi: Diperiksa apakah input tidak kosong.
TextFormField untuk Description (_description):

- TextFormField untuk Description (_description):

Tipe Input: String
Tujuan: Mengambil input deskripsi peralatan.
Validasi: Diperiksa apakah input tidak kosong.

4. Dengan memasukan file-file yang berguna sebagai widget ke dalam foleder tersenderi, dalam hal ini drawer.dart yang berguna untuk menampilkan sebuah drawer di aplikasi dimasukan ke dalam folder drawer.dart agar dapat tetap mengikuti track file-file dart yang ada didlam lib.

5. 
- Membuat folder widget dan didalamnya membuat file drawer.dart, kemudian membuat class widget baru yang akan difungsionalitaskan sebagai drawer dari aplikasi mobile.
- Memanggil file drawer.dart dan menjadikannya drawer di file-file lain yang memerlukan tampilan drawer.
- Membuat file equipment_form.dart yang akan digunakan sebagai halaman dari form yang akan meminta user untuk memasukan input yang diinginkan dengan membuat attribute-attribute yang akan menyimpan input, dan juga widget-widget tempat user memasukan input beserta dengan validasi dari input yang user masukan.
- Melakukan routing ke dalam button-button yang ada di drawer dan halaman home untuk mendirect ke layar yang sesuai, seperti button add equpment akan mendirect halaman ke layar equipment_form.dart.
- Membuat class baru, class Equipment dan juga membuat list yang akan menyimpan Equipmnet-equipment yang ada, kemudian menambahkan pada bagian onpressed button menyimpan equipment akkan membuat object equipment baru berdasarkan input dan memasukannya ke dalam list.
- Membuat halaman yang akan menampilkan object-object Equipment yang sudah dibuat, dengan melakukan iterasi pada list equipment yang sudah dibuat sebelumnya dan membuat tiap object equipment yang ada ke dalam bentuk card.