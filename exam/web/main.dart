import 'dart:html';
import 'package:web/helpers.dart';
import 'dart:convert';
import 'dart:io';

import 'model/order.dart';

// void main() {
//   List<Order> orders = getOrders();
//   for (Order order in orders) {
//     print(order.toString());
//   }
// }

// List<Order> getOrders() {
//   String json =
//       '[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}]';
//   List<dynamic> result = jsonDecode(json);
//   List<Order> orders = [];
//   for (var item in result) {
//     orders.add(Order.fromJson(item));
//   }
//   return orders;
// }
void main() {
  HttpRequest.getString('resources/order.json').then((String jsonContent) {
    List<dynamic> orderJsons = jsonDecode(jsonContent);
    List<Order> orders = orderJsons
        .map((orderJson) => Order(
            item: orderJson['Item'],
            itemName: orderJson['ItemName'],
            price: orderJson['Price'],
            currency: orderJson['Currency'],
            quantity: orderJson['Quantity']))
        .toList();
    displayOrderInfo(orders);
  });
}

void displayOrderInfo(List<Order> orders) {
  var orderInfoDiv = querySelector('#order-info') as TableElement;

  var headerRow = TableRowElement();
  headerRow.insertCell(0).text = 'ITEM';
  headerRow.insertCell(1).text = 'ITEM NAME';
  headerRow.insertCell(2).text = 'PRICE';
  headerRow.insertCell(3).text = 'CURENCY';
  headerRow.insertCell(4).text = 'QUANTITY';
  orderInfoDiv.createTHead().append(headerRow);

  orders.forEach((order) {
    var row = TableRowElement();
    row.insertCell(0).text = order.item;
    row.insertCell(1).text = order.itemName;
    row.insertCell(2).text = order.price.toString();
    row.insertCell(3).text = order.currency;
    row.insertCell(4).text = order.quantity.toString();
    orderInfoDiv.createTBody().replaceWith(row);
  });
}
