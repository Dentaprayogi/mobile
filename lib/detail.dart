import 'package:flutter/material.dart';
import 'form.dart';

class ProdukDetail extends StatefulWidget {
  final String? nama;
  final String? alamat;
  final String? tempatLahir;
  final String? tanggalLahir;
  final String? jeniskelamin;
  final String? pengalamankerja;
  final String? nomorKTP;
  final String? nomorNPWP;
  final String? linkSosmed;
  final String? keterangan;

  const ProdukDetail({
    Key? key,
    this.nama,
    this.alamat,
    this.tempatLahir,
    this.tanggalLahir,
    this.jeniskelamin,
    this.pengalamankerja,
    this.nomorKTP,
    this.nomorNPWP,
    this.linkSosmed,
    this.keterangan,
  }) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pendaftaran'),
      ),
      body: Column(
        children: [
          Text("Nama : " + widget.nama.toString()),
          Text("Alamat : " + widget.alamat.toString()),
          Text("Tempat Lahir : " + widget.tempatLahir.toString()),
          Text("Tanggal Lahir : " + widget.tanggalLahir.toString()),
          Text("Jenis Kelamin : " + widget.jeniskelamin.toString()),
          Text("Pengalaman Kerja : " + widget.pengalamankerja.toString()),
          Text("Nomor KTP : " + widget.nomorKTP.toString()),
          Text("Nomor NPWP : " + widget.nomorNPWP.toString()),
          Text("Link Sosmed : " + widget.linkSosmed.toString()),
          Text("Keterangan : " + widget.keterangan.toString()),
          // Text("Nama Produk : ${widget.namaProduk}"),
          // Text("Harga : ${widget.harga}")
        ],
      ),
    );
  }
}