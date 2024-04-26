import 'dart:convert';
import 'dart:io';

import '../models/Order.dart';

class OrderUtil{
  static String getString(){
    String contents = File('assets/Order.json').readAsStringSync();
    return contents;
  }
  static List<Order> getOrder(String json){
    List<dynamic> jsonList = jsonDecode(json);
    List<Order> orders = [];

    for (var jsonOrder in jsonList) {
        orders.add(Order.fromJson(jsonOrder))
    }
  } 
}