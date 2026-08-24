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
      title: 'Buku Kontak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BukuKontakPage(),
    );
  }
}

class Kontak {
  String nama;
  String email;
  String noHp;

  Kontak({required this.nama, required this.email, required this.noHp});
}

class BukuKontakPage extends StatefulWidget {
  const BukuKontakPage({super.key});

  @override
  State<BukuKontakPage> createState() => _BukuKontakPageState();
}

class _BukuKontakPageState extends State<BukuKontakPage> {
  List<Kontak> daftarKontak = [];

  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noHpController = TextEditingController();

  void _simpanKontak() {
    if (namaController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        noHpController.text.isNotEmpty) {
      setState(() {
        daftarKontak.add(
          Kontak(
            nama: namaController.text,
            email: emailController.text,
            noHp: noHpController.text,
          ),
        );
        namaController.clear();
        emailController.clear();
        noHpController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Kontak'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: noHpController,
              decoration: const InputDecoration(labelText: 'No Handphone'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _simpanKontak,
              child: const Text('Simpan'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: daftarKontak.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(daftarKontak[index].nama),
                    subtitle: Text(
                      '${daftarKontak[index].email}\n${daftarKontak[index].noHp}',
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}