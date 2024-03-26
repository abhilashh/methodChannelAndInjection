
import 'package:flutter/material.dart';
class Cart extends ChangeNotifier {
  final List<int> _cartItems = [];

  List<int> get items => _cartItems;

  void add(int itemNo) {
    _cartItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _cartItems.remove(itemNo);
    notifyListeners();
  }
}