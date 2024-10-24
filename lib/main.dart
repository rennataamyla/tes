import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> judul = [ // List yang berisi judul dari masing-masing item pastry
      'Croissant',
      'Cromboloni',
      'Donutt ',
      'Bomboloni'
    ];
    
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan tulisan debug
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 228, 191, 156),
          title: const Text(
            "Pastry Mantullll", // Judul di AppBar
            style: TextStyle(fontWeight: FontWeight.bold), // Teks judul dengan font tebal
          ),
          centerTitle: true, // agar judul di tengah AppBar
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Pastry Mantullll")),
              ListTile(
                leading: Icon(Icons.alarm),
                title: Text("Pastry Mantullll"),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0), // Padding untuk layout utama
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Jumlah kolom grid, di sini 2 kolom
              crossAxisSpacing: 20.0, // Jarak antar kolom
              mainAxisSpacing: 20.0, // Jarak antar baris
              childAspectRatio: 0.5, // Rasio aspek untuk masing-masing item grid
            ),
            itemCount: 4, // Total jumlah item di dalam grid (4 item)
            itemBuilder: (BuildContext context, int index) {
              return Card(  // Membuat item dalam grid menggunakan Card
              color: Color.fromARGB(255, 228, 191, 156),
                elevation: 5, // Menambahkan bayangan pada Card
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15), // Membuat sudut-sudut card menjadi melengkung
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // LayoutBuilder digunakan untuk mendapatkan ukuran layout yang tersedia
                    return Padding(
                      padding: const EdgeInsets.all(5.0), // Padding dalam Card
                      child: Column(
                        children: <Widget>[
                          // Baris pertama: gambar profil dan teks "Yummy Official"
                          Row(
                            children: <Widget>[
                              ClipRRect( // Membuat gambar profil melingkar
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                  image: const AssetImage('assets/images/yummyy.jpeg'), // Menggunakan gambar dari assets
                                  fit: BoxFit.cover, // Membuat gambar menyesuaikan kotak
                                  height: constraints.maxHeight * 0.09, // Mengatur tinggi gambar
                                  width: constraints.maxHeight * 0.09, // Mengatur lebar gambar
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Text('Yummy Official', // Teks "Yummy Official" di sebelah gambar
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * 0.04, // Ukuran font 
                                      color: Colors.black)),
                              const SizedBox(width: 5.0),
                              const CircleAvatar(  // Lingkaran kecil biru dengan ikon check
                                backgroundColor: Colors.blue,
                                radius: 4.5,
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 7.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)), // Membuat sudut gambar menjadi melengkung
                            child: Image(
                              image:
                                  AssetImage('assets/images/gambar$index.jpeg'), // untuk menambahkan gambar berbeda di 4 card
                              fit: BoxFit.cover, // Membuat gambar mengisi container
                              height: 200, // Tinggi gambar
                              width: 200, // Lebar gambar
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(// Teks judul pastry
                            judul[index], // Mengambil judul dari list berdasarkan indeks
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.05, // Ukuran font dinamis
                              fontWeight: FontWeight.bold, // Teks tebal
                              color: Color.fromARGB(255, 46, 25, 1),
                            ),
                            textAlign: TextAlign.start, // Rata kiri teks
                          ),
                          const SizedBox(height: 20.0),
                          const Row(  // Row untuk menampilkan rating dan waktu
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              Icon(Icons.star,
                                  size: 22.0, color: Colors.orange), // Ikon bintang untuk rating
                              SizedBox(width: 5.0),
                              Text('4.9', style: TextStyle(fontSize: 12.0)), // Rating pastry
                              SizedBox(width: 25.0),
                              Icon(Icons.access_time_filled_rounded,
                                  size: 18.0, color: Color.fromARGB(255, 26, 25, 25)), // Ikon jam untuk waktu
                              SizedBox(width: 5.0),
                              Text('30 mnt', style: TextStyle(fontSize: 12.0)), // Waktu pembuatan
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          const Row(// Row untuk menampilkan jumlah view dan ikon bookmark
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  SizedBox(width: 10.0),
                                  Icon(Icons.visibility,
                                      size: 18.0, color: Color.fromARGB(255, 26, 25, 25)), // Ikon view
                                  SizedBox(width: 5.0),
                                  Text('10,0 rb',
                                      style: TextStyle(fontSize: 12.0)), // Jumlah view
                                ],
                              ),
                              CircleAvatar( // Ikon bookmark
                                backgroundColor: Color.fromARGB(255, 230, 196, 169),
                                radius: 20.0,
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
