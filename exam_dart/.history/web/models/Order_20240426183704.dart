class Order{
  final String item;
  final String itemName;
  final double price;
  final String Currency;
  final int Quantity;

    Order({
      required this.Item,
      required this.ItemName,
      required this.Price,
      required this.Currency,
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