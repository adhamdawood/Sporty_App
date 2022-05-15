/// products : [{"productId":"5bade43f-9b1b-4734-9f98-09d7407a2783","descriptionMinimized":"COPOZZ Swimming Cap for women ladies and adult, Comfortable waterproof silicone swimming hat.","imageUrl":"http://sporty.somee.com/Images/Products/Swimming/COPOZZlonghairswimcap.jpg","brand":"COPOZZ","sportName":"Swimming","name":"COPOZZ Long Hair Swim Cap","price":650},{"productId":"41b436e9-7e6f-49fb-9888-318e82aebc14","descriptionMinimized":"Reebok Treadmill delivers powerful and quiet performance with a top speed of 20 kph","imageUrl":"http://sporty.somee.com/Images/Products/Gym/ReebokJet300SeriesTreadmill.jpg","brand":"Reebok","sportName":"Gym","name":"Jet 300 Series Treadmill","price":21845},{"productId":"805be8f0-fb90-45e6-af93-1e6e4cf40f3c","descriptionMinimized":"150 lb dumbbell set package include- 5,10,15,20,25 lbs pair with rack. Total 2 boxes.","imageUrl":"http://sporty.somee.com/Images/Products/Gym/papababeFreeWeightsDumbbellsSet.jpg","brand":"Papababe","sportName":"Gym","name":"Papababe Free Weights Dumbbells Set","price":7068},{"productId":"f9a62370-99c7-4f6b-a709-30f191f65f4b","descriptionMinimized":"The traditional high quality collars steel that will clamp on your barbell without sliding or snapping.","imageUrl":"http://sporty.somee.com/Images/Products/Gym/SpringCollars.jpg","brand":"Garage Gear","sportName":"Gym","name":"Spring Collars","price":150},{"productId":"ec043374-747d-4188-9f15-0c41a65258a9","descriptionMinimized":" The Pro is the official on-field match ball for the 2022 Champions League finale.","imageUrl":"http://sporty.somee.com/Images/Products/Football/adidasUCLChampionsLeagueBall.jpg","brand":"adidas","sportName":"Football","name":"UCL Champions League Pro Soccer Ball","price":164.99}]
/// trainingPrograms : [{"trainingProgramId":"07f08695-7f29-43a5-b991-07cd1e4370a2","imageUrl":"http://sporty.somee.com/Images/Programs/Gym/FatDestroyerCompleteFatLossWorkout&DietProgram.PNG","descriptionMinimized":"This is a complete program to help you get ripped. Feature includes detailed diet plan and cardio schedule, along with a 4 day upper/lower muscle building split.","sportName":"Gym","name":"Fat Destroyer: Complete Fat Loss Workout & Diet Program","level":"Beginner"},{"trainingProgramId":"736683bc-fdf4-47a6-b099-0d2a8778b0c8","imageUrl":"http://sporty.somee.com/Images/Programs/Football/performanceanalystfootball.jpg","descriptionMinimized":"Performance analysis consist on tactical assessment, movement analysis, video and statistical databasing and modeling and coach and player data presentations.","sportName":"Football","name":"Football Performance Analysis","level":"For Professional Players"},{"trainingProgramId":"0051b5dd-b941-43f2-b0bd-56efb23cceea","imageUrl":"http://sporty.somee.com/Images/Programs/Swimming/AdultSwimming.jpg","descriptionMinimized":"Get to learn the skill of a lifetime, coached by certified, national swimming champions.","sportName":"Swimming","name":"Swimming Training For Adults","level":"Intermediate"},{"trainingProgramId":"671a7491-5a55-4089-8def-4555bb79a8f3","imageUrl":"http://sporty.somee.com/Images/Programs/Gym/TrainLikeaSuperheroFullBodyWorkout.PNG","descriptionMinimized":"Become a superhero! This full body workout routine trains several different necessary skill sets one may need.","sportName":"Gym","name":"Train Like a Superhero: Full Body Workout","level":"Intermediate"},{"trainingProgramId":"b87f9ac1-3448-4804-8463-35ea56f9f30f","imageUrl":"http://sporty.somee.com/Images/Programs/Gym/WorkoutstoShreddedMaximizeYourFatLosswiththisWorkout.PNG","descriptionMinimized":"Maximize your fat loss with this shred workout program. Plus, as a bonus - 5 tips to get the fattest loss out of the program!","sportName":"Gym","name":"Workouts to Shredded: Maximize Your Fat Loss with this Workout","level":"Advanced"}]

class GetData {
  GetData({
      this.products, 
      this.trainingPrograms,});

  GetData.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
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
GetData copyWith({  List<Products> products,
  List<TrainingPrograms> trainingPrograms,
}) => GetData(  products: products ?? this.products,
  trainingPrograms: trainingPrograms ?? this.trainingPrograms,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products.map((v) => v.toJson()).toList();
    }
    if (trainingPrograms != null) {
      map['trainingPrograms'] = trainingPrograms.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// trainingProgramId : "07f08695-7f29-43a5-b991-07cd1e4370a2"
/// imageUrl : "http://sporty.somee.com/Images/Programs/Gym/FatDestroyerCompleteFatLossWorkout&DietProgram.PNG"
/// descriptionMinimized : "This is a complete program to help you get ripped. Feature includes detailed diet plan and cardio schedule, along with a 4 day upper/lower muscle building split."
/// sportName : "Gym"
/// name : "Fat Destroyer: Complete Fat Loss Workout & Diet Program"
/// level : "Beginner"

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

/// productId : "5bade43f-9b1b-4734-9f98-09d7407a2783"
/// descriptionMinimized : "COPOZZ Swimming Cap for women ladies and adult, Comfortable waterproof silicone swimming hat."
/// imageUrl : "http://sporty.somee.com/Images/Products/Swimming/COPOZZlonghairswimcap.jpg"
/// brand : "COPOZZ"
/// sportName : "Swimming"
/// name : "COPOZZ Long Hair Swim Cap"
/// price : 650

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
  int price,
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