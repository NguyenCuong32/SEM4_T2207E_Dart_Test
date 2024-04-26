// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  final String item;
  final String itemName;
  final double price;
  final String currency;
  final int quantity;
  Order(
      {required this.item,
      required this.itemName,
      required this.price,
      required this.currency,
      required this.quantity});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      item: json['item'],
      itemName: json['itemName'],
      price: json['price'].toDouble(),
      currency: json['currency'],
      quantity: json['quantity'],
    );
  }

  @override
  String toString() {
    return 'Order(item: $item, itemName: $itemName, price: $price, currency: $currency, quantity: $quantity)';
  }
}
