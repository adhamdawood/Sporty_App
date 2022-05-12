/// training_programs : [{"productId":"8f0afcf5-88d3-4679-9a66-ec3462b5f00b","descriptionMinimized":"The first Slam of the year, the 2019 Australian Open, opens with Dunlop as its new ball sponsor!","imageUrl":"http://sporty.somee.com/Images/Products/Tennis/AustralianOpen4BallTube.JPG","brand":"Dunlop","sportName":"Tennis","name":"Australian Open 4 Ball Tube.","price":870},{"productId":"ce84c3c5-90ff-4255-a711-6a0cd9a271d1","descriptionMinimized":"multi-layer fabric, Structured fabric, Fit: slim fit, straight cut, high-waist cut, loose cut","imageUrl":"http://sporty.somee.com/Images/Products/Tennis/CourtDriFitSkirtWomen.JPG","brand":"Head","sportName":"Tennis","name":"Court Dri-Fit Skirt Women","price":487},{"productId":"6335ed1f-fc72-48f8-a8ee-69b407cb96a6","descriptionMinimized":"The RADICAL bag series puts an end to compromise and the RADICAL 12R MONSTERCOMBI is the best proof as it combines all the room you need with all of the innovations you desire.","imageUrl":"http://sporty.somee.com/Images/Products/Tennis/HeadRadicalMonstercombiRacketBag.JPG","brand":"Head","sportName":"Tennis","name":"Head Radical Monstercombi Racket Bag","price":1122},{"productId":"23be7e57-5950-44a6-a2ee-74b1a0dd689b","descriptionMinimized":"Cross Section: 23mm Flat Beam, String Pattern:18x16, Unstrung weight: 290g, Unstrung Balance: 32.5 CM / 6 Pts HL, Head Size: 104 sq. in.","imageUrl":"http://sporty.somee.com/Images/Products/Tennis/WilsonBlade104WRT73331UTennisRacket.JPG","brand":"Wilson","sportName":"Tennis","name":"Wilson Blade 104 WRT73331U Tennis Racket","price":3500}]
/// trainingPrograms : [{"trainingProgramId":"333ffd40-d4be-4da8-be7c-bc6ba7e78db0","imageUrl":"http://sporty.somee.com/Images/Programs/Tennis/StarsTennisAcademy.jpg","descriptionMinimized":"At Stars Academy, we train tennis professionals, we train athletes, and we train individuals.","sportName":"Tennis","name":"Stars Tennis Academy","level":"All Levles"}]

class GetHomeData {
  GetHomeData({
      this.products, 
      this.trainingPrograms,});

  GetHomeData.fromJson(dynamic json) {
    if (json['training_programs'] != null) {
      products = [];
      json['training_programs'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    if (json['trainingPrograms'] != null) {
      trainingPrograms = [];
      json['trainingPrograms'].forEach((v) {
        trainingPrograms.add(TrainingPrograms.fromJson(v));
      });
    }
  }
  List<Products> products;
  List<TrainingPrograms> trainingPrograms;
GetHomeData copyWith({  List<Products> products,
  List<TrainingPrograms> trainingPrograms,
}) => GetHomeData(  products: products ?? this.products,
  trainingPrograms: trainingPrograms ?? this.trainingPrograms,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['training_programs'] = products.map((v) => v.toJson()).toList();
    }
    if (trainingPrograms != null) {
      map['trainingPrograms'] = trainingPrograms.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// trainingProgramId : "333ffd40-d4be-4da8-be7c-bc6ba7e78db0"
/// imageUrl : "http://sporty.somee.com/Images/Programs/Tennis/StarsTennisAcademy.jpg"
/// descriptionMinimized : "At Stars Academy, we train tennis professionals, we train athletes, and we train individuals."
/// sportName : "Tennis"
/// name : "Stars Tennis Academy"
/// level : "All Levles"

class TrainingPrograms {
  TrainingPrograms({
      this.trainingProgramId, 
      this.imageUrl, 
      this.descriptionMinimized, 
      this.sportName, 
      this.name, 
      this.level,});

  TrainingPrograms.fromJson(dynamic json) {
    trainingProgramId = json['trainingProgramId'];
    imageUrl = json['imageUrl'];
    descriptionMinimized = json['descriptionMinimized'];
    sportName = json['sportName'];
    name = json['name'];
    level = json['level'];
  }
  String trainingProgramId;
  String imageUrl;
  String descriptionMinimized;
  String sportName;
  String name;
  String level;
TrainingPrograms copyWith({  String trainingProgramId,
  String imageUrl,
  String descriptionMinimized,
  String sportName,
  String name,
  String level,
}) => TrainingPrograms(  trainingProgramId: trainingProgramId ?? this.trainingProgramId,
  imageUrl: imageUrl ?? this.imageUrl,
  descriptionMinimized: descriptionMinimized ?? this.descriptionMinimized,
  sportName: sportName ?? this.sportName,
  name: name ?? this.name,
  level: level ?? this.level,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trainingProgramId'] = trainingProgramId;
    map['imageUrl'] = imageUrl;
    map['descriptionMinimized'] = descriptionMinimized;
    map['sportName'] = sportName;
    map['name'] = name;
    map['level'] = level;
    return map;
  }

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