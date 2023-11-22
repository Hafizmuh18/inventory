import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventory/main.dart';
import 'package:inventory/menu.dart';
import 'package:inventory/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya

class EquipmentFormPage extends StatefulWidget {
    const EquipmentFormPage({super.key});
    

    @override
    State<EquipmentFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<EquipmentFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _power = 0;
  int _price = 0;
  String _type = "";
  String _skill = "";
  String _description = "";
  @override
  Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Adding New Equipment',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const Option(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name shouldn't be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Power",
                    labelText: "Power",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _power = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Power shouldn't be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Power must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount shouldn't be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Amount must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price shouldn't be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Type",
                    labelText: "Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _type = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Type shouldn't be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Skill",
                    labelText: "Skill",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _skill = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Skill shouldn't be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description shouldn't be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Power: $_power'),
                                    Text('Amount: $_amount'),
                                    Text('Price: $_price'),
                                    Text('Type: $_type'),
                                    Text('Skill: $_skill'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('Yeah, sure!'),
                                  onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                          // Kirim ke Django dan tunggu respons
                                          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                          final response = await request.postJson(
                                          "https://muhammad-hafiz23-tugas.pbp.cs.ui.ac.id/create-flutter/",
                                          jsonEncode(<String, String>{
                                              'name': _name,
                                              'item_type': _type,
                                              'power': _power.toString(),
                                              'amount': _amount.toString(),
                                              'price': _price.toString(),
                                              'unique_skill': _skill,
                                              'description': _description,
                                          }));
                                          if (response['status'] == 'success') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                              content: Text("Produk baru berhasil disimpan!"),
                                              ));
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => MyHomePage()),
                                              );
                                          } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                  content:
                                                      Text("Terdapat kesalahan, silakan coba lagi."),
                                              ));
                                          }
                                      }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Put in bag",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                        _formKey.currentState!.reset();
                        Navigator.pop(context);
                    },
                    child: const Text(
                      "Nah, nevermind",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:inventory/main.dart';
// import 'package:inventory/menu.dart';
// import 'package:inventory/widgets/drawer.dart';
// import 'package:pbp_django_auth/pbp_django_auth.dart';
// import 'package:provider/provider.dart';
// // TODO: Impor drawer yang sudah dibuat sebelumnya

// class EquipmentFormPage extends StatefulWidget {
//     const EquipmentFormPage({super.key});
    

//     @override
//     State<EquipmentFormPage> createState() => _ShopFormPageState();
// }

// class _ShopFormPageState extends State<EquipmentFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = "";
//   int _amount = 0;
//   int _power = 0;
//   int _price = 0;
//   String _type = "";
//   String _skill = "";
//   String _description = "";
//   @override
//   Widget build(BuildContext context) {
//       final request = context.watch<CookieRequest>();
//       return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'Adding New Equipment',
//           ),
//         ),
//         backgroundColor: Colors.indigo,
//         foregroundColor: Colors.white,
//       ),
//       drawer: const Option(),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Name",
//                     labelText: "Name",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _name = value!;
//                     });
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return "Name shouldn't be empty!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Power",
//                     labelText: "Power",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _power = int.parse(value!);
//                     });
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return "Power shouldn't be empty!";
//                     }
//                     if (int.tryParse(value) == null) {
//                       return "Power must be a number!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Amount",
//                     labelText: "Amount",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _amount = int.parse(value!);
//                     });
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return "Amount shouldn't be empty!";
//                     }
//                     if (int.tryParse(value) == null) {
//                       return "Amount must be a number!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Price",
//                     labelText: "Price",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _price = int.parse(value!);
//                     });
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return "Price shouldn't be empty!";
//                     }
//                     if (int.tryParse(value) == null) {
//                       return "Price must be a number!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Type",
//                     labelText: "Type",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _type = value!;
//                     });
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return "Type shouldn't be empty!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Skill",
//                     labelText: "Skill",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _skill = value!;
//                     });
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return "Skill shouldn't be empty!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Description",
//                     labelText: "Description",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _description = value!;
//                     });
//                   },
//                   validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return "Description shouldn't be empty!";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.indigo),
//                     ),
//                     onPressed: () async{
//                       if (_formKey.currentState!.validate()) {
//                           // Kirim ke Django dan tunggu respons
//                           // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
//                           final response = await request.postJson(
//                           "https://muhammad-hafiz23-tugas.pbp.cs.ui.ac.id/create-flutter/",
//                           jsonEncode(<String, String>{
//                               'name': _name,
//                               'item_type': _type,
//                               'power': _power.toString(),
//                               'amount': _amount.toString(),
//                               'price': _price.toString(),
//                               'unique_skill': _skill,
//                               'description': _description,
//                           }));
//                           if (response['status'] == 'success') {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(const SnackBar(
//                               content: Text("Produk baru berhasil disimpan!"),
//                               ));
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => MyHomePage()),
//                               );
//                           } else {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(const SnackBar(
//                                   content:
//                                       Text("Terdapat kesalahan, silakan coba lagi."),
//                               ));
//                           }
//                       }
//                     },
//                     child: const Text(
//                       "Put in bag",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
                  
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.indigo),
//                     ),
//                     onPressed: () {
//                         _formKey.currentState!.reset();
//                         Navigator.pop(context);
//                     },
//                     child: const Text(
//                       "Nah, nevermind",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ]
//           )
//         ),
//       ),
//     );
//   }
// }

