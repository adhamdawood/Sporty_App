class CartProductModel {
  dynamic productId;
  String imageUrl;
  String brand;
  String name;
  double price;
  int counter;

  CartProductModel({
    this.productId,
    this.imageUrl,
    this.brand,
    this.name,
    this.price,
    this.counter
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
    productId: json['productId'] as String,
    imageUrl: json['imageUrl'] as String,
    brand: json['brand'] as String,
    name: json['name'] as String,
    price: json['price'] == null ? 0.0 : json['price'].toDouble(),
    counter: json['counter'] as int
  );

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'imageUrl': imageUrl,
    'brand': brand,
    'name': name,
    'price': price,
    'counter': counter
  };
}