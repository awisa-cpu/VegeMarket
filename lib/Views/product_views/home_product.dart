import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/Views/product_views/single_product.dart';
import 'package:shopcart/utilities/Dialogs_overlays/signout_dialog.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  IconButton(
                    onPressed: () async {
                      final value = await showSignOutDialog(
                        context: context,
                        title: "Sign Out ",
                        content: "Are you sure you want to sign out?",
                      );

                      //
                      if (value != null && value == true) {
                        Future.delayed(
                          Duration.zero,
                        ).then((_) {
                          context
                              .read<AuthenticationBloc>()
                              .add(AuthEventSignOut());
                        });
                      }
                    },
                    icon: const Icon(Icons.logout),
                  )
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
