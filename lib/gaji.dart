// Tambahkan import untuk Flutter Material
import 'package:flutter/material.dart';

class Gaji extends StatelessWidget {
  final String golongan;
  final String status;
  final int masaKerja;

  // Constructor
  const Gaji({
    Key? key,
    required this.golongan,
    required this.status,
    required this.masaKerja,
  }) : super(key: key);

  // Metode untuk menghitung tunjangan
  int tunjGapok() {
    int tunjangan = 0;

    if (golongan == "I") {
      tunjangan = 250000;
    } else if (golongan == "II") {
      tunjangan = 300000;
    } else if (golongan == "III") {
      tunjangan = 350000;
    } else {
      tunjangan = 400000;
    }

    return tunjangan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji'),
      ),
      body: const Center(
        child: Text('Ini halaman Gaji'),
      ),
    );
  }
}