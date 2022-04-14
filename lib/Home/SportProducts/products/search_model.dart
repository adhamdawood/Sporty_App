class SearchModel {
  String productId;
  String descriptionMinimized;
  String imageUrl;
  String brand;
  String sportName;
  String name;
  double price;

  SearchModel({
    this.productId,
    this.descriptionMinimized,
    this.imageUrl,
    this.brand,
    this.sportName,
    this.name,
    this.price,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    productId: json['productId'] as String,
    descriptionMinimized: json['descriptionMinimized'] as String,
    imageUrl: json['imageUrl'] as String,
    brand: json['brand'] as String,
    sportName: json['sportName'] as String,
    name: json['name'] as String,
    price: json['price'] == null ? 0.0 : json['price'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'descriptionMinimized': descriptionMinimized,
    'imageUrl': imageUrl,
    'brand': brand,
    'sportName': sportName,
    'name': name,
    'price': price,
  };
}