function newLI(itemText) {
    const li = document.createElement('li');
    li.textContent = itemText;
    return li;
  }
  
  function main() {
    const jsonUtil = getOrderUtilString();
    const alertDiv = document.querySelector('#alert');
    alertDiv.textContent = jsonUtil;
    const json = getJsonString();
    const orders = getOrder(json);
    renderOrder(orders);
  
    const addButton = document.querySelector('#addNew');
    addButton.addEventListener('click', function () {
      // Add
      orders.push({
        item: 'test1',
        itemName: 'hawaii',
        price: 1200.0,
        currency: 'VND',
        quantity: 10,
      });
      renderOrder(orders);
    });
  }
  
  function getJsonString() {
    const contents =
      '[{"id": 1,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."},{"id": 2,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."}]';
    return contents;
  }
  
  function renderOrder(orders) {
    const output = document.querySelector('#output');
    output.innerHTML = '';
  
    orders.forEach(function (item) {
      output.appendChild(newLI('Item: ' + item.item));
      output.appendChild(newLI('Item Name: ' + item.itemName));
      output.appendChild(newLI('Price: ' + item.price));
      output.appendChild(newLI('Currency: ' + item.currency));
      output.appendChild(newLI('Quantity: ' + item.quantity));
    });
  }
  
  document.addEventListener('DOMContentLoaded', main);