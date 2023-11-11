// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/equipment_form.dart';
import 'package:inventory/equipment_list.dart';
import 'package:inventory/widgets/drawer.dart';


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
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
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
              MaterialPageRoute(builder: (context) => EquipmentList()),
            );
          }
          if(item.name == "Back to Town"){
            SystemNavigator.pop();
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
