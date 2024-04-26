import 'dart:io';

class OrderUtil{
  static String getString(){
    String contents = File('assets/product.json').readAsStringSync();
  }
}