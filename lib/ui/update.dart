import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final String kodeProduk;
  final String tanggalPenjualan;
  final String namaCustomer;
  final int jumlahBarang;
  final int totalPenjualan;

  const UpdatePage({
    super.key,
    required this.kodeProduk,
    required this.tanggalPenjualan,
    required this.namaCustomer,
    required this.jumlahBarang,
    required this.totalPenjualan,
  });

  @override
  // ignore: library_private_types_in_public_api
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController _kodeProdukController;
  late TextEditingController _tanggalPenjualanController;
  late TextEditingController _namaCustomerController;
  late TextEditingController _jumlahBarangController;
  late TextEditingController _totalPenjualanController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan nilai dari widget
    _kodeProdukController = TextEditingController(text: widget.kodeProduk);
    _tanggalPenjualanController =
        TextEditingController(text: widget.tanggalPenjualan);
    _namaCustomerController = TextEditingController(text: widget.namaCustomer);
    _jumlahBarangController =
        TextEditingController(text: widget.jumlahBarang.toString());
    _totalPenjualanController =
        TextEditingController(text: widget.totalPenjualan.toString());
  }

  @override
  void dispose() {
    // Pastikan untuk membersihkan controller
    _kodeProdukController.dispose();
    _tanggalPenjualanController.dispose();
    _namaCustomerController.dispose();
    _jumlahBarangController.dispose();
    _totalPenjualanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data Penjualan'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _textboxKodeProduk(),
              const SizedBox(height: 10),
              _textboxTanggalPenjualan(),
              const SizedBox(height: 10),
              _textboxNamaCustomer(),
              const SizedBox(height: 10),
              _textboxJumlahBarang(),
              const SizedBox(height: 10),
              _textboxTotalPenjualan(),
              const SizedBox(height: 20),
              _tombolUpdate(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "No Faktur Penjualan"),
      controller: _kodeProdukController,
    );
  }

  Widget _textboxTanggalPenjualan() {
    return TextField(
      decoration:
          const InputDecoration(labelText: "Tanggal Penjualan (DD/MM/YYYY)"),
      controller: _tanggalPenjualanController,
    );
  }

  Widget _textboxNamaCustomer() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Customer"),
      controller: _namaCustomerController,
    );
  }

  Widget _textboxJumlahBarang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jumlah Barang"),
      keyboardType: TextInputType.number,
      controller: _jumlahBarangController,
    );
  }

  Widget _textboxTotalPenjualan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Total Penjualan"),
      keyboardType: TextInputType.number,
      controller: _totalPenjualanController,
    );
  }

  Widget _tombolUpdate() {
    return ElevatedButton(
      onPressed: () {
        // Mengambil data dari controller
        String kodeProduk = _kodeProdukController.text;
        String tanggalPenjualan = _tanggalPenjualanController.text;
        String namaCustomer = _namaCustomerController.text;
        int jumlahBarang = int.parse(_jumlahBarangController.text);
        int totalPenjualan = int.parse(_totalPenjualanController.text);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdatePage(
            kodeProduk: kodeProduk,
            tanggalPenjualan: tanggalPenjualan,
            namaCustomer: namaCustomer,
            jumlahBarang: jumlahBarang,
            totalPenjualan: totalPenjualan,
          ),
        ));
        // Kembali ke halaman sebelumnya setelah update
        Navigator.of(context).pop();
      },
      child: const Text('Update'),
    );
  }
}
