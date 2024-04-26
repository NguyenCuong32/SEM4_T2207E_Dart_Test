import 'package:web/helpers.dart';
import 'dart:convert';

import 'models/order.dart';

import 'utils/orderUtils.dart';

HTMLLIElement newLI(String itemText) =>
    (document.createElement('li') as HTMLLIElement)..text = itemText;
List<Order>? orders;
void main() {
  // String jsonUtil = orderUtils.getString();
  // final alert = querySelector('#alert') as HTMLDivElement;
  // alert.text = jsonUtil;
  String json = getString();
  List<Order> orders = getOrder(json);
  renderOrder(orders);
  final add = querySelector('#addNew');
  add?.onClick.listen((event) {
    //Add
    orders.add(Order(
      id: orders.length + 1,
      item: 'Iphone',
      itemName: 'Iphone13',
      quantity: 1,
      price: 500,
      currency: 'USD',
    ));
    renderOrder(orders);
  });
  // String json = getString();
  // List<Order> orders = getOrder(json);
  // renderOrder(orders);
}

String getString() {
  String contents =
      '[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency":"USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price":1500,"Currency": "USD","Quantity":1}]';
  return contents;
}

List<Order> getOrder(String json) {
  List<dynamic> jsonList = jsonDecode(json);
  List<Order> orders = [];

  for (var jsonOrder in jsonList) {
    orders.add(Order.fromJson(jsonOrder));
  }
  return orders;
}

void renderOrder(List<Order> orders) {
  final output = querySelector('#output') as HTMLDivElement;
  output.text = '';
  for (final item in orders) {
    output?.appendChild(newLI(item.id.toString()));
    output?.appendChild(newLI(item.item.toString()));
    output?.appendChild(newLI(item.itemName.toString()));
    output?.appendChild(newLI(item.quantity.toString()));
    output?.appendChild(newLI(item.price.toString()));
    output?.appendChild(newLI(item.currency.toString()));
  }
}
