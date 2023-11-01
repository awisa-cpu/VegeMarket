import 'package:flutter/material.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/utilities/routes/routes_constants.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    //
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {
                  //

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      detailedProduct, (route) => false,
                      arguments: product);
                },
                child: Image.asset(
                  product.image!,
                  height: 70,
                  width: 90,
                )),

            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text('by weight ${product.weight ?? 0.0} kg'),
              ],
            ),

            //
            const SizedBox(
              height: 18.4,
            ),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('\$${product.price.toString()}'),

                //
                Container(
                  height: 23,
                  width: 22,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
