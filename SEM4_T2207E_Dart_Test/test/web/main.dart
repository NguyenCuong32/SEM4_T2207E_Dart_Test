import 'dart:convert';
import 'dart:html';
import 'package:web/helpers.dart';

class Order {
  String item;
  String itemName;
  int price;
  String currency;
  int quantity;

  Order({
    required this.item,
    required this.itemName,
    required this.price,
    required this.currency,
    required this.quantity,
  });

  String get getItem => this.item;

  set setItem(String item) => this.item = item;

  get getItemName => this.itemName;

  set setItemName(itemName) => this.itemName = itemName;

  get getPrice => this.price;

  set setPrice(price) => this.price = price;

  get getCurrency => this.currency;

  set setCurrency(currency) => this.currency = currency;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  @override
  String toString() {
    return 'Order(item: $item, itemName: $itemName, price: $price, curency: $currency, quantity: $quantity)';
  }
}

void main() {
  HttpRequest.getString('order.json').then((String jsonContent) {
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
  headerRow.insertCell(0).text = 'Item';
  headerRow.insertCell(1).text = 'Item Name';
  headerRow.insertCell(2).text = 'Price';
  headerRow.insertCell(3).text = 'Currency';
  headerRow.insertCell(4).text = 'Quantity';
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
