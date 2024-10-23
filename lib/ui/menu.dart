import 'package:flutter/material.dart';
import 'package:myapp/ui/add.dart';
import 'package:myapp/ui/dashboard.dart';
import 'package:myapp/ui/login.dart';
import 'package:myapp/ui/update.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Navbar berwarna biru
        title: const Text('Management System'),
        titleTextStyle: const TextStyle(
          color: Colors.white, // Warna teks menjadi putih
          fontSize: 20, // Ukuran font teks
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20), // Menambahkan padding untuk memberi jarak dari tepi layar
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Membagi menjadi 2 kolom
              crossAxisSpacing: 20.0, // Jarak horizontal antar kotak
              mainAxisSpacing: 20.0, // Jarak vertikal antar kotak
            ),
            itemCount: 4, // Total 4 kotak
            itemBuilder: (BuildContext context, int index) {
              // Daftar ikon, warna, dan halaman untuk navigasi
              List<Map<String, dynamic>> items = [
                {'icon': Icons.dashboard, 'label': 'Dashboard', 'iconColor': Colors.blue, 'textColor': Colors.black, 'page': const DashboardPage()},
                {'icon': Icons.add, 'label': 'Add', 'iconColor': Colors.red, 'textColor': Colors.black, 'page': const AddPage()},
                {'icon': Icons.update, 'label': 'Update', 'iconColor': Colors.green, 'textColor': Colors.black, 'page': const UpdatePage(kodeProduk: "Faktur 001", tanggalPenjualan: "23/10/2024", namaCustomer: "M Fachriza Farhan", jumlahBarang: 10, totalPenjualan: 100000)},
                {'icon': Icons.logout, 'label': 'Logout', 'iconColor': Colors.grey, 'textColor': Colors.black, 'page': const LoginPage()},
              ];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => items[index]['page']),
                  );
                }, // Fungsi yang akan dipanggil saat kotak diklik
                child: Container(
                  color: Colors.white, // Warna kotak putih
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        items[index]['icon'], // Ikon yang berbeda untuk setiap kotak
                        color: items[index]['iconColor'], // Warna ikon
                        size: 50.0,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        items[index]['label'], // Label yang berbeda untuk setiap kotak
                        style: TextStyle(
                          color: items[index]['textColor'], // Warna teks hitam
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}