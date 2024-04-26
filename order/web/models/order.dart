class Order {
  final int id;
  final String item;
  final String itemName;
  final int quantity;
  final double price;
  final String currency;

  Order(
      {required this.id,
      required this.item,
      required this.itemName,
      required this.quantity,
      required this.price,
      required this.currency});
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json["id"],
        item: json["item"],
        itemName: json["itemName"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        currency: json["currency"]);
  }
}
