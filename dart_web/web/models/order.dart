class Order {
  int id;
  String item;
  String itemName;
  double price;
  String currency;
  int quantity;

  Order(this.id, this.item, this.itemName, this.price, this.currency, this.quantity);

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['Id'],
      json['Item'],
      json['ItemName'],
      json['Price'],
      json['Currency'],
      json['Quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Item': item,
      'ItemName': itemName,
      'Price': price,
      'Currency': currency,
      'Quantity': quantity,
    };
  }
  
}