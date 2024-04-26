document.getElementById('orderForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var item = document.getElementById('item').value;
    var itemName = document.getElementById('itemName').value;
    var price = document.getElementById('price').value;
    var currency = document.getElementById('currency').value;
    var quantity = document.getElementById('quantity').value;
    var newRow = '<tr><td>' + item + '</td><td>' + itemName + '</td><td>' + price + '</td><td>' + currency + '</td><td>' + quantity + '</td><td><button onclick="editOrder(this)">Edit</button><button onclick="deleteOrder(this)">Delete</button></td></tr>';
    document.getElementById('orderList').insertAdjacentHTML('beforeend', newRow);
    document.getElementById('orderForm').reset();
});

function editOrder(button) {
    var row = button.parentNode.parentNode;
    var cells = row.getElementsByTagName('td');
    document.getElementById('item').value = cells[0].innerText;
    document.getElementById('itemName').value = cells[1].innerText;
    document.getElementById('price').value = cells[2].innerText;
    document.getElementById('currency').value = cells[3].innerText;
    document.getElementById('quantity').value = cells[4].innerText;
    row.remove();
}

function deleteOrder(button) {
    var row = button.parentNode.parentNode;
    row.remove();
}