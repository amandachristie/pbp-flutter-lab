import 'package:flutter/material.dart';
import 'package:counter_7/model/budget.dart';
import 'package:counter_7/utility/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _judul = "";
  int _amount = 0;
  String? _type;
  DateTime? _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const NavigationDrawer(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                // Input Judul
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Beli Sate Pacil",
                    labelText: "Judul",
                    // Menambahkan icon agar lebih intuitif
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama lengkap tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Input amount
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 20000",
                    labelText: "Nominal",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  // Menambahkan behavior saat amount diketik
                  onChanged: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _amount = 0;
                      } else {
                        _amount = int.parse(value);
                      }
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _amount = 0;
                      } else {
                        _amount = int.parse(value);
                      }
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'amount tidak boleh kosong!';
                    }
                    if (int.parse(value) == 0) {
                      return 'amount tidak boleh nol!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Input type
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: _type,
                  hint: const Text("Pilih Jenis"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'Pengeluaran',
                      child: Text('Pengeluaran'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Pemasukan',
                      child: Text('Pemasukan'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _type = value ?? "";
                    });
                  },
                ),
              ),
              Padding(
                // Input Date
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4.0),
                    TextButton(
                      onPressed: (() {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2999),
                        ).then((value) {
                          setState(() {
                            _date = value;
                          });
                        });
                      }),
                      child: Text(
                        _date.toString().split(' ')[0],
                        style: const TextStyle(
                          fontSize: 16.0,
                          // color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Budget.addBudget(
                        name: _judul,
                        amount: _amount,
                        type: _type,
                        date: _date,
                      );
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 16.0,
                              ),
                              shrinkWrap: true,
                              children: [
                                Center(
                                  child: Text(
                                    "Berhasil menambahkan $_type $_judul sebesar ${_amount.toString()}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                )
                              ],
                            ),
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(12.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
