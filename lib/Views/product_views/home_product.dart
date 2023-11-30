import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/Views/app_views/cart.dart';
import 'package:shopcart/Views/product_views/single_product.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 13.5,
            right: 13.5,
            bottom: 12,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //app bar
              

              //search bar
              TextField(
                onChanged: (value) {
                  context.read<ProductProvider>().searchProducts(value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search on Vegemarket',
                ),
              ),

              const SizedBox(
                height: 10.5,
              ),

              //cart
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      //
                      Positioned(
                        left: 15,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Consumer<ProductProvider>(
                              builder: (context, value, _) {
                                return Text(
                                  value.totalSelectedItems.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      //
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          //route to the carts page

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              //
              const Text(
                'Fruits &',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),

              //
              const Text(
                'Vegetables',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),

              //
              Padding(
                padding: const EdgeInsets.all(8.5),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.5),
                    color: Colors.yellow.shade700,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stay home',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  wordSpacing: -1),
                            ),
                            Text(
                              'We deliver',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Text(
                              'Any where... Any time!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),

                        Image.asset(
                          'lib/images/products/fruits.png',
                          height: 500,
                          width: 190,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //all products
              Consumer<ProductProvider>(
                builder: (context, provider, _) {
                  final products = provider.filtered.isEmpty
                      ? provider.products
                      : provider.filtered;
                  //
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return SingleProduct(product: product);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),

      //bottom nav bar
    );
  }
}
