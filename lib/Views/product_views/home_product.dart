import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/Views/product_views/cart.dart';
import 'package:shopcart/Views/product_views/single_product.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    final allProducts = context.read<ProductProvider>().products;
    //

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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),

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

              //all products
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  final product = allProducts[index];
                  return SingleProduct(product: product);
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
