import 'dart:html';
import 'dart:convert';
import 'models/Order.dart';
import 'utils/OrderUtil.dart';

LIElement newLI(String itemText) =>
    (LIElement()..text = itemText);

void main() {
  HttpRequest.getString('./order.json').then((String jsonContent) {
    List<dynamic> personJsons = jsonDecode(jsonContent);
    List<Order> persons = personJsons
        .map((personJson) => Order(
            Item: personJson["Item"],
            ItemName: personJson["ItemName"],
            Price: personJson["Price"],
            Currency: personJson["Currency"],
            Quantity: personJson["Quantity"]))
        .toList();
    displayPersonInfo(persons);
    return persons;
  });
}

String getString() {
  String contents = '[{"id": 1,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."},{"id": 2,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."}]';
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
  final output = querySelector('#output') as DivElement;
  output.text = '';
  for (final item in orders) {
    output?.children.add(newLI(item.item.toString()));
    output?.children.add(newLI(item.itemName.toString()));
    output?.children.add(newLI(item.price.toString()));
    output?.children.add(newLI(item.currency.toString()));
    output?.children.add(newLI(item.quantity.toString()));
  }
}
