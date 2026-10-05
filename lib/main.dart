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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE6A100),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const ProfilePage(),
    );
  }
}

// Widget Kartu Profil Modern (StatelessWidget)
class ProfileCard extends StatelessWidget {
  final String nama;
  final String npm;
  final String jurusan;
  final int semester;
  final bool isAktif;

  const ProfileCard({
    super.key,
    required this.nama,
    required this.npm,
    required this.jurusan,
    required this.semester,
    required this.isAktif,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF7B733), Color(0xFFFC4A1A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFC4A1A).withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Avatar Profil
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: const CircleAvatar(
                radius: 42,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_rounded,
                  size: 50,
                  color: Color(0xFFFC4A1A),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Nama Mahasiswa
            Text(
              nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 20),

            // Detail Informasi
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildInfoRow(Icons.badge_outlined, 'NPM', npm),
                  const Divider(color: Colors.white24, height: 16),
                  _buildInfoRow(Icons.school_outlined, 'Jurusan', jurusan),
                  const Divider(color: Colors.white24, height: 16),
                  _buildInfoRow(
                    Icons.timeline_rounded,
                    'Semester',
                    'Semester $semester',
                  ),
                  const Divider(color: Colors.white24, height: 16),
                  _buildInfoRow(
                    Icons.verified_user_outlined,
                    'Status',
                    isAktif ? 'Aktif' : 'Tidak Aktif',
                    isStatus: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value,
      {bool isStatus = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.white70),
        const SizedBox(width: 12),
        Text(
          '$label:',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              shadows: isStatus
                  ? [
                      Shadow(
                        color: isAktif ? Colors.greenAccent : Colors.redAccent,
                        blurRadius: 8,
                      )
                    ]
                  : null,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// Widget Utama (StatefulWidget)
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data state utama
  String namaDisplay = "Azhar Al Fath";
  String npmDisplay = "B01220051";
  String jurusanDisplay = "Teknik Rekayasa Multimedia";
  int semester = 9;
  bool isAktif = true;

  // Controller untuk setiap kolom input
  late final TextEditingController _namaController;
  late final TextEditingController _npmController;
  late final TextEditingController _jurusanController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: namaDisplay);
    _npmController = TextEditingController(text: npmDisplay);
    _jurusanController = TextEditingController(text: jurusanDisplay);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _npmController.dispose();
    _jurusanController.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.amber.shade800),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.amber.shade700, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'UNIVERSITAS BOASH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kartu Mahasiswa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Menampilkan Kartu Profil
            ProfileCard(
              nama: namaDisplay,
              npm: npmDisplay,
              jurusan: jurusanDisplay,
              semester: semester,
              isAktif: isAktif,
            ),

            const SizedBox(height: 28),

            const Text(
              'Form Perubahan Data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 14),

            // Input Nama
            TextField(
              controller: _namaController,
              decoration: _buildInputDecoration(
                'Nama Mahasiswa',
                Icons.person_outline_rounded,
              ),
            ),
            const SizedBox(height: 12),

            // Input NPM
            TextField(
              controller: _npmController,
              keyboardType: TextInputType.number,
              decoration: _buildInputDecoration(
                'NPM Mahasiswa',
                Icons.badge_outlined,
              ),
            ),
            const SizedBox(height: 12),

            // Input Jurusan
            TextField(
              controller: _jurusanController,
              decoration: _buildInputDecoration(
                'Jurusan Mahasiswa',
                Icons.school_outlined,
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFC4A1A),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    namaDisplay = _namaController.text;
                    npmDisplay = _npmController.text;
                    jurusanDisplay = _jurusanController.text;
                  });

                  // Bersihkan SnackBar sebelumnya jika ada
                  ScaffoldMessenger.of(context).clearSnackBars();

                  // Tampilkan SnackBar baru
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Data profil berhasil diperbarui!'),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.black87,
                    ),
                  );
                },
                icon: const Icon(Icons.save_rounded),
                label: const Text(
                  'Simpan Perubahan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Panel Pengaturan Tambahan (Semester & Status)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  // Control Semester
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.format_list_numbered_rounded,
                              color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            'Semester',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 18),
                              onPressed: () {
                                if (semester > 1) {
                                  setState(() => semester--);
                                }
                              },
                            ),
                            Text(
                              '$semester',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 18),
                              onPressed: () {
                                setState(() => semester++);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(height: 1),
                  ),

                  // Switch Mahasiswa Aktif
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.toggle_on_outlined, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            'Mahasiswa Aktif',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isAktif,
                        activeColor: const Color(0xFFFC4A1A),
                        onChanged: (val) {
                          setState(() => isAktif = val);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}