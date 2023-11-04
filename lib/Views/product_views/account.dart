import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/Views/product_views/cart.dart';
import 'package:shopcart/services/auth/auth_service.dart';
import 'package:shopcart/utilities/Dialogs_overlays/signout_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? get userEmail => AuthService.fromFirebase().currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Account',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              userEmail ?? '',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

          //
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
                  context.read<AuthenticationBloc>().add(AuthEventSignOut());
                });
              }
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Text('Account'),
      ),
    );
  }
}
