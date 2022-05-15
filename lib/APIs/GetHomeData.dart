
}

/// productId : "8f0afcf5-88d3-4679-9a66-ec3462b5f00b"
/// descriptionMinimized : "The first Slam of the year, the 2019 Australian Open, opens with Dunlop as its new ball sponsor!"
/// imageUrl : "http://sporty.somee.com/Images/Products/Tennis/AustralianOpen4BallTube.JPG"
/// brand : "Dunlop"
/// sportName : "Tennis"
/// name : "Australian Open 4 Ball Tube."
/// price : 870

class Products {
  Products({
      this.productId, 
      this.descriptionMinimized, 
      this.imageUrl, 
      this.brand, 
      this.sportName, 
      this.name, 
      this.price,});

  Products.fromJson(dynamic json) {
    productId = json['productId'];
    descriptionMinimized = json['descriptionMinimized'];
    imageUrl = json['imageUrl'];
    brand = json['brand'];
    sportName = json['sportName'];
    name = json['name'];
    price = json['price'];
  }
  String productId;
  String descriptionMinimized;
  String imageUrl;
  String brand;
  String sportName;
  String name;
  dynamic price;
Products copyWith({  String productId,
  String descriptionMinimized,
  String imageUrl,
  String brand,
  String sportName,
  String name,
  dynamic price,
}) => Products(  productId: productId ?? this.productId,
  descriptionMinimized: descriptionMinimized ?? this.descriptionMinimized,
  imageUrl: imageUrl ?? this.imageUrl,
  brand: brand ?? this.brand,
  sportName: sportName ?? this.sportName,
  name: name ?? this.name,
  price: price ?? this.price,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    map['descriptionMinimized'] = descriptionMinimized;
    map['imageUrl'] = imageUrl;
    map['brand'] = brand;
    map['sportName'] = sportName;
    map['name'] = name;
    map['price'] = price;
    return map;
  }

}