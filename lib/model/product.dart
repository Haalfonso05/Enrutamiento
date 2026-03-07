class Product {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => 
      Product(id: json['id'] ?? "not id", title: json['title'] ?? "not title", slug: json['slug'] ?? "not slug", description: json['description'] ?? "not description", price: json['price'] ?? 0);
}