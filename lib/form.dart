import 'dart:io';

import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:image_picker/image_picker.dart';

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _form();
}

class _form extends State<form> {
  var formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController tempatTinggal = TextEditingController();
  TextEditingController tempat = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController ktp = TextEditingController();
  TextEditingController npwp = TextEditingController();
  TextEditingController sosmed = TextEditingController();
  TextEditingController ket = TextEditingController();

  String _jk = "Laki-laki";

  void inistate() {
    super.initState();
    dateController.text = "";
  }

  String pengalaman = "1 tahun";
  List items = [
    "1 tahun",
    "2 tahun",
    "3 tahun",
    "4 tahun",
    "5 tahun",
  ];

  File? image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
    final XFile? imagePicker =
        await _picker.pickImage(source: ImageSource.camera);
    image = File(imagePicker!.path);
    setState(() {});
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sistem Registrasi Pegawai')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: tempatTinggal,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: tempat,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Tempat Lahir",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextField(
                    controller:
                        dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Tanggal Lahir" //label text of field
                        ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      //when click we have to show the datepicker

                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        setState(() {
                          dateController.text = pickedDate.toString();
                        });
                      } else {
                        print("Tidak Terpilih");
                      }
                    }),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Container(
                  child: new RadioListTile(
                    value: "laki-laki",
                    groupValue: _jk,
                    onChanged: (value) {
                      setState(() {
                        _jk = value.toString();
                      });
                    },
                    title: new Text("Laki-laki"),
                    subtitle: new Text("Pilih ini jika anda Laki-laki"),
                  ),
                ),
                Container(
                  child: new RadioListTile(
                    value: "Perempuan",
                    groupValue: _jk,
                    onChanged: (value) {
                      setState(() {
                        _jk = value.toString();
                      });
                    },
                    title: new Text("Perempuan"),
                    subtitle: new Text("Pilih ini jika anda Permpuan"),
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Container(
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        "Pengalaman Kerja",
                        style: new TextStyle(fontSize: 17.0),
                      ),
                      new Padding(padding: new EdgeInsets.only(left: 20.0)),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: new DropdownButton(
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 30,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          value: pengalaman,
                          items: items.map((valueitems) {
                            return DropdownMenuItem(
                              value: valueitems,
                              child: Text(valueitems),
                            );
                          }).toList(),
                          onChanged: (velueitems) {
                            setState(() {
                              pengalaman = velueitems.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                TextFormField(
                    controller: ktp,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nomor KTP",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: npwp,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nomor NPWP",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: sosmed,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Link Sosmed",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: ket,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Keterangan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        image != null
                            ? Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                ))
                            : Container(),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blueGrey),
                            onPressed: () async {
                              await getImage();
                            },
                            child: Text(
                              'Open Image',
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(width: 16),
                      ],
                    )),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Warning!!'),
                            content: const Text(
                                'Apakah Anda Yakin Akan Menyimpan Data Ini?'),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueGrey),
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  String nama = name.text;
                                  String alamat = tempatTinggal.text;
                                  String tempatLahir = tempat.text;
                                  String tanggalLahir = dateController.text;
                                  String jeniskelamin = _jk;
                                  String pengalamankerja = pengalaman;
                                  String nomorKTP = ktp.text;
                                  String nomorNPWP = npwp.text;
                                  String linkSosmed = sosmed.text;
                                  String keterangan = ket.text;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProdukDetail(
                                            nama: nama,
                                            alamat: alamat,
                                            tempatLahir: tempatLahir,
                                            tanggalLahir: tanggalLahir,
                                            jeniskelamin: jeniskelamin,
                                            pengalamankerja: pengalamankerja,
                                            nomorKTP: nomorKTP,
                                            nomorNPWP: nomorNPWP,
                                            linkSosmed: linkSosmed,
                                            keterangan: keterangan,
                                          )));
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text('Simpan',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              name.clear();
                              tempatTinggal.clear();
                              dateController.clear();
                              ktp.clear();
                              npwp.clear();
                              sosmed.clear();
                              ket.clear();
                            },
                            child: Text("Cancel"))),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}