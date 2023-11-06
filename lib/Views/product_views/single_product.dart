import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/Views/product_views/product_detailed_page.dart';
import 'package:shopcart/models/product.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  bool fav = false;

  //
  @override
  Widget build(BuildContext context) {
    //
    return Material(
      elevation: 2.5,
      borderRadius: BorderRadius.circular(17),
      color: Colors.grey.shade100,
      child: SizedBox(
        height: 210,
        width: 210,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //favourite
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  enableFeedback: false,
                  padding: EdgeInsets.zero,
                  onPressed: () => _updateFavourite(product: widget.product),
                  icon: Icon(
                    Icons.favorite,
                    color: fav ? Colors.red : Colors.green,
                  ),
                )
              ],
            ),

            //image
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailedPage(product: widget.product),
                    ));
              },
              child: Image.asset(
                widget.product.image!,
                height: 70,
                width: 90,
              ),
            ),

            //other options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //name
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),

                  //price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${widget.product.price}/ kg'),

                      //add to cart
                      GestureDetector(
                        onTap: () => context
                            .read<ProductProvider>()
                            .addToCart(product: widget.product),
                        child: Container(
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
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //
          ],
        ),
      ),
    );
  }

  void _updateFavourite({required Product product}) {
    setState(() {
      fav = !fav;
    });

    if (fav) {
      context.read<ProductProvider>().addToFavourite(product: product);
    } else {
      context.read<ProductProvider>().removeFromFavourite(product: product);
    }
  }
}
