import 'package:shopcart/models/product.dart';

class Category {
  //>id,name,products

  final int id;
  final String name;
  String? description;
  final List<Product> products;

  Category({
    required this.id,
    required this.name,
    this.description,
    required this.products,
  });
}
