import 'dart:io';

class OrderUtil{
  static String getString(){
    String contents = File('assets/Order.json').readAsStringSync();
    return contents;
  }
  static List<
}