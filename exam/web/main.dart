import 'dart:convert';
import 'dart:html';

import 'package:web/helpers.dart';

import 'models/order.dart';

void main() {
  HttpRequest.getString('./assert/order.json').then((String jsonContent) {
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
