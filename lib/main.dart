import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perhitungan Gaji',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GajiPage(),
    );
  }
}

class GajiPage extends StatefulWidget {
  const GajiPage({super.key});

  @override
  State<GajiPage> createState() => _GajiPageState();
}

class _GajiPageState extends State<GajiPage> {
  String? golongan;
  String? status;
  int? masaKerja;
  double totalGaji = 0.0;

  final List<String> golonganList = ['I', 'II', 'III', 'IV'];
  final List<String> statusList = ['Belum Menikah', 'Menikah'];

  void hitungGaji() {
    setState(() {
      // Aturan perhitungan gaji (contoh sederhana)
      if (golongan != null && status != null && masaKerja != null) {
        double baseGaji = golongan == 'I'
            ? 4000000
            : golongan == 'II'
                ? 5000000
                : golongan == 'III'
                    ? 6000000
                    : 7000000;

        double tambahan = (status == 'Menikah') ? 500000 : 0;
        totalGaji = baseGaji + (masaKerja! * 200000) + tambahan;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perhitungan Gaji"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: golongan,
              items: golonganList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Golongan',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  golongan = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: status,
              items: statusList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  status = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masa Kerja (dalam tahun)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                masaKerja = int.tryParse(value);
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: hitungGaji,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 16),
            if (totalGaji > 0)
              Center(
                child: Text(
                  "Total Gaji: Rp ${totalGaji.toStringAsFixed(0)}",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
