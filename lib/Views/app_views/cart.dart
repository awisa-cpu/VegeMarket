import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/utilities/dialogs/ask_to_remove_dialog.dart';

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
        actions: [
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

      //
      body: Consumer<ProductProvider>(
        builder: (context, value, _) {
          //
          if (value.cart.isEmpty) {
            return const Center(
              child: Text('Your cart is Empty'),
            );
          } else {
            //
            return Column(
              children: [
                //
                Container(
                  color: Colors.grey.shade300,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal'),
                      Text(
                        "\$ ${value.totalPrice.toStringAsPrecision(2)}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),

                //
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    //
                    final product = value.cart[index];

                    //
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        ListTile(
                          leading: Image.asset(product.image ?? 'no image'),
                          title: Text(product.name),
                          subtitle: Text("\$${product.price.toString()}"),
                        ),

                        //
                        TextButton(
                          onPressed: () async {
                            final ans = await showAskToRemove(
                                context: context,
                                title: 'Saved Item',
                                content:
                                    'Do you really want to remove from Cart? ');

                            if (ans!) {
                              _removeFromCart(product: product);
                            }
                          },
                          child: const Text('Remove'),
                        )
                      ],
                    );
                  },
                ),

                //
                TextButton(
                    onPressed: _clearCart, child: const Text('Clear Cart')),
              ],
            );
          }
        },
      ),
    );
  }

  void _removeFromCart({required Product product}) {
    context.read<ProductProvider>().removeFromCart(product: product);
  }

  void _clearCart() {
    context.read<ProductProvider>().clearCart();
  }
}
