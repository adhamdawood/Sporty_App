/// id : "198b1e32-b8ec-4c07-9134-c2c1aff85958"
/// name : "adham dawood"
/// email : "adhamdawood@gmail.com"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJmYzA0MjI1Mi04YmY0LTQ2OWQtOWY2Mi03Zjg2MjNiYzZlMjMiLCJlbWFpbCI6ImFkaGFtZGF3b29kQGdtYWlsLmNvbSIsInVpZCI6IjE5OGIxZTMyLWI4ZWMtNGMwNy05MTM0LWMyYzFhZmY4NTk1OCIsImV4cCI6MTY1MzU5NzM0OCwiaXNzIjoiVGVzdEpXVEFwaSIsImF1ZCI6IlRlc3RKV1RBcGlVc2VyIn0.QJTPLRnKEnXbzX_Z7c1ufsqk5hRV0P2x9ycGXAaVCxk"
/// refreshTokenExpiration : "2022-06-14T14:39:28.242853"
/// refreshToken : "vC+ew3vwW3L1kv5IZt8AcuCPMIUF+VOBRW/7Q/m3QhA="

class LoginResponse {
  LoginResponse({
      this.id, 
      this.name, 
      this.email, 
      this.token, 
      this.refreshTokenExpiration, 
      this.refreshToken,});

  LoginResponse.fromJson(dynamic json) {
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