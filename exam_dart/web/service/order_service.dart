import 'dart:convert';

import '../model/order.dart';


class OrderService {

  static String content = '''[
        {
            "Item" : 1,
            "ItemName" : "iphone 14",
            "Price" : "samsung",
            "Currency" : "iphone 14",
            "Quantity" : "samsung"
        },
        {
            "Item" : 1,
            "ItemName" : "iphone 14",
            "Price" : "samsung",
            "Currency" : "iphone 14",
            "Quantity" : "samsung"
        },
        {
            "Item" : 1,
            "ItemName" : "iphone 14",
            "Price" : "samsung",
            "Currency" : "iphone 14",
            "Quantity" : "samsung"
        },
        {"Item" : 1,
            "ItemName" : "iphone 14",
            "Price" : "samsung",
            "Currency" : "iphone 14",
            "Quantity" : "samsung"
        },
        {
           "Item" : 1,
            "ItemName" : "iphone 14",
            "Price" : "samsung",
            "Currency" : "iphone 14",
            "Quantity" : "samsung"
        },
        {
            "Item" : 1,
            "ItemName" : "iphone 14",
            "Price" : "samsung",
            "Currency" : "iphone 14",
            "Quantity" : "samsung"
        }
      ]
      ''';

  Future<List<Order>> getOrders() async {
    try {
        
        List<dynamic> jsonListOrders = jsonDecode(content);
        
        return jsonListOrders.map((order) => Order.fromJson(order)).toList();

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
      List<Order> orders = await getOrders();
      orders.add(order);
      content = jsonEncode(orders);
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