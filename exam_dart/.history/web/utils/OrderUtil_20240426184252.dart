import 'dart:io';

import '../models/Order.dart';

class OrderUtil{
  static String getString(){
    String contents = File('assets/Order.json').readAsStringSync();
    return contents;
  }
  static List<Order> getOrder(String json){
    List<dynamic> jsonList = 
  } 
}