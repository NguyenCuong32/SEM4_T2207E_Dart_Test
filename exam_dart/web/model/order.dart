class Order {
  String Item;
  String ItemName;
  int Price;
  String Currency;
  int Quantity;

  Order(this.Item, this.ItemName, this.Price,this.Currency, this.Quantity,);

factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['Item'],
      json['ItemName'],
      json['Price'],
      json['ItemName'],
      json['Price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Item': Item,
      'ItemName': ItemName,
      'Price': Price,
      'Currency': Currency,
      'Quantity': Quantity,
    };
  }
}