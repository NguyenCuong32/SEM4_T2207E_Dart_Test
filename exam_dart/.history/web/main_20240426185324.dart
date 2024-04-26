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
  
}
