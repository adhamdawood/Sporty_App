class TrainingModel {
  dynamic trainingProgramId;
  String descriptionMinimized;
  String imageUrl;
  String sportName;
  String name;
  String level;

  TrainingModel({
    this.trainingProgramId,
    this.descriptionMinimized,
    this.imageUrl,
    this.level,
    this.sportName,
    this.name,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) => TrainingModel(
    trainingProgramId: json['trainingProgramId'] as String,
    descriptionMinimized: json['descriptionMinimized'] as String,
    imageUrl: json['imageUrl'] as String,
    level: json['level'] as String,
    sportName: json['sportName'] as String,
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => {
    'trainingProgramId': trainingProgramId,
    'descriptionMinimized': descriptionMinimized,
    'imageUrl': imageUrl,
    'level': level,
    'sportName': sportName,
    'name': name,
  };
}