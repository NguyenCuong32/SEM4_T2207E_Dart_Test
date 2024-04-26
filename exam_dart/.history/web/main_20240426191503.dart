import 'dart:convert';
import 'dart:html';

import 'models/Order.dart';
import 'utils/OrderUtil.dart';

HTMLLIElement newLI(String itemText) =>
    (document.createElement('li') as HTMLLIElement)..text = itemText;

void main() {
  String jsonUtil = OrderUtil.getString();
  final alert = querySelector('#alert') as HTMLDivElement;
  alert.text = jsonUtil;
  String json = getJsonString();
  List<Order> orders = OrderUtil.getOrder(json);
  renderOrder(orders);

  final add = querySelector('#addNew');
  add?.onClick.listen((event) {
    // Add
    orders.add(Order(
      item: 'test1',
      itemName: 'hawaii',
      price: 1200.0,
      currency: 'VND',
      quantity: 10,
    ));
    renderOrder(orders);
  });
}

String getJsonString() {
  String contents =
      '[{"id": 1,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."},{"id": 2,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."}]';
  return contents;
}

void renderOrder(List<Order> orders) {
  final output = querySelector('#output ul') as UListElement;
  output.text = '';
  for (final item in orders) {
    output.children.add(newLI(item.item.toString()));
    output.children.add(newLI(item.itemName.toString()));
    output.children.add(newLI(item.price.toString()));
    output.children.add(newLI(item.currency.toString()));
    output.children.add(newLI(item.quantity.toString()));
  }
}