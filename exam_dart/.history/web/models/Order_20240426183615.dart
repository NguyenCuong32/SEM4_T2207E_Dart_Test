Class Order{
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
      required this.Quantity
    });

    factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
}