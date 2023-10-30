class Product {
//>id,name,description,price,image,

  
  final int id;
  final int categoryId;
  final String name;
  String? description;
  final double price;
   double? weight;
  String? image;
  final double rating;


  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    this.description,
    required this.price,
    this.image,
    this.weight,
    required this.rating,
  });
}
