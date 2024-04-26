import 'package:web/helpers.dart';
import 'dart:convert';
import 'dart:io';

import 'model/order.dart';

void main() {
  List<Order> orders = getOrders();
  for (Order order in orders) {
    print(order.toString());
  }
}

List<Order> getOrders() {
  String json =
      '[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}]';
  List<dynamic> result = jsonDecode(json);
  List<Order> orders = [];
  for (var item in result) {
    orders.add(Order.fromJson(item));
  }
  return orders;
}
