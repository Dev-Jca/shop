import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, String price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
    } else {
      // _items.putIfAbsent(productId, () =>CartItem(id: DateTime.now(), title: title, quantity: quantity, price: price));
    }
  }
}