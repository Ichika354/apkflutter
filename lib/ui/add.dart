import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _kodeProdukTextboxController = TextEditingController();
  final TextEditingController _tanggalPenjualanTextboxController = TextEditingController();
  final TextEditingController _namaCustomerTextboxController = TextEditingController();
  final TextEditingController _jumlahBarangTextboxController = TextEditingController();
  final TextEditingController _totalPenjualanTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white, // Warna teks menjadi putih
          fontSize: 20, // Ukuran font teks
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Menambahkan padding di sekitar body
        child: SingleChildScrollView(
          child: Column(
            children: [
              _textboxKodeProduk(),
              const SizedBox(height: 10), // Menambahkan jarak antar textbox
              _textboxTanggalPenjualan(),
              const SizedBox(height: 10),
              _textboxNamaCustomer(),
              const SizedBox(height: 10),
              _textboxJumlahBarang(),
              const SizedBox(height: 10),
              _textboxTotalPenjualan(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "No Faktur Penjualan"),
      controller: _kodeProdukTextboxController,
    );
  }

  Widget _textboxTanggalPenjualan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Penjualan (DD/MM/YYYY)"),
      controller: _tanggalPenjualanTextboxController,
    );
  }

  Widget _textboxNamaCustomer() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Customer"),
      controller: _namaCustomerTextboxController,
    );
  }

  Widget _textboxJumlahBarang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jumlah Barang"),
      keyboardType: TextInputType.number, // Menampilkan keyboard angka
      controller: _jumlahBarangTextboxController,
    );
  }

  Widget _textboxTotalPenjualan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Total Penjualan"),
      keyboardType: TextInputType.number, // Menampilkan keyboard angka
      controller: _totalPenjualanTextboxController,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        // Mengambil data dari controller
        String kodeProduk = _kodeProdukTextboxController.text;
        String tanggalPenjualan = _tanggalPenjualanTextboxController.text;
        String namaCustomer = _namaCustomerTextboxController.text;
        int jumlahBarang = int.parse(_jumlahBarangTextboxController.text); // Parsing dari String ke int
        int totalPenjualan = int.parse(_totalPenjualanTextboxController.text); // Parsing dari String ke int

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProdukDetail(
            kodeProduk: kodeProduk,
            tanggalPenjualan: tanggalPenjualan,
            namaCustomer: namaCustomer,
            jumlahBarang: jumlahBarang,
            totalPenjualan: totalPenjualan,
          ),
        ));
      },
      child: const Text('Simpan'),
    );
  }
}

// Contoh class ProdukDetail (untuk navigasi)
class ProdukDetail extends StatelessWidget {
  final String kodeProduk;
  final String tanggalPenjualan;
  final String namaCustomer;
  final int jumlahBarang;
  final int totalPenjualan;

  const ProdukDetail({
    super.key,
    required this.kodeProduk,
    required this.tanggalPenjualan,
    required this.namaCustomer,
    required this.jumlahBarang,
    required this.totalPenjualan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No Faktur Penjualan: $kodeProduk'),
            Text('Tanggal Penjualan: $tanggalPenjualan'),
            Text('Nama Customer: $namaCustomer'),
            Text('Jumlah Barang: $jumlahBarang'),
            Text('Total Penjualan: $totalPenjualan'),
          ],
        ),
      ),
    );
  }
}
