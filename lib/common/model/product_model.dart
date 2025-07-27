class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photoUrl;

  ProductModel({
    required this.photoUrl,
    required this.id,
    required this.title,
    required this.currentPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<String> list = [];
    for (String s in jsonData['photos']) {
      list.add(s);
    }
    return ProductModel(
        id: jsonData['_id'],
        title: jsonData['title'],
        currentPrice: jsonData['currentPrice'] ?? 0,
        photoUrl: list);
  }
}
