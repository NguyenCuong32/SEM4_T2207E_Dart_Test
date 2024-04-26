import 'dart:convert';
import 'dart:html';

import 'models/Order.dart';
import 'utils/OrderUtil.dart';

LIElement newLI(String itemText) =>
    (LIElement()..text = itemText);

void main() {
  String jsonUtil = OrderUtil.getString();
  final alert = querySelector('#alert') as DivElement;
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
  final output = querySelector('#output') as UListElement;
  output.children.clear(); // Xóa tất cả các phần tử con hiện tại của danh sách <ul>
  for (final item in orders) {
    output.children.add(newLI("Item: ${item.item}"));
    output.children.add(newLI("Item Name: ${item.itemName}"));
    output.children.add(newLI("Price: ${item.price}"));
    output.children.add(newLI("Currency: ${item.currency}"));
    output.children.add(newLI("Quantity: ${item.quantity}"));
  }
}