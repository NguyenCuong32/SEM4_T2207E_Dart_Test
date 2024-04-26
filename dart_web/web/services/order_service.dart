import 'dart:convert';

import '../models/order.dart';



class OrderService {

  static String content = '''
  [
    {"Id": 1, "Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},
    {"Id": 2, "Item": "A1001","ItemName": "Iphone 16","Price": 1300,"Currency": "USD","Quantity":1}
  ]
  ''';
  
  Future<List<Order>> getAllOrders() async {
    try {
      List<dynamic> ordersJson = jsonDecode(content);
      return ordersJson.map((json) => Order.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Order?> getOrderById(int id) async {
    try {
      List<Order> orders = await getAllOrders();
      return orders.firstWhere((order) => order.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> createOrder(Order order) async {
    try {
      List<Order> orders = await getAllOrders();
      int id = orders.isEmpty ? 1 : orders.last.id + 1;
      order.id = id;
      orders.add(order);
      content = jsonEncode(orders);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateOrder(Order order) async {
    try {
      List<Order> orders = await getAllOrders();
      int index = orders.indexWhere((o) => o.id == order.id);
      if (index != -1) {
        orders[index] = order;
        content = jsonEncode(orders);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteOrder(int id) async {
    try {
      List<Order> orders = await getAllOrders();
      orders.removeWhere((order) => order.id == id);
      content = jsonEncode(orders);
    } catch (e) {
      print(e);
    }
  }

  


}