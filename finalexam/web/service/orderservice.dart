import 'dart:convert';
import '../entity/order.dart';

class orderservice {
  Future<List<order>> getProducts() async {
    try {
      //String content = await HttpRequest.getString(filePath);
      String content =
          '''[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency":"USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price":1500,"Currency": "USD","Quantity":1}]''';
      List<dynamic> jsonList = jsonDecode(content);
      return jsonList.map((json) => order.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
