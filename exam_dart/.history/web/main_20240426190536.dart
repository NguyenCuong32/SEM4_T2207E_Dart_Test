import 'package:web/helpers.dart';
import 'dart:convert';
import 'models/Order.dart';
import 'utils/OrderUtil.dart';

HTMLLIElement newLI(String itemText) =>
    (document.createElement('li') as HTMLLIElement)..text = itemText;
List<Order>? orders;
void main() {
  String jsonUtil = OrderUtil.getString();
  final alert = querySelector('#alert') as HTMLDivElement;
  alert.text = jsonUtil;
  String json = getString();
  List<Order> orders = getOrder(json);
  renderOrder(orders);
    final add = querySelector('#addNew');
      add?.onClick.listen((event) {
    //Add
    orders.add(orders(
      item: 'test1',
      name: 'hawaii',
      price: 1200.0,
      curr: 'New version iphone 16',
    ));
    renderProduct(products);
  });
}


String getString() {
  String contents =
      '[{"id": 1,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."},{"id": 2,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."}]';
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
    output?.appendChild(newLI(item.item.toString()));
    output?.appendChild(newLI(item.itemName.toString()));
    output?.appendChild(newLI(item.price.toString()));
    output?.appendChild(newLI(item.currency.toString()));
    output?.appendChild(newLI(item.quantity.toString()));
    
  }
}
