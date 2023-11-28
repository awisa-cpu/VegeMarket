import 'package:shopcart/models/product.dart';

class ProductsRepo {
  final List<Product> _products = [
    Product(
        id: 1,
        categoryId: 2,
        name: 'Potato',
        price: 1.5,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        image: 'lib/images/products/potato.png',
        weight: 6.43,
        rating: 4.0,
        ),
    Product(
        id: 2,
        categoryId: 1,
        name: 'Banana',
        price: 1.32,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        image: 'lib/images/products/banana2.png',
        weight: 5.32,
        rating: 4.7),
    Product(
      id: 3,
      categoryId: 2,
      name: 'Lettuce',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/lettuce.png',
      weight: 4.78,
      rating: 3.9,
    ),
    Product(
      id: 4,
      categoryId: 2,
      name: 'Cabbage',
      price: 1.5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/cabbage.png',
      weight: 3.9,
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
        weight: 3.35,
        rating: 4.5),
    Product(
        id: 6,
        categoryId: 2,
        name: 'Egg Plant',
        price: 1.5,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
        image: 'lib/images/products/eggplant.png',
        weight: 2.82,
        rating: 4.0),
    Product(
      id: 7,
      categoryId: 1,
      name: 'Guava',
      price: 5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/guava.png',
      weight: 4.4,
      rating: 4.2,
    ),
    Product(
      id: 8,
      categoryId: 1,
      name: 'Star fruit',
      price: 4,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/starfruit.png',
      weight: 3.32,
      rating: 3.2,
    ),
    Product(
      id: 9,
      categoryId: 1,
      name: 'Lemon',
      price: 3,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/lemon.png',
      weight: 3.89,
      rating: 4.2,
    ),
    Product(
      id: 10,
      categoryId: 1,
      name: 'Kiwi',
      price: 7,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/kiwi.png',
      weight: 1.9,
      rating: 4.0,
    ),
    Product(
      id: 11,
      categoryId: 1,
      name: 'Pineapple',
      price: 6,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/pineapple.png',
      weight: 5.6,
      rating: 4.2,
    ),
    Product(
      id: 12,
      categoryId: 2,
      name: 'Cauli flower',
      price: 5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/cauliflower.png',
      weight: 3.32,
      rating: 4.0,
    ),
    Product(
      id: 13,
      categoryId: 2,
      name: 'Brocholi',
      price: 5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/brocholi.png',
      weight: 4.32,
      rating: 4.2,
    ),
    Product(
      id: 14,
      categoryId: 2,
      name: 'Peas',
      price: 5,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/peas.png',
      weight: 1.32,
      rating: 4.2,
    ),
    Product(
      id: 15,
      categoryId: 2,
      name: 'Spinach',
      price: 9,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/spinach.png',
      weight: 3.5,
      rating: 4.2,
    ),
    Product(
      id: 16,
      categoryId: 2,
      name: 'Onions',
      price: 10,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      image: 'lib/images/products/onions.jpg',
      weight: 4.9,
      rating: 4.0,
    ),
  ];

  //  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  List<Product> get products => _products;
}
