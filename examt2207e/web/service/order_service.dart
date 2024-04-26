import 'dart:convert';

import '../model/order.dart';

List<Order> jsonListOrders = [
         Order (
             "Item 1",
             "Item 2",
             1,
             "USD",
             5
         )
       
      ];
class OrderService {

  static String content = '''
      ''';

  Future<List<Order>> getOrders() async {
    try {

        
        
        return jsonListOrders;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Order?> getOrdertById(String Item) async {
    try {
      List<Order> orders = await getOrders();
      return orders.firstWhere((order) => order.Item == Item);
    } catch (e) {
      return null;
    }
  }

  Future<void> createOrder(Order order) async {
    try {
      jsonListOrders.add(order);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateOrder(Order order) async {
    try {
      List<Order> orders = await getOrders();
      int index = orders.indexWhere((p) => p.Item == order.Item);
      if (index != -1) {
        orders[index] = order;
        content = jsonEncode(orders);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteOrder(String Item) async {
    try {
      List<Order> orders = await getOrders();
      orders.removeWhere((order) => order.Item == Item);
      content = jsonEncode(orders);
    } catch (e) {
      print(e);
    }
  }
}