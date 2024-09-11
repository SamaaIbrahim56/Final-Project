class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double price;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    required this.price,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      thumbnail: json['thumbnail'],
    );
  }
}