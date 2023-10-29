import 'package:shopcart/models/product.dart';

class ProductsRepo {
  final List<Product> _products = [
    Product(
      id: 1,
      categoryId: 1,
      name: 'Potato',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/potato.png',
      weight: 1.32
    ),
    Product(
      id: 2,
      categoryId: 2,
      name: 'Banana',
      price: 1.32,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/banana.png',
      weight: 1.32
    ),
    Product(
      id: 3,
      categoryId: 3,
      name: 'Lettuce',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/lettuce.png',
      weight: 1.32
    ),
    Product(
      id: 4,
      categoryId: 3,
      name: 'Cabbage',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/cabbage.png',
       weight: 0.82,
    ),
    Product(
      id: 5,
      categoryId: 2,
      name: 'Tomatoes',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/tomatoes.png',
      weight: 1.35
    ),
    Product(
      id: 6,
      categoryId: 2,
      name: 'Egg Plant',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/eggplant.png',
       weight: 0.82
    ),
    Product(
      id: 1,
      categoryId: 1,
      name: 'Potato',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/potato.png',
      weight: 1.32
    ),
    Product(
      id: 2,
      categoryId: 2,
      name: 'Banana',
      price: 1.32,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/banana.png',
      weight: 1.32
    ),
    Product(
      id: 3,
      categoryId: 3,
      name: 'Lettuce',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/lettuce.png',
      weight: 1.32
    ),
    Product(
      id: 4,
      categoryId: 3,
      name: 'Cabbage',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/cabbage.png',
       weight: 0.82
    ),
    Product(
      id: 5,
      categoryId: 2,
      name: 'Tomatoes',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/tomatoes.png',
      weight: 1.35
    ),
    Product(
      id: 6,
      categoryId: 2,
      name: 'Egg Plant',
      price: 1.5,
      description: 'Thi is is a carbohydrate food',
      image: 'lib/images/products/eggplant.png',
       weight: 0.82
    ),
  ];

  //  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  List<Product> get products => _products;
}
