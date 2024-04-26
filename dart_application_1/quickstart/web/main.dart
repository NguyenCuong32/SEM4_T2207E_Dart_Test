import 'package:web/helpers.dart';
import 'dart:html';
import 'model/product.dart';
import 'service/product_service.dart';

void main() async {
  
  final element = document.querySelector('#output') as HTMLDivElement;
  element.text = 'EXAM';


  ProductService productService = ProductService();
  List<Product> products = await productService.getProducts();
  print(products);
  final table = TableElement();
  table.classes.add('table');

  final thead = TableRowElement();
  thead.children.addAll([
    TableCellElement()..text = 'Item',
    TableCellElement()..text = 'ItemName',
    TableCellElement()..text = 'Price',
    TableCellElement()..text = 'Curency',
    TableCellElement()..text = 'Quantity',
  ]);
  table.children.add(thead);

  //Create the table rows for each product
  for (Product product in products){
    final row = TableRowElement();
    row.children.addAll([
      //TableCellElement()..text = product.id,
      TableCellElement()..text = product.item,
      TableCellElement()..text = product.itemName,
      TableCellElement()..text = product.price,
      TableCellElement()..text = product.curency,
      TableCellElement()..text = product.quantity,
    ]);
    table.children.add(row);
  }

  // Add the table to the div with code='product-list'
  final productListElement = document.querySelector('#product-table') as DivElement;
  productListElement.children.add(table);
  
}