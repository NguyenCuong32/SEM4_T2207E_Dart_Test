import 'dart:convert';
import 'dart:io';

import '../models/order.dart'; // Import your Order class

class JsonUtil {
  static String getString() {
    String contents = File('assets/order.json').readAsStringSync(); // Assuming the file is named order.json
    return contents;
  }

  static List<Order> getOrders(String json) {
    List<dynamic> jsonList = jsonDecode(json);
    List<Order> orders = [];

    for (var jsonObject in jsonList) {
      orders.add(Order.fromJson(jsonObject));
    }
    return orders;
  }
}
