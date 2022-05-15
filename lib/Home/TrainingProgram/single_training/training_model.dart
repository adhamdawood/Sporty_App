class SingleTrainingModel {
  String trainingProgramId;
  String description;
  String imageUrl;
  String provider;
  String location;
  String sportName;
  String name;
  String level;
  dynamic pricePerMonth;
  bool isReserved;

  SingleTrainingModel({
    this.trainingProgramId,
    this.description,
    this.imageUrl,
    this.provider,
    this.location,
    this.sportName,
    this.name,
    this.level,
    this.pricePerMonth,
    this.isReserved,
  });

  factory SingleTrainingModel.fromJson(Map<String, dynamic> json) => SingleTrainingModel(
    trainingProgramId: json['trainingProgramId'] as String,
    description: json['description']  as String,
    imageUrl: json['imageUrl'] as String,
    provider: json['provider'] as String,
    location: json['location'] as String,
    sportName: json['sportName'] as String,
    name: json['name'] as String,
    level: json['level'] as String,
    isReserved: json['isReserved'] as bool,
    pricePerMonth: json['pricePerMonth'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'trainingProgramId': trainingProgramId,
    'description': description,
    'imageUrl': imageUrl,
    'provider': provider,
    'location': location,
    'sportName': sportName,
    'name': name,
    'level': level,
    'isReserved': isReserved,
    'pricePerMonth': pricePerMonth,
  };
}