import 'dart:html';
import 'Service.dart';

void main() {
  ListData();

  Element? button = querySelector('#add');
  button!.onClick.listen(add);

  Element? search = querySelector('#search-id');
  search!.onKeyUp.listen((event) {
    if (event is KeyboardEvent && event.keyCode == KeyCode.ENTER) {
      searchData(event);
    }
  });
}
