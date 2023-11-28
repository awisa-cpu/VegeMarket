import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/services/database/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  //contain all the products
  final List<Product> _products = ProductsRepo().products;

  final List<Product> _cart = [];

  final List<Product> _favourite = [];

  bool favouriteState = false;

  double totalPrice = 0;

  int totalSelectedItems = 0;

  //to retrive all the products in cart
  UnmodifiableListView<Product> get favourite =>
      UnmodifiableListView(_favourite);

  //to retrive all the products in cart
  UnmodifiableListView<Product> get cart => UnmodifiableListView(_cart);

  //to retrive all the products
  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

 void stateChanger(){
favouriteState = !favouriteState;
notifyListeners();
  }

  Iterable<Product> getProductsByCategoryId({required int categoryId}) {
    final newProducts =
        _products.where((product) => product.categoryId == categoryId);
    return newProducts;
  }

  Product getProductById({required int id}) {
    return _products.firstWhere((element) => element.id == id);
  }

  void addToCart({required Product product}) {
    _cart.add(product);
    totalSelectedItems = totalSelectedItems + 1;
    _increasePrice(product);
    notifyListeners();
  }

  void removeFromCart({required Product product}) {
    if (_cart.contains(product)) {
      _cart.remove(product);
      _decreasePrice(product);
      totalSelectedItems--;
    }
    notifyListeners();
  }

  void _decreasePrice(Product product) {
    totalPrice = totalPrice - product.price;
    notifyListeners();
  }

  void _increasePrice(Product product) {
    totalPrice = totalPrice + product.price;
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    totalSelectedItems = 0;
    notifyListeners();
  }

  void addToFavourite({required Product product}) {
    if (!_favourite.contains(product)) {
      _favourite.add(product);
    }
    notifyListeners();
  }

  
  void removeFromFavourite({required Product product}) {
    if (_favourite.contains(product)) {
      _favourite.remove(product);
    }
    notifyListeners();
  }
}
