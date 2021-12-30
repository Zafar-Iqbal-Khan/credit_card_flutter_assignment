// class User {
//   User({
//     this.token,
//   });

//   String? token;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         token: json["token"] ?? "",
//       );
// }

class Access {
  String? token;
  Access({this.token});
  factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json["token"] ?? "",
      );
}

class Tokens {
  Tokens({
    this.access,
  });
  Access? access;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: json["token"] ?? "",
      );
}

class LoginResponseModel {
  // final User? user;
  final Tokens? token;

  LoginResponseModel({
    // this.user,
    this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      // user: User.fromJson(json["user"] ?? {}),
      token: Tokens.fromJson(json["tokens"] ?? {}),
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
