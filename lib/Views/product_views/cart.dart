import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Consumer<ProductProvider>(
          builder: (context, value, child) =>
              Text(value.totalSelectedItems.toString()),
        ),
      ),
    );
  }
}
