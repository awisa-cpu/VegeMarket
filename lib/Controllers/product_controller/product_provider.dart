import 'package:flutter/foundation.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/services/database/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  //contain all the products
  final List<Product> _products = ProductsRepo().products;

  List<Product> _filtered = [];

  final List<Product> _cart = [];

  final List<Product> _favourite = [];

  double totalPrice = 0;

  int totalSelectedItems = 0;

  //to retrive all the products in cart
  List<Product> get favourite => _favourite;

  //to retrive all the products in cart
  List<Product> get cart => _cart;

  //to retrive all the products
  List<Product> get products => _products;

  //to retrive all filtered  products
  List<Product> get filtered => _filtered;

  void searchProducts(String textToSearch) {
    _filtered = _products
        .where((product) =>
            product.name.toLowerCase().contains(textToSearch.toLowerCase()))
        .toList();
    notifyListeners(); //update all listeners
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
