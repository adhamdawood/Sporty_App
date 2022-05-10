/// resetLink : {"href":"http://sporty.somee.com/api/Auth/ResetPassword?Token=Q2ZESjhKL2FFd3I3MHUxQnVjejBVeTZLMmYrdFMrVDNFSW1sRUxZTXJmZjZ5ZXd1ZTRJRE5MMi9qaERDbFJ1WjZ3bVl5c0pmS1pyZ1JkRHJQRXZvcHR0L0cxYVBUOWhnWldwN0RnV2J2TlZGMmZxUVdQbUJJZWhpeGtxbnJ2eU42bGk3SXFSM3RiN013WXI2eTFCeHBJR0w2aGp2RHZFMEtuWWxpaU9tcXJ3dnlwRko3ZzhGMWFPSmE0eGJmY3NFVTMzSXJaUUd3M2IyV1ViMFllTmtxYmJRenlOcnVvUEpOUzNtUE9HZW0rNDdlVmNY&Email=adham.am758@gmail.com","rel":"ResetPasswordLink","method":"POST"}

class CheckResetToken {
  CheckResetToken({
      this.resetLink,});

  CheckResetToken.fromJson(dynamic json) {
    resetLink = json['resetLink'] != null ? ResetLink.fromJson(json['resetLink']) : null;
  }
  ResetLink resetLink;
CheckResetToken copyWith({  ResetLink resetLink,
}) => CheckResetToken(  resetLink: resetLink ?? this.resetLink,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (resetLink != null) {
      map['resetLink'] = resetLink.toJson();
    }
    return map;
  }

}

/// href : "http://sporty.somee.com/api/Auth/ResetPassword?Token=Q2ZESjhKL2FFd3I3MHUxQnVjejBVeTZLMmYrdFMrVDNFSW1sRUxZTXJmZjZ5ZXd1ZTRJRE5MMi9qaERDbFJ1WjZ3bVl5c0pmS1pyZ1JkRHJQRXZvcHR0L0cxYVBUOWhnWldwN0RnV2J2TlZGMmZxUVdQbUJJZWhpeGtxbnJ2eU42bGk3SXFSM3RiN013WXI2eTFCeHBJR0w2aGp2RHZFMEtuWWxpaU9tcXJ3dnlwRko3ZzhGMWFPSmE0eGJmY3NFVTMzSXJaUUd3M2IyV1ViMFllTmtxYmJRenlOcnVvUEpOUzNtUE9HZW0rNDdlVmNY&Email=adham.am758@gmail.com"
/// rel : "ResetPasswordLink"
/// method : "POST"

class ResetLink {
  ResetLink({
      this.href, 
      this.rel, 
      this.method,});

  ResetLink.fromJson(dynamic json) {
    href = json['href'];
    rel = json['rel'];
    method = json['method'];
  }
  String href;
  String rel;
  String method;
ResetLink copyWith({  String href,
  String rel,
  String method,
}) => ResetLink(  href: href ?? this.href,
  rel: rel ?? this.rel,
  method: method ?? this.method,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    map['rel'] = rel;
    map['method'] = method;
    return map;
  }

}