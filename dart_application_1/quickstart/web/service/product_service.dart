import 'dart:convert';
import '../model/product.dart';


class ProductService {
  final String filePath = "product.json";

  Future<List<Product>> getProducts() async {
    try {
      //String content = await HttpRequest.getString(filePath);
      String content = '''[{"item": "A1000","itemName": "Iphone 15","price": 1200,"curency":
"USD","quantity":1},{"item": "A1001","itemName": "Iphone 16","price":
1500,"curency": "USD","quantity":1}]''';

        List<dynamic> jsonList = jsonDecode(content);
                return jsonList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}