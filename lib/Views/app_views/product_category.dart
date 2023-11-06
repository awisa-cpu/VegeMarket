import 'package:flutter/material.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/Views/product_views/single_product.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {

    //
    final fruits = ProductProvider().getProductsByCategoryId(categoryId: 1);
    final vegetables = ProductProvider().getProductsByCategoryId(categoryId: 2);
    final size = MediaQuery.of(context).size;


    //
    return Scaffold(
      body: SingleChildScrollView(
        //
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: Column(
            children: [
              //
              const Text(
                'Fresh Fruits',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              //fruits
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                // color: Colors.red,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: fruits.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final product = fruits.elementAt(index);

                    return SingleProduct(product: product);
                  },
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              //image
              Container(
                height: size.height * 0.1,
                // width: size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Stack(
                  children: [
                    Image.asset('lib/images/products/banner.png'),
                    const Text(
                      'Enjoy your day',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    const Positioned(
                      bottom: 35,
                      left: 5,
                      child: Text(
                        'Get 50% off',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),

              //
              const Text(
                'Fresh Vegetables',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              //vegetables
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: vegetables.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final product = vegetables.elementAt(index);

                    return SingleProduct(product: product);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
