import 'dart:convert';
import 'dart:html';

class Order {
  final String item;
  final String itemName;
  final int price;
  final String currency;
  final int quantity;

  Order({
    required this.item,
    required this.itemName,
    required this.price,
    required this.currency,
    required this.quantity,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      item: json['Item'],
      itemName: json['ItemName'],
      price: json['Price'],
      currency: json['Currency'],
      quantity: json['Quantity'],
    );
  }
}

void main() {
  final ordersDiv = querySelector('#orders');

  // Chuỗi JSON đầu vào
  final jsonString =
      '[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}]';

  final List<Order> orders = parseOrders(jsonString);

  displayOrders(ordersDiv!, orders);
}

List<Order> parseOrders(String jsonString) {
  final List<dynamic> parsed = json.decode(jsonString);
  return parsed.map<Order>((json) => Order.fromJson(json)).toList();
}

void displayOrders(Element ordersDiv, List<Order> orders) {
  for (final order in orders) {
    final orderElement = DivElement()
      ..text = 'Item: ${order.item}, Item Name: ${order.itemName}, Price: ${order.price} ${order.currency}, Quantity: ${order.quantity}';
    ordersDiv.children.add(orderElement);
  }
}
