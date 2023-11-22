// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:inventory/main.dart';
// import 'dart:convert';
// import 'package:inventory/models/equipment.dart';

// import 'package:inventory/widgets/drawer.dart';

// class ProductPage extends StatefulWidget {
//     const ProductPage({Key? key}) : super(key: key);

//     @override
//     _ProductPageState createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
// Future<List<Equipment>> fetchProduct() async {
//     // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL! https://muhammad-hafiz23-tugas.pbp.cs.ui.ac.id/json-user/ http://127.0.0.1:8000/json-user/
//     var url = Uri.parse(
//         'https://muhammad-hafiz23-tugas.pbp.cs.ui.ac.id/json/');
//     var response = await http.get(
//         url,
//         headers: {"Content-Type": "application/json"},
//     );

//     // melakukan decode response menjadi bentuk json
//     var data = jsonDecode(utf8.decode(response.bodyBytes));

//     // melakukan konversi data json menjadi object Product
//     List<Equipment> list_equipment = [];
//     for (var d in data) {
//         if (d != null) {
//             list_equipment.add(Equipment.fromJson(d));
//         }
//     }
//     return list_equipment;
// }

// @override
// Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: const Text('Equipment'),
//         ),
//         drawer: const Option(),
//         body: FutureBuilder(
//             future: fetchProduct(),
//             builder: (context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                     return const Center(child: CircularProgressIndicator());
//                 } else {
//                     if (!snapshot.hasData) {
//                     return const Column(
//                         children: [
//                         Text(
//                             "Tidak ada data produk.",
//                             style:
//                                 TextStyle(color: Color(0xff59A5D8), fontSize: 20),
//                         ),
//                         SizedBox(height: 8),
//                         ],
//                     );
//                 } else {
//                     return ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (_, index) => Container(
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 12),
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                     Text(
//                                     "${snapshot.data![index].fields.name}",
//                                     style: const TextStyle(
//                                         fontSize: 18.0,
//                                         fontWeight: FontWeight.bold,
//                                     ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Text("${snapshot.data![index].fields.price}"),
//                                     const SizedBox(height: 10),
//                                     Text(
//                                         "${snapshot.data![index].fields.description}")
//                                 ],
//                                 ),
//                             ));
//                     }
//                 }
//             }));
//     }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory/main.dart';
import 'package:inventory/models/equipment.dart';

import 'package:inventory/widgets/drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Equipment>> fetchProduct() async {
    var url = Uri.parse('https://muhammad-hafiz23-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Equipment> listEquipment = [];
    for (var d in data) {
      if (d != null) {
        listEquipment.add(Equipment.fromJson(d));
      }
    }
    return listEquipment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment'),
      ),
      drawer: const Option(),
      body: FutureBuilder(
        future: fetchProduct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    "Tidak ada data produk.",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EquipmentDetailPage(
                          equipment: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.brown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("Amount : ${snapshot.data![index].fields.amount}"),
                        const SizedBox(height: 10),
                        Text("Description : ${snapshot.data![index].fields.description}")
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

class EquipmentDetailPage extends StatelessWidget {
  final Equipment equipment;

  const EquipmentDetailPage({Key? key, required this.equipment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the UI for the equipment detail page using the 'equipment' data.
    return Scaffold(
      appBar: AppBar(
        title: Text(equipment.fields.name),
      ),
      body: Center(
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Type: ${equipment.fields.itemType}"),
            Text("Amount: ${equipment.fields.amount}"),
            Text("Power: ${equipment.fields.power}"),
            Text("Price: ${equipment.fields.price}"),
            Text("Unique Skill: ${equipment.fields.uniqueSkill}"),
            Text("Description: ${equipment.fields.description}"),
            Center(
              child: ElevatedButton(
                child: Text("Back To Equipment List"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            )
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
