import 'package:flutter/material.dart';
import 'package:inventory/menu.dart';
import 'SharedList.dart';

void main() {
  SharedList().myList = [];
  runApp(const MyApp());
}

class Equipment{
  final String name;
  final int power;
  final int amount;
  final String type;
  final String skill;
  final String description;

  Equipment(this.name, this.power, this.amount, this.type, this.skill, this.description);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG Mobile',
      color: Colors.brown[600],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 114, 51, 9)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

