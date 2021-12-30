// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

RegisterUser registerFromJson(String str) =>
    RegisterUser.fromJson(json.decode(str));

String registerToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  RegisterUser({
    this.user,
    this.tokens,
  });

  User? user;
  Tokens? tokens;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        user: User.fromJson(json["user"] ?? {}),
        tokens: Tokens.fromJson(json["tokens"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "tokens": tokens!.toJson(),
      };
}

class Tokens {
  Tokens({
    this.access,
    this.refresh,
  });

  Access? access;
  Access? refresh;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: Access.fromJson(json["access"] ?? {}),
        refresh: Access.fromJson(json["refresh"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "access": access!.toJson(),
        "refresh": refresh!.toJson(),
      };
}

class Access {
  Access({
    this.token,
    // this.expires,
  });

  String? token;
  // DateTime? expires;

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json["token"] ?? "",
        // expires: DateTime.parse(json["expires"]?? {}),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        // "expires": expires!.toIso8601String(),
      };
}

class User {
  User({
    this.role,
    this.isEmailVerified,
    this.name,
    this.email,
    this.id,
  });

  String? role;
  bool? isEmailVerified;
  String? name;
  String? email;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["role"],
        isEmailVerified: json["isEmailVerified"],
        name: json["name"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "isEmailVerified": isEmailVerified,
        "name": name,
        "email": email,
        "id": id,
      };
}
