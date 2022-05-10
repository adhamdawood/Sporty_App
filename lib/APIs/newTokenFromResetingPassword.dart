/// id : "208b9d3c-8f3a-416f-9e41-82b586f916f2"
/// name : "adham dawood"
/// email : "adham.am758@gmail.com"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI2MzE1M2NlYy0yMWU3LTQzMjAtYmNiZi02NTc5NmI2NTAzOWEiLCJlbWFpbCI6ImFkaGFtLmFtNzU4QGdtYWlsLmNvbSIsInVpZCI6IjIwOGI5ZDNjLThmM2EtNDE2Zi05ZTQxLTgyYjU4NmY5MTZmMiIsImV4cCI6MTY1NDg5NjY1MiwiaXNzIjoiVGVzdEpXVEFwaSIsImF1ZCI6IlRlc3RKV1RBcGlVc2VyIn0.51p3Om2REEYhzPG4lYiSnqWsb5Ob_boG64b395YAsc4"
/// refreshTokenExpiration : "2022-07-10T18:50:03.5555435"
/// refreshToken : "VyOMrn/mwVvA91+eMYm5p01zjOBgKz8csbnae/ZYYyE="

class NewTokenFromResetingPassword {
  NewTokenFromResetingPassword({
      this.id, 
      this.name, 
      this.email, 
      this.token, 
      this.refreshTokenExpiration, 
      this.refreshToken,});

  NewTokenFromResetingPassword.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
    refreshToken = json['refreshToken'];
  }
  String id;
  String name;
  String email;
  String token;
  String refreshTokenExpiration;
  String refreshToken;
NewTokenFromResetingPassword copyWith({  String id,
  String name,
  String email,
  String token,
  String refreshTokenExpiration,
  String refreshToken,
}) => NewTokenFromResetingPassword(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  token: token ?? this.token,
  refreshTokenExpiration: refreshTokenExpiration ?? this.refreshTokenExpiration,
  refreshToken: refreshToken ?? this.refreshToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['token'] = token;
    map['refreshTokenExpiration'] = refreshTokenExpiration;
    map['refreshToken'] = refreshToken;
    return map;
  }

}