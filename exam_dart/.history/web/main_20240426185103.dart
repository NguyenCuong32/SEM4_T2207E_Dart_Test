import 'package:web/helpers.dart';

import 'models/Order.dart';

HTMLLIElement newLI(String itemText) =>
    (document.createElement('li') as HTMLLIElement)..text = itemText;
List<Order>? orders;
void main() {
  String jsonUtil = Order
}
