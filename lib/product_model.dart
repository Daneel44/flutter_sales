import 'review_model.dart';

class Product {
  int id;
  String name;
  String description;
  num price;
  String image;
  String category;
  late List<Review> reviews = reviewList;

  Product(this.id, this.name, this.price, this.description, this.category,
      this.image, this.reviews);

  String getPrice() => "$price €";

  Product.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["title"],
        price = map["price"],
        description = map["description"],
        category = map["category"],
        image = map["image"];
}
