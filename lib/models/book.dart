class Book {
  final String title;
  final String subtitle;
  final String ISBN13;
  final String price;
  final String imageUrl;
  final String url;

  Book({
    required this.title,
    required this.subtitle,
    required this.ISBN13,
    required this.price,
    required this.imageUrl,
    required this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'] ?? "",
        subtitle: json['subtitle'] ?? "",
        ISBN13: json['isbn13'] ?? "",
        price: (json['price'] as String).substring(1) ?? "",
        imageUrl: json['image'] ?? "",
        url: json['url'] ?? "");
  }
}
