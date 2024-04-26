import 'package:web/helpers.dart';
import 'dart:html';

import 'model/order.dart';
import 'service/order_service.dart';

void main() async {


  Future<void> refreshOrderTable(List<Order> orders) async {
    
    Element orderTable = querySelector('#order-table')!;

    // Clear the existing product rows
    orderTable.innerHTML = '';

    // Add a row for each product
    for (var order in orders) {
      orderTable.innerHTML += '''
        <tr>
          <th scope="row">${order.Item}</td>
          <td>${order.ItemName}</td>
          <td>${order.Quantity}</td>
          <td>${order.Price}</td>
          <td>${order.Currency}</td>
          <td class="text-end">
            <button class="btn btn-warning edit-btn" data-id="${order.Item}" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
            <button class="btn btn-danger delete-btn" data-id="${order.Item}" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</button>
        </tr>
      ''';
    }
  }

  OrderService orderService = OrderService();
  List<Order> orders = await orderService.getOrders();
  refreshOrderTable(orders);
  

  // Get the 3 inputs and the create button
  InputElement itemInput = querySelector('#item') as InputElement;
  InputElement itemNameInput = querySelector('#item-name') as InputElement;
  InputElement quantityInput = querySelector('#quantity') as InputElement;
  InputElement priceInput = querySelector('#price') as InputElement;
  InputElement currencyInput = querySelector('#currency') as InputElement;
        
  ButtonElement createOrdertBtn = querySelector('#create-order-btn') as ButtonElement;

  createOrdertBtn.onClick.listen((event) async {
    
    Order newdOrder = Order(itemInput.value ?? '', itemNameInput.value ?? '', 
    int.parse(priceInput.value ?? ''), currencyInput.value ?? '',int.parse(quantityInput.value ?? ''));

    // Add the new product to the list of products
    await orderService.createOrder(newdOrder);

    // Refresh the product table
   List<Order> orders = await orderService.getOrders();
    refreshOrderTable(orders);

    // Clear the input values
   // Clear the input values
          itemInput.value = '';
          itemNameInput.value = '';
          quantityInput.value = '';
          priceInput.value = '';
          currencyInput.value = '';
   

    // Re-attach the event listeners
  
    
  });
  

}