import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/input_field.dart';

class InputDataScreen extends StatefulWidget {
  final Function(String) onNavigate;
  final Function(Map<String, dynamic>) onSubmit;

  const InputDataScreen({super.key, required this.onNavigate, required this.onSubmit});

  @override
  State<InputDataScreen> createState() => _InputDataScreenState();
}

class _InputDataScreenState extends State<InputDataScreen> {
  final Map<String, String> formData = {
    'tanggalPengukuran': '',
    'tinggi': '',
    'berat': '',
    'usia': '',
    'tanggalLahir': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors['background'],
      appBar: AppBar(
        title: const Text("Input Data Pertumbuhan",
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        backgroundColor: colors['white'],
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => widget.onNavigate('home'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(label: "Tanggal Pengukuran", onChanged: (v) => formData['tanggalPengukuran'] = v),
            InputField(label: "Tinggi / Panjang (cm)", onChanged: (v) => formData['tinggi'] = v),
            InputField(label: "Berat Badan (kg)", onChanged: (v) => formData['berat'] = v),
            InputField(label: "Usia Anak", onChanged: (v) => formData['usia'] = v),
            InputField(label: "Tanggal Lahir Anak", onChanged: (v) => formData['tanggalLahir'] = v),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () => widget.onSubmit(formData),
          style: ElevatedButton.styleFrom(
            backgroundColor: colors['primary'],
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("Simpan & Lihat Diagnosa",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
