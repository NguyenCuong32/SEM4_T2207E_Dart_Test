class Order{
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
      required this.Quantity
    });

    factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      Item: json['Item'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
}