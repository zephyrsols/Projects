import 'package:hive_flutter/hive_flutter.dart';

class CartDatabase {
  List items = [];
  List pizzaList = [];
  List burgerList = [];
  List dealsList = [];
  List extraFoodList = [];

  //box
  final _myCartBox = Hive.box("cart");

  void createInitialData() {}

  void loadData() {
    items = _myCartBox.get("ITEMS");
    pizzaList = _myCartBox.get("PIZZA");
    burgerList = _myCartBox.get("BURGER");
    dealsList = _myCartBox.get("DEALS");
    extraFoodList = _myCartBox.get("EXTRA_FOOD");
  }

  void updateDatabase() {
    _myCartBox.put("ITEMS", items);
    _myCartBox.put("PIZZA", pizzaList);
    _myCartBox.put("BURGER", burgerList);
    _myCartBox.put("DEALS", dealsList);
    _myCartBox.put("EXTRA_FOOD", extraFoodList);
  }
}
