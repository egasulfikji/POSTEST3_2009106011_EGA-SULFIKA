import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Furniture { unknown, sofa, kursi, lemari, meja, karpet }

class _MyHomePageState extends State<MyHomePage> {
  final namaLengkapCtrl = TextEditingController();
  final alamatLengkapCtrl = TextEditingController();
  final noHpCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final kodePosCtrl = TextEditingController();
  final pesananCtrl = TextEditingController();
  final hargaCtrl = TextEditingController();
  Furniture furniture = Furniture.unknown;

  String namaLengkap = "",
      alamatLengkap = '',
      noHp = '',
      email = '',
      kodePos = '',
      pesanan = '',
      harga = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namaLengkapCtrl.dispose();
    alamatLengkapCtrl.dispose();
    noHpCtrl.dispose();
    emailCtrl.dispose();
    kodePosCtrl.dispose();
    pesananCtrl.dispose();
    hargaCtrl.dispose();
    super.dispose();
  }

  String getFurniture(Furniture? value) {
    if (value == Furniture.sofa) {
      return "Sofa";
    } else if (value == Furniture.kursi) {
      return "Kursi";
    } else if (value == Furniture.lemari) {
      return "Lemari";
    } else if (value == Furniture.meja) {
      return "Meja";
    } else if (value == Furniture.karpet) {
      return "Karpet";
    }
    return "Tidak Ada Pilihan Furniture";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 241, 247),
      appBar: AppBar(
        title: const Text(
          'PENAGIHAN & PENGIRIMAN',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 0, 111, 133)),
        ),
      ),
      body: ListView(
        children: [
          Column(children: [
            const SizedBox(height: 10),
            Text(
              'Pilih Jenis Furniture Anda',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Row(children: [
              Expanded(
                child: ListTile(
                  title: const Text("Sofa"),
                  leading: Radio(
                    groupValue: furniture,
                    value: Furniture.sofa,
                    // Tanda ? pada akhir tipe data menandakan nullable.
                    // Flutter by design tidak memperbolehkan variable kosong.
                    // Contoh:
                    // String nama; <- Error
                    // String? nama; <- Tidak error;
                    onChanged: (Furniture? value) {
                      setState(() {
                        // Di beri tanda seru karena variable gender bertipe Gender
                        // sedangkan value bertipe Gender? jadinya bentrok.
                        // Solusinya ditambah tanda ! diakhir variable yang bertipe Gender?
                        // Jika kalian tidak percaya, cukup hapus tanda seru di bawah,
                        // lalu QuickFix nilai value.
                        furniture = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Kursi"),
                  leading: Radio(
                    groupValue: furniture,
                    value: Furniture.kursi,
                    onChanged: (Furniture? value) {
                      setState(() {
                        furniture = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Meja"),
                  leading: Radio(
                    groupValue: furniture,
                    value: Furniture.meja,
                    onChanged: (Furniture? value) {
                      setState(() {
                        furniture = value!;
                      });
                    },
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 10), // Margin Bohongan
            TextField(
              maxLines: 1,
              controller: namaLengkapCtrl,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                labelText: "Nama Lengkap",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 1,
              controller: alamatLengkapCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Alamat Lengkap"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: noHpCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "No HP/Whatshaap"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: emailCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Email"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: kodePosCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Kode POS"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: pesananCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Pesanan Anda",
                  labelText: "Pesanan Anda"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: hargaCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Harga Furniture Anda",
                  labelText: "Harga Pesanan Anda"),
            ),
          ]),
          ElevatedButton(
            onPressed: () {
              setState(() {
                namaLengkap = namaLengkapCtrl.text;
                alamatLengkap = alamatLengkapCtrl.text;
                noHp = noHpCtrl.text;
                email = emailCtrl.text;
                kodePos = kodePosCtrl.text;
                pesanan = pesananCtrl.text;
                harga = hargaCtrl.text;
              });
            },
            child: const Text("Konfirmasi"),
          ),
          const SizedBox(height: 20),
          Text(
            "RIWAYAT PESANAN",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 111, 133),
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            "Pesanan Anda:",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 111, 133),
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 111, 133),
              ),
              child: Text(
                '\t\t\t\t\tAtas Nama\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $namaLengkap',
                style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 111, 133),
              ),
              child: Text(
                '\t\t\t\t\tAlamat\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $alamatLengkap',
                style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 111, 133),
              ),
              child: Text(
                '\t\t\t\t\tNO HP \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $noHp',
                style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 111, 133),
              ),
              child: Text(
                '\t\t\t\t\tEmail\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $email',
                style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 111, 133),
              ),
              child: Text(
                '\t\t\t\t\tKode POS\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $kodePos',
                style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Jenis Furniture\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t =  ${getFurniture(furniture)} ',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 111, 133),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 0),
          Text(
            'Pesanan Anda \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t =  $pesanan ',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 111, 133),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 111, 133),
              ),
              child: Text(
                'TOTAL HARGA\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $harga',
                style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'EGA SULFIKA',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 111, 133),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
