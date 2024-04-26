import 'package:web/helpers.dart';
import 'dart:convert';
import 'models/Order.dart';
import 'utils/OrderUtil.dart';

HTMLLIElement newLI(String itemText) =>
    (document.createElement('li') as HTMLLIElement)..text = itemText;
List<Order>? orders;
void main() {
  void main() {
final jsonString =
'[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}]';

final List<Order> orders = [];

// Function to parse the JSON string and create Order objects
void parseOrdersFromJson(String jsonString) {
final List<dynamic> jsonList = json.decode(jsonString);
for (var jsonObj in jsonList) {
final order = Order(
jsonObj['Item'],
jsonObj['ItemName'],
jsonObj['Price'],
jsonObj['Currency'],
jsonObj['Quantity']);
orders.add(order);
}
}
}
