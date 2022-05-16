/// descriptionMinimized : "This is a complete program to help you get ripped. Feature includes detailed diet plan and cardio schedule, along with a 4 day upper/lower muscle building split."
/// date : "May 13, 2022"
/// sportName : "Gym"
/// pricePerMonth : 900
/// imageUrl : "http://www.sportyapi.somee.com/Images/Programs/Gym/FatDestroyerCompleteFatLossWorkout&DietProgram.PNG"
/// name : "Fat Destroyer: Complete Fat Loss Workout & Diet Program"
/// level : "Beginner"

class ProgramDetails {
  ProgramDetails({
      String descriptionMinimized, 
      String date, 
      String sportName, 
      int pricePerMonth, 
      String imageUrl, 
      String name, 
      String level,}){
    _descriptionMinimized = descriptionMinimized;
    _date = date;
    _sportName = sportName;
    _pricePerMonth = pricePerMonth;
    _imageUrl = imageUrl;
    _name = name;
    _level = level;
}

  ProgramDetails.fromJson(dynamic json) {
    _descriptionMinimized = json['descriptionMinimized'];
    _date = json['date'];
    _sportName = json['sportName'];
    _pricePerMonth = json['pricePerMonth'];
    _imageUrl = json['imageUrl'];
    _name = json['name'];
    _level = json['level'];
  }
  String _descriptionMinimized;
  String _date;
  String _sportName;
  int _pricePerMonth;
  String _imageUrl;
  String _name;
  String _level;
ProgramDetails copyWith({  String descriptionMinimized,
  String date,
  String sportName,
  int pricePerMonth,
  String imageUrl,
  String name,
  String level,
}) => ProgramDetails(  descriptionMinimized: descriptionMinimized ?? _descriptionMinimized,
  date: date ?? _date,
  sportName: sportName ?? _sportName,
  pricePerMonth: pricePerMonth ?? _pricePerMonth,
  imageUrl: imageUrl ?? _imageUrl,
  name: name ?? _name,
  level: level ?? _level,
);
  String get descriptionMinimized => _descriptionMinimized;
  String get date => _date;
  String get sportName => _sportName;
  int get pricePerMonth => _pricePerMonth;
  String get imageUrl => _imageUrl;
  String get name => _name;
  String get level => _level;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['descriptionMinimized'] = _descriptionMinimized;
    map['date'] = _date;
    map['sportName'] = _sportName;
    map['pricePerMonth'] = _pricePerMonth;
    map['imageUrl'] = _imageUrl;
    map['name'] = _name;
    map['level'] = _level;
    return map;
  }

}