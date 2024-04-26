import 'dart:convert';

import 'package:web/helpers.dart';

import 'models/order.dart';
import 'models/order.dart';
import 'utils/jsonUtil.dart';

// import 'utils/jsonUtil.dart';
HTMLLIElement newLI(String itemText) =>
    (document.createElement('li') as HTMLLIElement)..text = itemText;
List<Order>? products;
void main() {
  String jsonUtil = JsonUtil.getString();
  final alert = querySelector('#alert') as HTMLDivElement;
  alert.text = jsonUtil;
  String json = getString();
  List<Order> orders = getProduct(json);
  renderProduct(orders);
  final add = querySelector('#addNew');
  add?.onClick.listen((event) {
    //Add
    orders.add(Order(
     item:"A1000" ,
      itemName: 'Iphone 15',
      price: 1200,
      currency: 'USD',
      quantity: 1
    ));
    renderProduct(orders);
  });
}

String getString() {
  String contents =
      '[{"Item": "A1000","ItemName": Iphone 15,"Price": 1200, "Currency":"USD","Quantity": 1},{ "Item": "A1001","ItemName": Iphone 16,"Price": 1500, "Currency":"USD","Quantity": 1}]';
  return contents;
}
List<Order> getProduct(String json) {
  List<dynamic> jsonList = jsonDecode(json);
  List<Order> products = [];

  for (var jsonProduct in jsonList) {
    products.add(Order.fromJson(jsonProduct));
  }
  return products;
}

void renderProduct(List<Order> orders) {
  final output = querySelector('#output') as HTMLDivElement;
  output.text = '';
  for (final item in orders) {
    output?.appendChild(newLI(item.item.toString()));
    output?.appendChild(newLI(item.itemName.toString()));
    output?.appendChild(newLI(item.price.toString()));
     output?.appendChild(newLI(item.currency.toString()));
      output?.appendChild(newLI(item.quantity.toString()));
  }
}
