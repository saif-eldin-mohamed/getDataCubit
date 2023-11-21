class ProductsModel {
  final int id;
  final String title;
  final String description;
  final String image;

  // final Rating rating;
  ProductsModel({
    required this.image,
    required this.title,
    required this.id,
    required this.description,
    // required this.rating,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      title: jsonData['title'],
      id: jsonData['id'],
      description: jsonData['description'],
      image: jsonData['image'],
    );
    //      rating: Rating.fromJson(jsonData['rating']));
  }
}

class Rating {
  final num rate;
  final num count;
  Rating({
    required this.rate,
    required this.count,
  });
  factory Rating.fromJson(Map<String, dynamic> jsonData) {
    return Rating(count: jsonData['count'], rate: jsonData['rate']);
  }
}
