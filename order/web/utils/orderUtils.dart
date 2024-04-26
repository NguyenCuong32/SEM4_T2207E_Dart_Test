import 'dart:convert';
import 'dart:io';

import '../models/order.dart';

class JsonUtils {
  static String getString() {
    String contents = File('/resources/order.json').readAsStringSync();
    return contents;
  }

  static List<Order> getOrder(String json) {
    List<dynamic> jsonList = jsonDecode(json);
    List<Order> orders = [];

    for (final jsonOrder in jsonList) {
      orders.add(Order.fromJson(jsonOrder));
    }
    return orders;
  }
}
