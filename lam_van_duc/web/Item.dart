class Item {
  String item;
  String itemName;
  double price;
  String curency;
  int quantity;

  Item(this.item, this.itemName, this.price, this.curency, this.quantity);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      json['item'] as String,
      json['itemName'] as String,
      json['price'] as double,
      json['curency'] as String,
      json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'itemName': itemName,
      'price': price,
      'curency': curency,
      'quantity': quantity,
    };
  }
}
