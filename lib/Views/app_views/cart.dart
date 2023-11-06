import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/utilities/dialogs/ask_to_remove_dialog.dart';
import 'package:shopcart/utilities/widgets/buy_button.dart';
import 'package:shopcart/utilities/widgets/quantity_option.dart';

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

      //
      body: Consumer<ProductProvider>(
        builder: (context, value, _) {
          //
          if (value.cart.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 50,
                    color: Colors.green,
                  ),

                  //
                  Text('Your Cart is Empty')
                ],
              ),
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

                        //remove
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //remove button
                            TextButton(
                              onPressed: () async {
                                final ans = await showAskToRemove(
                                    context: context,
                                    title: 'Cart Item',
                                    content:
                                        'Do you really want to remove item from Cart? ');

                                if (ans!) {
                                  _removeFromCart(product: product);
                                }
                              },
                              child: const Text('Remove'),
                            ),

                            //
                            const QuantityOption(),
                          ],
                        )
                      ],
                    );
                  },
                ),

                //action buttons
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //
                      BuyButton(
                        text: 'Clear cart',
                        onPressed: () => _clearCart(),
                      ),

                      //
                      const BuyButton(
                        text: 'Make Payment',
                      ),
                    ],
                  ),
                ),
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

  void _clearCart() async {
    final ans = await showAskToRemove(
      context: context,
      title: 'Cart Item',
      content: 'Do you really want to clear cart items?',
    );

    if (ans!) {
      Future.delayed(Duration.zero).then(
        (value) => context.read<ProductProvider>().clearCart(),
      );
    }
  }
}
