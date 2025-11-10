import 'package:flutter/material.dart';
import '../main.dart';

class EducationScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const EducationScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final articles = [
      {
        "title": "Tips MPASI Bergizi",
        "preview": "Memasuki usia si kecil yang ke 6 bulan, Parents bersiap menyambut masa MPASI..."
      },
      {
        "title": "Pentingnya Air Minum Cukup",
        "preview": "Air merupakan komponen vital bagi tubuh dan penting untuk metabolisme..."
      },
      {
        "title": "Ciri Awal Anak Kekurangan Gizi",
        "preview": "Fase MPASI adalah momen mendebarkan—antara antusias dan khawatir..."
      },
    ];

    return Scaffold(
      backgroundColor: colors['background'],
      appBar: AppBar(
        backgroundColor: colors['white'],
        title: const Text("Edukasi Gizi & Stunting",
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => onNavigate('home'),
        ),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: colors['primary'],
              padding: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Daftar Artikel / Kartu Informasi",
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 20),
          for (var article in articles)
            ArticleCard(
              title: article['title']!,
              preview: article['preview']!,
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colors['white'],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Color(0xFF64748B)),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.mic_none, color: Color(0xFF64748B)),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String preview;

  const ArticleCard({super.key, required this.title, required this.preview});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors['white'],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(preview,
              style:
                  const TextStyle(fontSize: 14, color: Color(0xFF64748B), height: 1.6)),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text("Lihat Detail",
                style: TextStyle(
                    color: Color(0xFF3B82F6), fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
