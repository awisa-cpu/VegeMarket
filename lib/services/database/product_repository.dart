import 'package:shopcart/models/product.dart';

class ProductsRepo {
  final List<Product> _products = [
    Product(
        id: 1,
        categoryId: 1,
        name: 'Potato',
        price: 1.5,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        image: 'lib/images/products/potato.png',
        weight: 1.32,
        rating: 4.0),
    Product(
        id: 2,
        categoryId: 2,
        name: 'Banana',
        price: 1.32,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        image: 'lib/images/products/banana2.png',
        weight: 1.32,
        rating: 4.7),
    Product(
      id: 3,
      categoryId: 3,
      name: 'Lettuce',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/lettuce.png',
      weight: 1.32,
      rating: 3.9,
    ),
    Product(
      id: 4,
      categoryId: 3,
      name: 'Cabbage',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/cabbage.png',
      weight: 0.82,
      rating: 3.8,
    ),
    Product(
        id: 5,
        categoryId: 2,
        name: 'Tomatoes',
        price: 1.5,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        image: 'lib/images/products/tomatoes.png',
        weight: 1.35,
        rating: 4.5),
    Product(
        id: 6,
        categoryId: 2,
        name: 'Egg Plant',
        price: 1.5,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        image: 'lib/images/products/eggplant.png',
        weight: 0.82,
        rating: 4.0),
    Product(
      id: 1,
      categoryId: 1,
      name: 'Potato',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/potato.png',
      weight: 1.32,
      rating: 4.0,
    ),
    Product(
      id: 2,
      categoryId: 2,
      name: 'Banana',
      price: 1.32,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/banana.png',
      weight: 1.32,
      rating: 4.7,
    ),
    Product(
      id: 3,
      categoryId: 3,
      name: 'Lettuce',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/lettuce.png',
      weight: 1.32,
      rating: 3.9,
    ),
    Product(
      id: 4,
      categoryId: 3,
      name: 'Cabbage',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/cabbage.png',
      weight: 0.82,
      rating: 3.8,
    ),
    Product(
      id: 5,
      categoryId: 2,
      name: 'Tomatoes',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/tomatoes.png',
      weight: 1.35,
      rating: 4.5,
    ),
    Product(
      id: 6,
      categoryId: 2,
      name: 'Egg Plant',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/eggplant.png',
      weight: 0.82,
      rating: 4.0,
    ),
  ];

  //  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  List<Product> get products => _products;
}
