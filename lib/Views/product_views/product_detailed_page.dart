import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/Views/product_views/single_product.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/utilities/routes/routes_constants.dart';

class ProductDetailedPage extends StatefulWidget {
  final Product product;
  const ProductDetailedPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailedPage> createState() => _ProductDetailedPageState();
}

class _ProductDetailedPageState extends State<ProductDetailedPage> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    //
    final similarProducts = context
        .read<ProductProvider>()
        .getProductsByCategoryId(categoryId: widget.product.categoryId);

    //
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 13.5, right: 13.5, bottom: 12, top: 50),
              child: Column(
                children: [
                  //action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //back button
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              goHome, (route) => false);
                        },
                        icon: const Icon(Icons.chevron_left),
                      ),

                      //profile button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.account_circle),
                      )
                    ],
                  ),

                  //image
                  Image.asset(widget.product.image!),

                  //
                  const SizedBox(
                    height: 15,
                  ),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //product name and owner
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'by Farm Fresh Veg Shop',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),

                      //rating
                      Material(
                        elevation: 1.5,
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 95,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.product.rating.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 16.5,
                  ),

                  //description
                  ExpandableText(
                    widget.product.description!,
                    expandText: 'Read more',
                    collapseText: 'Read less',
                    maxLines: 2,
                    linkColor: const Color.fromRGBO(111, 207, 151, 1),
                    style: const TextStyle(fontSize: 16.0),
                  ),

                  const SizedBox(
                    height: 20.5,
                  ),

                  //second section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Text(
                        '\$${widget.product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      //add and reduce quantity
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 115,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.5),
                            border: Border.all(width: 0.5)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //
                            IconButton(
                              onPressed: () {
                                //increase the quantity
                                setState(() {
                                  value = value + 1;
                                });
                              },
                              icon: const Icon(Icons.add),
                              enableFeedback: false,
                            ),

                            Text(value.toString()),
                            IconButton(
                              onPressed: () {
                                //decrease the quantity
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
                      ),

                      //buy button
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(111, 207, 151, 1),
                          borderRadius: BorderRadius.circular(20.5),
                        ),
                        child: const Text(
                          'Buy now',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //
            const SizedBox(
              height: 10.5,
            ),

            //
            const Divider(),

            //section under
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.5, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Similar Products',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10.5,
                  ),
                  ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: similarProducts.length,
                    itemBuilder: (context, index) {
                      final pro = similarProducts.elementAt(index);
                      return SingleProduct(product: pro);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
