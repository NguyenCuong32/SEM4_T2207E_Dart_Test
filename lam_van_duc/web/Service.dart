import 'dart:html';
import 'Item.dart';

List<Item> items = [
  Item("A0001", "Item 1", 5000, "USD", 10),
  Item("A0002", "Item 2", 5000, "USD", 10),
  Item("A0003", "Item 3", 5000, "USD", 10),
  Item("A0004", "Item 4", 5000, "USD", 10),
  Item("A0005", "Item 5", 5000, "USD", 10),
  Item("A0006", "Item 6", 5000, "USD", 10),
  Item("A0007", "Item 7", 5000, "USD", 10),
  Item("A0008", "Item 8", 5000, "USD", 10)
];

void add(Event event) {
  String? item = (querySelector('#item') as InputElement).value;
  String? itemName = (querySelector('#itemName') as InputElement).value;
  String? price = (querySelector('#price') as InputElement).value;
  String? quantity = (querySelector('#quantity') as InputElement).value;
  String? curency = (querySelector('#curency') as InputElement).value;
  items.add(Item(
      item!, itemName!, double.parse(price!), curency!, int.parse(quantity!)));
  ListData();
}

void ListData() {
  Element? body = querySelector('#body-data');
  String data = "";
  int i = 0;
  items.forEach((element) {
    data += '''
              <tr>
                <td>${i + 1}</td>
                <td>${element.item}</td>
                <td>${element.itemName}</td>
                <td>${element.quantity}</td>
                <td>${element.price.toString()}</td>
                <td>${element.curency}</td>
              </tr>
            ''';
    i++;
  });

  body!.setInnerHtml(data);
}

void searchData(Event event) {
  String? search = (querySelector('#search-id') as InputElement).value;
  if (search == null || search.length == 0) {
    ListData();
  } else {
    List<Item> foundItems = items.where((item) => item.item == search).toList();

    if (foundItems.isNotEmpty) {
      Element? body = querySelector('#body-data');
      String data = "";
      int i = 0;
      foundItems.forEach((item) {
        data += '''
              <tr>
                <td>${i + 1}</td>
                <td>${item.item}</td>
                <td>${item.itemName}</td>
                <td>${item.quantity}</td>
                <td>${item.price.toString()}</td>
                <td>${item.curency}</td>
              </tr>
            ''';
        i++;
      });
      body!.setInnerHtml(data);
    } else {
      Element? body = querySelector('#body-data');
      String data = "";
      body!.setInnerHtml(data);
    }
  }
}
