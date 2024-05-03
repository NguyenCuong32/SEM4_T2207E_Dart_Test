
class order {
  String Item;
  String ItemName;
  double Price;
  String Currency;
  int Quantity;

  order(
      {required this.Item,
      required this.ItemName,
      required this.Quantity,
      required this.Price,
      required this.Currency});

  factory order.fromJson(Map<String, dynamic> json) {
    return order(
      Item: json['Item'] as String,
      ItemName: json['ItemName'] as String,
      Quantity: json['Quantity'] as int,
      Price: json['Price'] as double,
      Currency: json['Currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Item': Item,
      'ItemName': ItemName,
      'Quantity': Quantity,
      'Price': Price,
      'Currency': Currency,
    };
  }
}
