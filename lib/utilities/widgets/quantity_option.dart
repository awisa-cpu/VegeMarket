import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/models/product.dart';

class QuantityOption extends StatefulWidget {
  const QuantityOption({super.key, this.product});
  final Product? product;

  @override
  State<QuantityOption> createState() => _QuantityOptionState();
}

class _QuantityOptionState extends State<QuantityOption> {
  int value = 0;

  //
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProductProvider>();
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.5),
        border: Border.all(width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          IconButton(
            onPressed: () {
              //increase the quantity
              provider.increasePrice(widget.product!);
              setState(() {
                value = value + 1;
              });
            },
            icon: const Icon(Icons.add),
            enableFeedback: false,
          ),

          Text(value.toString()),

          //
          IconButton(
            onPressed: () {
              //decrease the quantity
              provider.decreasePrice(widget.product!);
              setState(() {
                if (value != 0) {
                  value = value - 1;
                }
              });
            },
            icon: const Icon(Icons.remove),
            enableFeedback: false,
          ),
        ],
      ),
    );
  }
}
