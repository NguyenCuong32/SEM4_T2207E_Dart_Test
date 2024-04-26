class Product {
  String item;
  String itemName;
  String price;
  String curency;
  String quantity;

  Product(this.item, this.itemName, this.price,this.curency, this.quantity);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
  
      json['item'] as String,
      json['itemName'] as String,
      json['price'] as String,
      json['curency'] as String,
      json['quantity'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'itemName': itemName,
      'price' : price,
      'curency' : curency,
      'quantity': quantity,
    };
  }
}
