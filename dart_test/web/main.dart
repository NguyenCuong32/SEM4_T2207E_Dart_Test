import 'package:web/helpers.dart';
import 'dart:convert';

import 'package:web/web.dart';
// import 'dart:html';

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
    required this.quantity});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      item: json['Item'],
      itemName: json['ItemName'],
      price: json['Price'],
      currency: json['Currency'],
      quantity: json['Quantity'],
    );
  }

  
  Map<String, dynamic> toJson() => {
    'Item': item,
    'ItemName': itemName,
    'Price': price,
    'Currency': currency,
    'Quantity': quantity,
  };
}

//Parse the JSON string
String jsonString = '[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}]';
List<Order> orders = (json.decode(jsonString) as List)
    .map((data) => Order.fromJson(data))
    .toList();

//Save the product (HARD CODED)
Future<void> saveProduct() async {
  final Order order = Order(item: 'A1002', itemName: 'Iphone 17', price: 1800, currency: 'USD', quantity: 1);
  orders.add(order);
  renderProduct(orders);
}


void main() {
  final now = DateTime.now();
  final element = document.querySelector('#output') as HTMLDivElement;
  element.text = 'The time is ${now.hour}:${now.minute}'
      ' and your Dart web app is running!';
      renderProduct(orders);
}

void renderProduct(List<Order> orders) {
  final output1 = document.querySelector('#output1') as HTMLDivElement;
  output1.text ='';
  for (final order in orders) {
    output1.appendChild(document.createElement('li')..text = order.itemName);
    output1.appendChild(document.createElement('li')..text = order.quantity.toString());
    output1.appendChild(document.createElement('li')..text = order.price.toString());
    output1.appendChild(document.createElement('li')..text = order.currency);

  }
}

