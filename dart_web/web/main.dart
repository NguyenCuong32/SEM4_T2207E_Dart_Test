import 'dart:html';

import 'package:web/helpers.dart';

import 'models/order.dart';
import 'services/order_service.dart';

void main() async {
  final now = DateTime.now();
  final element = document.querySelector('#output') as HTMLDivElement;
  element.text = 'The time is ${now.hour}:${now.minute}'
      ' and your Dart web app is running!';




  /* -------------------------------------------- */
  /* ------- 1. Display a table of orders ------- */
  /* -------------------------------------------- */

  Future<void> refreshOrderTable(List<Order> orders) async {
    // Get the order-table element
    Element orderTable = querySelector('#order-table')!;

    // Clear the existing order rows
    orderTable.innerHTML = '';

    // Add a row for each order
    for (var order in orders) {
      orderTable.innerHTML += '''
        <tr>
          <th scope="row">${order.id}</td>
          <td>${order.item}</td>
          <td>${order.itemName}</td>
          <td>${order.price}</td>
          <td>${order.currency}</td>
          <td>${order.quantity}</td>
          <td class="text-end">
            <button class="btn btn-warning edit-btn" data-id="${order.id}" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
            <button class="btn btn-danger delete-btn" data-id="${order.id}" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</button>
        </tr>
      ''';
    }
  };

  OrderService orderService = OrderService();
  List<Order> orders = await orderService.getAllOrders();
  refreshOrderTable(orders);





  /* ----------------------------------------------- */
  /* ----- 2. Edit & Delete order functionality ---- */
  /* ----------------------------------------------- */

  void attachEventListeners() {

    // Add event listener to the edit buttons
    for (var btn in querySelectorAll('.edit-btn')) {
      btn.onClick.listen((event) async {
        var id = int.parse(btn.getAttribute('data-id')!);
        Order? order = await orderService.getOrderById(id);

        // Populate the input fields with the order details 
        InputElement idInput = querySelector('#id-edit') as InputElement;
        InputElement itemInput = querySelector('#item-edit') as InputElement;
        InputElement itemNameInput = querySelector('#item-name-edit') as InputElement;
        InputElement priceInput = querySelector('#price-edit') as InputElement;
        InputElement currencyInput = querySelector('#currency-edit') as InputElement;
        InputElement quantityInput = querySelector('#quantity-edit') as InputElement;

        idInput.value = order!.id.toString();
        itemInput.value = order.item;
        itemNameInput.value = order.itemName;
        priceInput.value = order.price.toString();
        currencyInput.value = order.currency;
        quantityInput.value = order.quantity.toString();

        // Add event listener to the save button
        querySelector('#edit-order-btn')?.onClick.listen((event) async {
          // Update the order
          Order updatedOrder = Order(
            int.parse(idInput.value ?? ''), 
            itemInput.value ?? '', 
            itemNameInput.value ?? '',
            double.parse(priceInput.value ?? '0'), 
            currencyInput.value ?? 'USD',
            int.parse(quantityInput.value ?? '0')
          );
          await orderService.updateOrder(updatedOrder);

          // Refresh the order table
          orders = await orderService.getAllOrders();
          refreshOrderTable(orders);

          // Re-attach the event listeners
          attachEventListeners();

          // Clear the input values
          idInput.value = '';
          itemInput.value = '';
          itemNameInput.value = '';
          priceInput.value = '';
          currencyInput.value = '';
          quantityInput.value = '';
          
        });
      });
    }

    // Add event listener to the delete buttons
    for (var btn in querySelectorAll('.delete-btn')) {
      btn.onClick.listen((event) async {
        var id = int.parse(btn.getAttribute('data-id')!);

        querySelector('#delete-id')?.text = '#$id';

        // Add event listener to the delete button in the modal
        querySelector('#delete-order-btn')?.onClick.listen((event) async {
          // Delete the order
          await orderService.deleteOrder(id);

          // Refresh the order table
          orders = await orderService.getAllOrders();
          refreshOrderTable(orders);

          // Re-attach the event listeners
          attachEventListeners();
        });
      });

    }
  }

  attachEventListeners();




  /* -------------------------------------------- */
  /* --------- 3. Form to add new order --------- */
  /* -------------------------------------------- */

  // Get the inputs and the create button
  InputElement itemInput = querySelector('#item') as InputElement;
  InputElement itemNameInput = querySelector('#item-name') as InputElement;
  InputElement priceInput = querySelector('#price') as InputElement;
  InputElement currencyInput = querySelector('#currency') as InputElement;
  InputElement quantityInput = querySelector('#quantity') as InputElement;
  ButtonElement createOrderBtn = querySelector('#create-order-btn') as ButtonElement;

  createOrderBtn.onClick.listen((event) async {
    // Create a new order object
    Order newOrder = Order(
      0, 
      itemInput.value ?? '', 
      itemNameInput.value ?? '', 
      double.parse(priceInput.value ?? '0'), 
      currencyInput.value ?? 'USD',
      int.parse(quantityInput.value ?? '0')
    );

    // Add the new order to the list of orders
    await orderService.createOrder(newOrder);

    // Refresh the order table
    orders = await orderService.getAllOrders();
    refreshOrderTable(orders);

    // Clear the input values
    itemInput.value = '';
    itemNameInput.value = '';
    priceInput.value = '';
    currencyInput.value = '';
    quantityInput.value = '';

    // Re-attach the event listeners
    attachEventListeners();
    
  });




  /* -------------------------------------------- */
  /* --------- 3. Search orders function -------- */
  /* -------------------------------------------- */
  InputElement searchInput = querySelector('#search-input') as InputElement;
  ButtonElement searchBtn = querySelector('#search-btn') as ButtonElement;

  searchBtn.onClick.listen((event) async {
    String query = searchInput.value ?? '';
    List<Order> searchResults = orders.where((order) => order.item.contains(query) || order.itemName.contains(query)).toList();
    refreshOrderTable(searchResults);

    // Re-attach the event listeners
    attachEventListeners();
  });


  
}
