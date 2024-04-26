import 'dart:convert';
import 'dart:html';
import 'package:web/helpers.dart';

class Order {
  final String Item;
  final String ItemName;
  final double Price;
  final String Currency;
  final int Quantity;

  Order({
    required this.Item,
    required this.ItemName,
    required this.Price,
    required this.Currency,
    required this.Quantity,
  });

  @override
  String toString() =>
      '{Item: "$Item", ItemName: "$ItemName", price: $Price,currency: "$Currency",quantity: $Quantity,}';
}

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

void displayPersonInfo(List<Order> persons) {
  var personInfoDiv = querySelector('#person-info') as TableElement;

  var tbody = TableCaptionElement();
  persons.forEach((person) {
    var row = TableRowElement();
    row.insertCell(0).text = person.Item.toString();
    row.insertCell(1).text = person.ItemName;
    row.insertCell(2).text = person.Price.toString();
    row.insertCell(3).text = person.Currency.toString();
    row.insertCell(4).text = person.Quantity.toString();

    tbody.append(row);
  });

  personInfoDiv.createTBody().replaceWith(tbody);
}
