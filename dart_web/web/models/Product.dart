
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
}
