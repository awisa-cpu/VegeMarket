import 'package:flutter/material.dart';
import 'package:shopcart/Views/product_views/home_product.dart';
import 'package:shopcart/Views/product_views/product_detailed_page.dart';
import 'package:shopcart/models/product.dart';
import 'package:shopcart/utilities/routes/routes_constants.dart';

Route generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      switch (settings.name) {
        case detailedProduct:
          final product = settings.arguments as Product;
          return ProductDetailedPage(
            product: product,
          );

        case loginPage:
          return const HomeProduct();

        case goHome:
          return const HomeProduct();

        default:
          return const Scaffold(
            body: Text('Page Unknown'),
          );
      }
    },
  );
}
