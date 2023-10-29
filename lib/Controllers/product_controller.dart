import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/services/database/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  //contain all the products
  final List<Product> _products = ProductsRepo().products;

  final List<Product> _cart = [];

  double totalPrice = 0;

  //to retrive all the products in cart
  UnmodifiableListView<Product> get cart => UnmodifiableListView(_cart);

  //to retrive all the products
  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  List<Product> getProductsByCategoryId({required int categoryId}) {
    final newProducts = _products
        .where((product) => product.categoryId == categoryId) as List<Product>;
    notifyListeners();
    return newProducts;
  }

  void addToCart({required Product product}) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart({required Product product}) {
    if (_cart.contains(product)) {
      _cart.remove(product);
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  double getCartTotalPrice() {
    if (_cart.isNotEmpty) {
      for (var item in _cart) {
        totalPrice = totalPrice + item.price;
      }
    }
    notifyListeners();
    return totalPrice;
  }
}
