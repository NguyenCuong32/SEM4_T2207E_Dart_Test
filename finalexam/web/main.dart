import 'package:web/web.dart';
import 'dart:html';
import 'entity/order.dart';
import 'service/orderservice.dart';

void main() async {
  final element = document.querySelector('#output') as HTMLDivElement;
  element.text = 'My Order';

  orderservice productService = orderservice();
  List<order> products = await productService.getProducts();

  final table = TableElement();
  table.classes.add('table');

  final thead = TableRowElement();
  thead.children.addAll([
    TableCellElement()..text = 'Item',
    TableCellElement()..text = 'ItemName',
    TableCellElement()..text = 'Quantity',
    TableCellElement()..text = 'Price',
    TableCellElement()..text = 'Currency',
  ]);
  table.children.add(thead);

  for (int i = 0; i < products.length; i++) {
    final product = products[i];
    final row = TableRowElement();

    final itemRow = TableCellElement()..text = product.Item;
    final itemnameRow = TableCellElement()..text = product.ItemName;
    final quantityRow = TableCellElement()..text = product.Quantity.toString();
    final priceRow = TableCellElement()..text = product.Price.toString();
    final currencyRow = TableCellElement()..text = product.Currency;
    final deleteButton = ButtonElement()..text = 'Delete';

    void handleDeleteButtonClick(MouseEvent event) {
      products.removeAt(i);

      row.remove();
    }

    deleteButton.onClick
        .listen((event) => handleDeleteButtonClick(event as MouseEvent));

    final deleteButtonCell = TableCellElement()..append(deleteButton);

    row.children.addAll([
      itemRow,
      itemnameRow,
      quantityRow,
      priceRow,
      currencyRow,
      deleteButtonCell,
    ]);

    table.children.add(row);
  }

  final productListElement2 =
      document.querySelector('#product-table') as DivElement;
  productListElement2.children.add(table);
  final productForm = document.querySelector('#product-form') as FormElement;
  productForm.onSubmit.listen((event) {
    event.preventDefault();

    final itemInput = document.querySelector('#item-input') as InputElement;
    final itemnameInput =
        document.querySelector('#itemname-input') as InputElement;
    final quantityInput =
        document.querySelector('#quantity-input') as InputElement;
    final priceInput = document.querySelector('#price-input') as InputElement;
    final currencyInput =
        document.querySelector('#currency-input') as InputElement;

    String quantityInputString = quantityInput.value!;
    int quantityInputint = int.parse(quantityInputString);
    String priceInputstring = priceInput.value!;
    double priceInputdouble = double.parse(priceInputstring);

    final newProduct = order(
      Item: itemInput.value!,
      ItemName: itemnameInput.value!,
      Quantity: quantityInputint,
      Price: priceInputdouble,
      Currency: currencyInput.value!,
    );

    final newRow = TableRowElement();
    newRow.children.addAll([
      TableCellElement()..text = newProduct.Item,
      TableCellElement()..text = newProduct.ItemName,
      TableCellElement()..text = newProduct.Quantity.toString(),
      TableCellElement()..text = newProduct.Price.toString(),
      TableCellElement()..text = newProduct.Currency,
    ]);
    table.children.add(newRow);

    itemInput.value = '';
    itemnameInput.value = '';
    quantityInput.value = '';
    priceInput.value = '';
    currencyInput.value = '';
  });

  final productListElement =
      document.querySelector('#product-table') as DivElement;
  productListElement.children.add(table);
}
