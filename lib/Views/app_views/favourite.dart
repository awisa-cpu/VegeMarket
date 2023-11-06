import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/utilities/dialogs/ask_to_remove_dialog.dart';
import 'package:shopcart/utilities/widgets/buy_button.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Items',
          style: TextStyle(fontSize: 20),
        ),
      ),

      //body
      body: Consumer<ProductProvider>(
        builder: (context, value, _) {
          final saved = value.favourite;

          if (saved.isEmpty) {
            //
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 50,
                    color: Colors.green,
                  ),

                  //
                  Text('No Saved Items')
                ],
              ),
            );
          } else {
            //
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: saved.length,
              itemBuilder: (context, index) {
                final product = saved[index];

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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //remove
                          TextButton(
                            onPressed: () async {
                              final ans = await showAskToRemove(
                                  context: context,
                                  title: 'Saved Item',
                                  content:
                                      'Do you really want to remove from saved? ');

                              if (ans!) {
                                _removeFromFavourite(product: product);
                              }
                            },
                            child: const Text('Remove'),
                          ),

                          //payment button
                          const BuyButton()
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  _removeFromFavourite({required Product product}) {
    context.read<ProductProvider>().removeFromFavourite(product: product);
  }
}
