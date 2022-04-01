/// sportId : "2eb7d589-7dc9-453f-9a8d-00f53ef9449b"
/// name : "Gym"

class GetAllSports {
  GetAllSports({
      this.sportId, 
      this.name,});

  GetAllSports.fromJson(dynamic json) {
    sportId = json['sportId'];
    name = json['name'];
  }
  String sportId;
  String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sportId'] = sportId;
    map['name'] = name;
    return map;
  }

}