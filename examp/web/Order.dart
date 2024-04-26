import 'dart:convert';

class Order {
  final String item;
  final String itemName;
  final double price;
  final String currency;
  final int quantity;

  Order({
    required this.item,
    required this.itemName,
    required this.price,
    required this.currency,
    required this.quantity,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        item: json['Item'] as String,
        itemName: json['ItemName'] as String,
        price: json['Price'] as double,
        currency: json['Currency'] as String,
        quantity: json['Quantity'] as int,
      );

  @override
  String toString() {
    return 'Order(item: $item, itemName: $itemName, price: $price, currency: $currency, quantity: $quantity)';
  }
}


Future<List<Order>> parseOrdersFromJson(String jsonString) async {
  final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
  return jsonList.map((json) => Order.fromJson(json as Map<String, dynamic>)).toList();
}

void main() async {
  final String jsonString = '[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}]';

  try {
    final List<Order> orders = await parseOrdersFromJson(jsonString);
    print('Orders:');
    for (final order in orders) {
      print(order); // Display order details to the console
    }
  } on FormatException catch (e) {
    print('Error parsing JSON: $e');
  } catch (e) {
    print('Unexpected error: $e');
  }
}
