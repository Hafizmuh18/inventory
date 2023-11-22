// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/equipment_form.dart';
import 'package:inventory/screens/list_equipment.dart';
import 'package:inventory/screens/login.dart';
import 'package:inventory/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class OptionList {
  final String name;
  final IconData icon;
  final Color color;

  OptionList(this.name, this.color, this.icon);
}

class Guild extends StatelessWidget {
  final OptionList item;

  const Guild(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if(item.name == "Add Equipment"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EquipmentFormPage()),
            );
          }
          if(item.name == "See Equipment"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductPage()),
            );
          }
          if(item.name == "Back to Town"){
            final response = await request.logout(
            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL! https://muhammad-hafiz23-tugas.pbp.cs.ui.ac.id/auth/logout/  http://127.0.0.1:8000/auth/logout/
            "https://muhammad-hafiz23-tugas.pbp.cs.ui.ac.id/auth/logout/");
        String message = response["message"];
        if (response['status']) {
          String uname = response["username"];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message Sampai jumpa, $uname."),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message"),
          ));
        }
          }
        },
        
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<OptionList> items = [
        OptionList("See Equipment", Colors.lightBlue,Icons.remove_red_eye_outlined),
        OptionList("Add Equipment", Colors.green,Icons.add_circle_outline),
        OptionList("Back to Town", Colors.red, Icons.logout),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.brown[900],
          appBar: AppBar(
            backgroundColor: Color.fromARGB(0, 62, 2, 2),
            title: const Text(
              'Adventure',
            ),
          ),
          drawer: const Option(),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'Guild', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((OptionList item) {
                      // Iterasi untuk setiap item
                      return Guild(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
    }

}
