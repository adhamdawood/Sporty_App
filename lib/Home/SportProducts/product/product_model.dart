class ProductModel {
  String productId;
  String description;
  String imageUrl;
  String brand;
  String sportName;
  String name;
  double price;
  bool isOutOfStock;

  ProductModel({
    this.productId,
    this.description,
    this.imageUrl,
    this.brand,
    this.sportName,
    this.name,
    this.price,
    this.isOutOfStock
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json['productId'] as String,
    description: json['description']  as String,
    imageUrl: json['imageUrl'] as String,
    brand: json['brand'] as String,
    sportName: json['sportName'] as String,
    name: json['name'] as String,
    isOutOfStock: json['isOutOfStock'] as bool,
    price: json['price'] == null ? 0.0 : json['price'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'description': description,
    'imageUrl': imageUrl,
    'brand': brand,
    'sportName': sportName,
    'name': name,
    'price': price,
    'isOutOfStock': isOutOfStock,
  };
}