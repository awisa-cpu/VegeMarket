import 'package:shopcart/models/product.dart';

class Order {
  //>id,products,total_price

  final String id;
  final List<Product> products;
  final double totalPrice;

  Order({
    required this.id,
    required this.products,
    required this.totalPrice,
  });
}
