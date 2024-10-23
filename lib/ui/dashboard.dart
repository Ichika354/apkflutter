import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white, // Warna teks menjadi putih
          fontSize: 20, // Ukuran font teks
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, left: 20.0), // Menambahkan padding di atas
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Tambahkan scroll vertikal
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Tambahkan scroll horizontal
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'No Faktur Penjualan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Tanggal Penjualan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Nama Customer',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Jumlah Barang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Total Penjualan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Faktur 001')),
                    DataCell(Text('23/10/2024')),
                    DataCell(Text('M Fachriza Farhan')),
                    DataCell(Text('10')),
                    DataCell(Text('100000')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Faktur 002')),
                    DataCell(Text('23/10/2024')),
                    DataCell(Text('Muhammad Rafli Alfarisi')),
                    DataCell(Text('5')),
                    DataCell(Text('50000')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Faktur 003')),
                    DataCell(Text('24/10/2024')),
                    DataCell(Text('Gaizka Wisnu Prawira')),
                    DataCell(Text('3')),
                    DataCell(Text('30000')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Faktur 004')),
                    DataCell(Text('24/10/2024')),
                    DataCell(Text('Gading Khairlambang')),
                    DataCell(Text('8')),
                    DataCell(Text('80000')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
