import 'package:inventory/main.dart';

class SharedList {
  List<Equipment> myList = [];
  
  static final SharedList _instance = SharedList._internal();

  factory SharedList() {
    return _instance;
  }

  SharedList._internal();
}